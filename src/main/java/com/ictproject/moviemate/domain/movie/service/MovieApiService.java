package com.ictproject.moviemate.domain.movie.service;


import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.mapper.MovieMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class MovieApiService {

    private final MovieMapper movieMapper;
    private final ActorService actorService;
    private final GenreService genreService;
    private final KeywordService keywordService;


    public void getKoficData(String date) {
        String requestUri = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
        //자신 키로 바꾸기  8803352a1e880950e1e1d4a12c9c3186
        String key = "1be896b2d0185ed05b72d42954db4ea5";
        URI uri = UriComponentsBuilder
                .fromUriString(requestUri)
                .queryParam("key", key)
                .queryParam("targetDt", date) //박스오피스 조회 날짜 변경
                .encode()
                .build()
                .toUri();
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> forEntity = restTemplate.getForEntity(uri, String.class);
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(forEntity.getBody().toString());
            JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
            JSONArray boxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
            for (int i = 0; i < boxOfficeList.size(); i++) {
                JSONObject boxOffice = (JSONObject) boxOfficeList.get(i);
                String movieCd = boxOffice.get("movieCd").toString();
                if(movieMapper.isExist(movieCd)){
                    System.out.println("중복된 데이터 = " + movieCd);
                    continue;
                }
                String movieNm = boxOffice.get("movieNm").toString();
                String openDt = boxOffice.get("openDt").toString().replace("-","");

                if(openDt.trim().isEmpty()){
                    System.out.println("개봉날짜 없음");
                    continue;
                }
                String audiAcc = boxOffice.get("audiAcc").toString();
                Map<String,String> data = getData(movieCd,key);
                String prodDt = data.get("prodDt");
                String director = data.get("director");
                System.out.println(movieCd +"--" + openDt + "--"+ prodDt + "--"+ director);
                Map<String,String> list = getKMDBData(movieNm,openDt,prodDt,director);
                if(list == null){
                    continue;
                }
                Movie movie = Movie.builder()
                        .movieCd(movieCd)
                        .movieName(movieNm)
                        .openDate(openDt)
                        .audiAcc(audiAcc)
                        .director(list.get("director"))
                        .imageUrl(list.get("imageUrl"))
                        .nation(list.get("nation"))
                        .plot(list.get("plot"))
                        .runtime(list.get("runtime"))
                        .rating(list.get("rating"))
                        .vodUrl(list.get("vodUrl"))
                        .stillUrl(list.get("stillUrl"))
                        .build();
                movieMapper.insertMovie(movie);
                String genre = list.get("genre");
                String actors = list.get("actors");
                String keyword = list.get("keyword");
                actorService.insertActors(actors,movieCd);
                genreService.insertGenre(genre,movieCd);
                keywordService.insertKeyword(keyword,movieCd);

            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }



    }

    private Map<String,String> getData(String movieCd, String key) {
        String requestUri = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
        URI uri = UriComponentsBuilder
                .fromUriString(requestUri)
                .queryParam("key" ,key)
                .queryParam("movieCd",movieCd)
                .encode()
                .build()
                .toUri();
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> forEntity = restTemplate.getForEntity(uri, String.class);
        JSONParser parser = new JSONParser();
        Map<String, String> map = new HashMap<>();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(forEntity.getBody().toString());
            JSONObject movieInfoResult = (JSONObject) jsonObject.get("movieInfoResult");
            JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");
            String prdtYear = movieInfo.get("prdtYear").toString();
            map.put("prodDt", prdtYear);
            JSONArray directors = (JSONArray) movieInfo.get("directors");

            if(directors.isEmpty()){
                map.put("director","");
            }else{
                JSONObject director = (JSONObject) directors.get(0);
                map.put("director",director.get("peopleNm").toString());
            }
            return map;

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

    }

    private Map<String,String> getKMDBData(String movieNm, String openDt, String prodDt,String dir) {
        String requestUri = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2";
        //자신의 키로 바꾸기 69C45GJ8M39Y91VGMEBI
        String key = "S2Z5007W5L76LWH10HHJ";
        URI uri = UriComponentsBuilder
                .fromUriString(requestUri)
                .queryParam("ServiceKey", key)
                .queryParam("title", movieNm)
                .queryParam("releaseDts",openDt)
                .queryParam("createDts",prodDt)
                .queryParam("director",dir)
                .queryParam("detail","Y")
                .encode()
                .build()
                .toUri();
        System.out.println(uri.toString());
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> forEntity = restTemplate.getForEntity(uri, String.class);
        JSONParser parser = new JSONParser();
        Map<String,String> kmdbData = new HashMap<String,String>();

        try {
            JSONObject jsonObject = (JSONObject)parser.parse(forEntity.getBody().toString());
            JSONArray data = (JSONArray) jsonObject.get("Data");
            JSONObject dataList = (JSONObject) data.get(0);
            JSONArray result = (JSONArray) dataList.get("Result");
            if(result == null){
                System.out.println("빈 데이터 = " + movieNm);
                return null;
            }
            JSONObject resultList = (JSONObject) result.get(0);
            String nation = resultList.get("nation").toString();
            String rating = resultList.get("rating").toString();
            String keyword = resultList.get("keywords").toString();
            String imageUri = resultList.get("posters").toString();
            String runtime = resultList.get("runtime").toString();
            String genre = resultList.get("genre").toString();
            String stillUri = cutUrl(resultList.get("stlls").toString());
            String director = getDirector(resultList).replaceAll("[^가-힣]","");
            String actors = getActors(resultList);
            String plot = getPlot(resultList);
            String vodUri = getVodUri(resultList);
            kmdbData.put("nation", nation);
            kmdbData.put("rating", rating);
            kmdbData.put("keyword", keyword);
            kmdbData.put("imageUrl", imageUri);
            kmdbData.put("runtime", runtime);
            kmdbData.put("genre", genre);
            kmdbData.put("director", director);
            kmdbData.put("actors", actors);
            kmdbData.put("plot", plot);
            kmdbData.put("vodUrl", vodUri);
            kmdbData.put("stillUrl", stillUri);

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return kmdbData;
    }

    private String getVodUri(JSONObject resultList) {
        JSONObject vods = (JSONObject) resultList.get("vods");
        JSONArray vodList = (JSONArray) vods.get("vod");
        JSONObject one = (JSONObject) vodList.get(0);
        return one.get("vodUrl").toString();
    }

    private String getPlot(JSONObject resultList) {
        JSONObject plots = (JSONObject) resultList.get("plots");
        JSONArray plotList = (JSONArray) plots.get("plot");
        JSONObject one = (JSONObject) plotList.get(0);
        return one.get("plotText").toString();

    }

    private String getActors(JSONObject resultList) {
        StringBuilder actor = new StringBuilder();
        JSONObject actors = (JSONObject) resultList.get("actors");
        JSONArray actorList = (JSONArray) actors.get("actor");
        int len = Math.min(actorList.size(), 3);
        for(int i=0;i<len;i++){
            JSONObject one = (JSONObject) actorList.get(i);
            actor.append(one.get("actorNm"));
            actor.append(",");
            if(i==len-1){
                actor.deleteCharAt(actor.length()-1);
            }
        }
        return actor.toString();
    }

    private String getDirector(JSONObject resultList) {
        JSONObject directors = (JSONObject) resultList.get("directors");
        JSONArray directorList = (JSONArray) directors.get("director");
        JSONObject one = (JSONObject) directorList.get(0);
        return one.get("directorNm").toString();
    }
    private String cutUrl(String url){
        String result = "";
        if(url.contains("|")){
            result=url.substring(0,url.indexOf("|"));
        }else{
            result=url;
        }
        return result;
    }
}
