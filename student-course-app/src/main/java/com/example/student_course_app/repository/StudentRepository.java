package com.example.student_course_app.repository;

import com.example.student_course_app.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {
}
