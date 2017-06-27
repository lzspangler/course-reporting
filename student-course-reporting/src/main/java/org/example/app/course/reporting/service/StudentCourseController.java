package org.example.app.course.reporting.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StudentCourseController {

	@RequestMapping(value = "/student-course-reports", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String createUpdateCourses() {
		return ("Hello student course reporting service");
	}

}
