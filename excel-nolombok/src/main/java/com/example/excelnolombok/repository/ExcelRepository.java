
package com.example.excelnolombok.repository;

import com.example.excelnolombok.entity.ExcelFile;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExcelRepository extends JpaRepository<ExcelFile, Long> {
}
