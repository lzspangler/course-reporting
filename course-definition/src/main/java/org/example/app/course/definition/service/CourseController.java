package org.example.app.course.definition.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {

	@RequestMapping(value = "/courses", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String getCourses() {
		return ("Hello course service");
	}

}
