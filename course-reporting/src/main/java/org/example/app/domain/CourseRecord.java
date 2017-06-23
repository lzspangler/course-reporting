package org.example.app.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "courses")
public class CourseRecord {

    @Id
    private long id;

    private String courseName;
    private String studentId;
    //private List<Lab> labs;
    

}
