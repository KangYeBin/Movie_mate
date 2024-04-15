package com.ictproject.moviemate;


import com.ictproject.moviemate.domain.movie.service.MovieApiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequiredArgsConstructor
public class IndexController {
    private final MovieApiService movieService;
    @GetMapping("/getMovieData")
    public String index() {
        
        String start = "20220305";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        try {
            LocalDate startDate = LocalDate.parse(start, formatter);
            for (int i = 0; i <= 100; i++) {
                String date = startDate.minusDays(i).format(formatter);
                System.out.println(date);
                movieService.getKoficData(date);
                if(i==100){
                    System.out.println("끝 : = " + date);
                }
            }
        } catch (Exception e) {
            System.out.println("날짜를 파싱하는 동안 오류가 발생했습니다: " + e.getMessage());
        }

        return "index";
    }
}
