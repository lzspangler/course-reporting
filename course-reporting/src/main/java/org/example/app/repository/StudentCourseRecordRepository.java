package org.example.app.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import org.example.app.domain.Course;

public interface StudentCourseRecordRepository extends MongoRepository<Course, Long> {


}
