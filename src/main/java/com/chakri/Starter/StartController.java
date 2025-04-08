package com.chakri.Starter;

import jdk.internal.org.jline.utils.Log;
import org.apache.tomcat.jni.Time;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@RestController
public class StartController {
    private static final Logger log = LoggerFactory.getLogger(StartController.class);

    @GetMapping("/hello")
    public String one()
    {
        log.info("This is hello string {}", LocalDateTime.now());
        return "hello";

    }
}
