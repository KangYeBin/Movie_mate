package com.ictproject.moviemate.domain.movie.service;


import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.mapper.MovieMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class MovieService {

    private final MovieMapper movieMapper;
    public void getKoficData() {
        String requestUri = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";

        String key = "1be896b2d0185ed05b72d42954db4ea5";
        URI uri = UriComponentsBuilder
                .fromUriString(requestUri)
                .queryParam("key", key)
                .queryParam("targetDt","20231111")
                .encode()
                .build()
                .toUri();
        log.info("uri = " + uri);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> forEntity = restTemplate.getForEntity(uri, String.class);
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(forEntity.getBody().toString());
            JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
            JSONArray boxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
            for (int i = 0; i < boxOfficeList.size()-9; i++) {
                JSONObject boxOffice = (JSONObject) boxOfficeList.get(i);
                String movieCd = boxOffice.get("movieCd").toString();
                String movieNm = boxOffice.get("movieNm").toString();
                String openDt = boxOffice.get("openDt").toString().replace("-","");
                String audiAcc = boxOffice.get("audiAcc").toString();
                Map<String,String> list = getKMDBData(movieNm,openDt);
                Movie movie = Movie.builder()
                        .movieCd(movieCd)
                        .movieName(movieNm)
                        .openDate(openDt)
                        .audiAcc(audiAcc)
                        .director(list.get("director"))
                        .imageUrl(list.get("imageUri"))
                        .nation(list.get("nation"))
                        .plot(list.get("plot"))
                        .runtime(list.get("runtime"))
                        .rating(list.get("rating"))
                        .vodUrl(list.get("vodUri"))
                        .build();
                System.out.println(movie.toString());
            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }



    }

    private Map<String,String> getKMDBData(String movieNm, String openDt) {
        String requestUri = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2";
        String key = "S2Z5007W5L76LWH10HHJ";
        URI uri = UriComponentsBuilder
                .fromUriString(requestUri)
                .queryParam("ServiceKey", key)
                .queryParam("title", movieNm)
                .queryParam("releaseDts",openDt)
                .encode()
                .build()
                .toUri();
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> forEntity = restTemplate.getForEntity(uri, String.class);
        JSONParser parser = new JSONParser();
        Map<String,String> kmdbData = new HashMap<String,String>();

        try {
            JSONObject jsonObject = (JSONObject)parser.parse(forEntity.getBody().toString());
            JSONArray data = (JSONArray) jsonObject.get("Data");
            JSONObject dataList = (JSONObject) data.get(0);
            JSONArray result = (JSONArray) dataList.get("Result");
            JSONObject resultList = (JSONObject) result.get(0);
            String nation = resultList.get("nation").toString();
            String rating = resultList.get("rating").toString();
            String keyword = resultList.get("keywords").toString();
            String imageUri = resultList.get("posters").toString();
            String runtime = resultList.get("runtime").toString();
            String genre = resultList.get("genre").toString();
            String director = getDirector(resultList);
            String actors = getActors(resultList);
            String plot = getPlot(resultList);
            String vodUri = getVodUri(resultList);
            kmdbData.put("nation", nation);
            kmdbData.put("rating", rating);
            kmdbData.put("keyword", keyword);
            kmdbData.put("imageUri", imageUri);
            kmdbData.put("runtime", runtime);
            kmdbData.put("genre", genre);
            kmdbData.put("director", director);
            kmdbData.put("actors", actors);
            kmdbData.put("plot", plot);
            kmdbData.put("vodUri", vodUri);

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
}
