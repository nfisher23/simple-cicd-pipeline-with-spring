package com.nickolasfisher.simplecicd;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloWorldController {

    @GetMapping(value = {"/", ""})
    public ResponseEntity<String> notAnotherHelloWorld() {
        return new ResponseEntity<>("okay, I guess we'll call this a hello world", HttpStatus.OK);
    }
}
