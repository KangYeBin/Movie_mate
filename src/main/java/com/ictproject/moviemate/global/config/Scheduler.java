package com.ictproject.moviemate.global.config;


import com.ictproject.moviemate.domain.movie.service.MovieApiService;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@EnableScheduling
@RequiredArgsConstructor
@Component
public class Scheduler {
    private final MovieApiService movieApiService;
    @Scheduled(cron = "0 0 12 * * ?")
    public void scheduler() {
        String start = LocalDate.now().toString();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(start, formatter);
        String date = startDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        movieApiService.getKoficData(date);

    }
}
