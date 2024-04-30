package com.ictproject.moviemate;


import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.movie.service.MovieApiService;
import com.ictproject.moviemate.domain.movie.service.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class IndexController {
    private final MovieApiService movieApiService;
    private final MovieService movieService;

    @GetMapping("/getMovieData")
    public String index() {
        String start = "20110624";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        try {
            LocalDate startDate = LocalDate.parse(start, formatter);
            for (int i = 0; i <= 1000; i++) {
                String date = startDate.minusDays(i).format(formatter);
                System.out.println(date);
                movieApiService.getKoficData(date);
                if(i==1000){
                    System.out.println("끝 : = " + date);
                }
            }
        } catch (Exception e) {
            System.out.println("날짜를 파싱하는 동안 오류가 발생했습니다: " + e.getMessage());
        }

        return "index";
    }
    @GetMapping("/swiper")
    public String swiper(Model model) {
        model.addAttribute("recentData", movieService.getRecentData());
        model.addAttribute("korea", movieService.getNationData("대한민국"));
        return "swiperexample";
    }
    // 에러 테스트
    @GetMapping("/error404")
    public String error404() {
        return "error/error404";
    }
}
