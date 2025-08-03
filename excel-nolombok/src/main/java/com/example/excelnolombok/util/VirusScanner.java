
package com.example.excelnolombok.util;

import org.springframework.web.multipart.MultipartFile;

public class VirusScanner {
    public void scan(MultipartFile file) {
        if (file.getOriginalFilename().contains("virus")) {
            throw new RuntimeException("Virus detected!");
        }
    }
}
