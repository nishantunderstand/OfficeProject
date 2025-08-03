
package com.example.excelnolombok.controller;

import com.example.excelnolombok.entity.ExcelFile;
import com.example.excelnolombok.service.ExcelService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class ExcelController {

    private final ExcelService excelService;

    public ExcelController(ExcelService excelService) {
        this.excelService = excelService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<ExcelFile> files = excelService.getAll();
        model.addAttribute("files", files);
        return "index";
    }

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file) {
        excelService.upload(file);
        return "redirect:/";
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<InputStreamResource> download(@PathVariable Long id) throws IOException {
        ByteArrayInputStream stream = excelService.download(id);
        ExcelFile file = excelService.getFile(id);
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + file.getName() + ".zip")
            .contentType(MediaType.APPLICATION_OCTET_STREAM)
            .body(new InputStreamResource(stream));
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @RequestParam("file") MultipartFile file) {
        excelService.update(id, file);
        return "redirect:/";
    }
}
