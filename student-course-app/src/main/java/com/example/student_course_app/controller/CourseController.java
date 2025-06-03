package com.example.student_course_app.controller;

import com.example.student_course_app.entity.Course;
import com.example.student_course_app.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/courses")
public class CourseController {

    @Autowired
    private CourseRepository courseRepo;

    @PostMapping
    public Course createCourse(@RequestBody Course course) {
        return courseRepo.save(course);
    }

    @GetMapping
    public List<Course> getAllCourses() {
        return courseRepo.findAll();
    }

    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable Long id) {
        return courseRepo.findById(id).orElse(null);
    }
}
