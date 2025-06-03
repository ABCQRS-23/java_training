package com.example.student_course_app.repository;

import com.example.student_course_app.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
