package com.example.exceltemplate.controller;

import com.example.exceltemplate.service.TemplateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/excel")
@Slf4j
@RequiredArgsConstructor
public class TemplateController {

    private final TemplateService templateService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/template")
    public ResponseEntity<InputStreamResource> downloadTemplate() throws IOException {
        log.info("Template download requested");
        return templateService.getTemplateFile();
    }
}
