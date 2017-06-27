package org.example.app.course.domain;

import java.sql.Timestamp;

import org.springframework.data.annotation.Id;

public class Section {

	@Id
	private long id;

	private String sectionName;

	private Boolean successfullyCompleted;

	private String studentComments;

	private Timestamp lastUpdatedTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public Boolean isSuccessfullyCompleted() {
		return successfullyCompleted;
	}

	public void setSuccessfullyCompleted(Boolean successfullyCompleted) {
		this.successfullyCompleted = successfullyCompleted;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((lastUpdatedTime == null) ? 0 : lastUpdatedTime.hashCode());
		result = prime * result + ((sectionName == null) ? 0 : sectionName.hashCode());
		result = prime * result + ((studentComments == null) ? 0 : studentComments.hashCode());
		result = prime * result + (successfullyCompleted ? 1231 : 1237);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Section other = (Section) obj;
		if (id != other.id)
			return false;
		if (lastUpdatedTime == null) {
			if (other.lastUpdatedTime != null)
				return false;
		} else if (!lastUpdatedTime.equals(other.lastUpdatedTime))
			return false;
		if (sectionName == null) {
			if (other.sectionName != null)
				return false;
		} else if (!sectionName.equals(other.sectionName))
			return false;
		if (studentComments == null) {
			if (other.studentComments != null)
				return false;
		} else if (!studentComments.equals(other.studentComments))
			return false;
		if (successfullyCompleted != other.successfullyCompleted)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Section [id=" + id + ", sectionName=" + sectionName + ", successfullyCompleted=" + successfullyCompleted
				+ ", studentComments=" + studentComments + ", lastUpdatedTime=" + lastUpdatedTime + "]";
	}

}