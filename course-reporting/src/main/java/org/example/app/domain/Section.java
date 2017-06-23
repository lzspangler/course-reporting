package org.example.app.domain;

import java.sql.Timestamp;

import org.springframework.data.annotation.Id;

public class Section {

	@Id
	private long id;

	private String sectionName;

	private boolean successfullyCompleted = false;

	private String comment;

	private Timestamp timestamp;

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

	public boolean isSuccessfullyCompleted() {
		return successfullyCompleted;
	}

	public void setSuccessfullyCompleted(boolean successfullyCompleted) {
		this.successfullyCompleted = successfullyCompleted;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((sectionName == null) ? 0 : sectionName.hashCode());
		result = prime * result + (successfullyCompleted ? 1231 : 1237);
		result = prime * result + ((timestamp == null) ? 0 : timestamp.hashCode());
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
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (id != other.id)
			return false;
		if (sectionName == null) {
			if (other.sectionName != null)
				return false;
		} else if (!sectionName.equals(other.sectionName))
			return false;
		if (successfullyCompleted != other.successfullyCompleted)
			return false;
		if (timestamp == null) {
			if (other.timestamp != null)
				return false;
		} else if (!timestamp.equals(other.timestamp))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Section [id=" + id + ", sectionName=" + sectionName + ", successfullyCompleted=" + successfullyCompleted
				+ ", comment=" + comment + ", timestamp=" + timestamp + "]";
	}

}
