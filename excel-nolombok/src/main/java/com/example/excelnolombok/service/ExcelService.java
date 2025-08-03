
package com.example.excelnolombok.service;

import com.example.excelnolombok.entity.ExcelFile;
import com.example.excelnolombok.repository.ExcelRepository;
import com.example.excelnolombok.util.VirusScanner;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class ExcelService {

    private final ExcelRepository repository;
    private final VirusScanner virusScanner;

    public ExcelService(ExcelRepository repository) {
        this.repository = repository;
        this.virusScanner = new VirusScanner();
    }

    public void upload(MultipartFile file) {
        validate(file);
        virusScanner.scan(file);
        try {
            ExcelFile excelFile = new ExcelFile(file.getOriginalFilename(), file.getBytes());
            repository.save(excelFile);
        } catch (IOException e) {
            throw new RuntimeException("Failed to upload file", e);
        }
    }

    public ByteArrayInputStream download(Long id) {
        ExcelFile file = repository.findById(id).orElseThrow();
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
             ZipOutputStream zos = new ZipOutputStream(baos)) {
            zos.putNextEntry(new ZipEntry(file.getName()));
            zos.write(file.getData());
            zos.closeEntry();
            return new ByteArrayInputStream(baos.toByteArray());
        } catch (IOException e) {
            throw new RuntimeException("Failed to create zip", e);
        }
    }

    public void update(Long id, MultipartFile file) {
        validate(file);
        virusScanner.scan(file);
        ExcelFile existing = repository.findById(id).orElseThrow();
        try {
            existing.setData(file.getBytes());
            existing.setName(file.getOriginalFilename());
            repository.save(existing);
        } catch (IOException e) {
            throw new RuntimeException("Failed to update file", e);
        }
    }

    public List<ExcelFile> getAll() {
        return repository.findAll();
    }

    public ExcelFile getFile(Long id) {
        return repository.findById(id).orElseThrow();
    }

    private void validate(MultipartFile file) {
        if (file.getSize() > 10 * 1024 * 1024) {
            throw new RuntimeException("File too large (max 10MB)");
        }
        String name = file.getOriginalFilename();
        if (!(name.endsWith(".xls") || name.endsWith(".xlsx"))) {
            throw new RuntimeException("Only .xls or .xlsx allowed");
        }
        try {
            WorkbookFactory.create(file.getInputStream()).close();
        } catch (Exception e) {
            throw new RuntimeException("Invalid Excel format", e);
        }
    }
}
