package com.example.student_course_app.controller;

import com.example.student_course_app.entity.Student;
import com.example.student_course_app.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    private StudentRepository studentRepo;

    @PostMapping
    public Student createStudent(@RequestBody Student student) {
        return studentRepo.save(student);
    }

    @GetMapping("/{id}")
    public Student getStudent(@PathVariable Long id) {
        return studentRepo.findById(id).orElse(null);
    }

    @GetMapping
    public List<Student> getAllStudents() {
        return studentRepo.findAll();
    }
}
