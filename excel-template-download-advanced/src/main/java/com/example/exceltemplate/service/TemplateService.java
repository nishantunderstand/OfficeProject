package com.example.exceltemplate.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Object;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.time.Duration;

@Service
@RequiredArgsConstructor
@Slf4j
public class TemplateService {

    private final RedisTemplate<String, byte[]> redisTemplate;
    private final S3Client s3Client;

    @Value("${excel.template.bucket}")
    private String bucket;

    @Value("${excel.template.key}")
    private String key;

    public ResponseEntity<InputStreamResource> getTemplateFile() throws IOException {
        byte[] fileBytes = redisTemplate.opsForValue().get(key);
        if (fileBytes == null) {
            log.info("Fetching template from S3...");
            fileBytes = s3Client.getObject(GetObjectRequest.builder().bucket(bucket).key(key).build()).readAllBytes();
            redisTemplate.opsForValue().set(key, fileBytes, Duration.ofMinutes(10));
        } else {
            log.info("Template loaded from Redis cache.");
        }

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=Report2025.xlsx");

        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(fileBytes.length)
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(new InputStreamResource(new ByteArrayInputStream(fileBytes)));
    }
}
