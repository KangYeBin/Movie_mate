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
    @GetMapping("/")
    public String index() {
        String start = "2023910";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        try {
            LocalDate startDate = LocalDate.parse(start, formatter);
            for (int i = 0; i <= 50; i++) {
                String date = startDate.minusDays(i).format(formatter);
                movieService.getKoficData(date);
                if(i==50){
                    System.out.println("끝 : = " + date);
                }
            }
        } catch (Exception e) {
            System.out.println("날짜를 파싱하는 동안 오류가 발생했습니다: " + e.getMessage());
        }

        return "index";
    }
}
