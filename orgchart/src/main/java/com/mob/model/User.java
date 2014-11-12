package com.mob.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.mob.custom.validator.annotation.EmailValidator;

@Entity
public class User implements Serializable {

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((contactNo == null) ? 0 : contactNo.hashCode());
		result = prime * result + ((emailId == null) ? 0 : emailId.hashCode());
		result = prime * result
				+ ((fullName == null) ? 0 : fullName.hashCode());
		result = prime * result + ((hobbies == null) ? 0 : hobbies.hashCode());
		result = prime * result + (isActive ? 1231 : 1237);
		result = prime * result + (isResourceManager ? 1231 : 1237);
		result = prime * result
				+ ((jobDescription == null) ? 0 : jobDescription.hashCode());
		result = prime * result
				+ ((latitude == null) ? 0 : latitude.hashCode());
		result = prime * result
				+ ((longitude == null) ? 0 : longitude.hashCode());
		result = prime * result
				+ ((officeContactNo == null) ? 0 : officeContactNo.hashCode());
		result = prime
				* result
				+ ((resourceManagerId == null) ? 0 : resourceManagerId
						.hashCode());
		result = prime * result + (int) (userId ^ (userId >>> 32));
		result = prime * result
				+ ((userPicture == null) ? 0 : userPicture.hashCode());
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
		User other = (User) obj;
		if (contactNo == null) {
			if (other.contactNo != null)
				return false;
		} else if (!contactNo.equals(other.contactNo))
			return false;
		if (emailId == null) {
			if (other.emailId != null)
				return false;
		} else if (!emailId.equals(other.emailId))
			return false;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		if (hobbies == null) {
			if (other.hobbies != null)
				return false;
		} else if (!hobbies.equals(other.hobbies))
			return false;
		if (isActive != other.isActive)
			return false;
		if (isResourceManager != other.isResourceManager)
			return false;
		if (jobDescription == null) {
			if (other.jobDescription != null)
				return false;
		} else if (!jobDescription.equals(other.jobDescription))
			return false;
		if (latitude == null) {
			if (other.latitude != null)
				return false;
		} else if (!latitude.equals(other.latitude))
			return false;
		if (longitude == null) {
			if (other.longitude != null)
				return false;
		} else if (!longitude.equals(other.longitude))
			return false;
		if (officeContactNo == null) {
			if (other.officeContactNo != null)
				return false;
		} else if (!officeContactNo.equals(other.officeContactNo))
			return false;
		if (resourceManagerId == null) {
			if (other.resourceManagerId != null)
				return false;
		} else if (!resourceManagerId.equals(other.resourceManagerId))
			return false;
		if (userId != other.userId)
			return false;
		if (userPicture == null) {
			if (other.userPicture != null)
				return false;
		} else if (!userPicture.equals(other.userPicture))
			return false;
		return true;
	}

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "USER_ID")
	private long userId;

	@Column(name = "EMAIL_ID")
	@EmailValidator(message = "please enter email as name@mobiquityinc.com")
	private String emailId;

	@Column(name = "FULL_NAME")
	@NotNull
	@Size(min = 1, max = 40)
	private String fullName;

	@Column(name = "CONTACT_NO")
	@NotNull
	@Size(min = 8, max = 25)
	private String contactNo;

	@Column(name = "OFFICE_CONTACT_NO")
	private String officeContactNo;

	@Column(name = "JOB_DESCRIPTION")
	private String jobDescription;

	@Column(name = "HOBBIES")
	private String hobbies;

	@Column(name = "IS_ACTIVE")
	@NotNull
	private boolean isActive;

	@Column(name = "IS_RESOURCE_MANAGER")
	// @NotNull
	private boolean isResourceManager;

	@Column(name = "USER_PICTURE")
	private String userPicture;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "TITLE_ID")
	// @NotNull
	private Title titleId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "OFFICE_ADDRESS_ID")
	@NotNull
	private OfficeAddress officeLocationId;

	@Column(name = "RESOURCE_MANAGER_ID")
	private Long resourceManagerId;

	@Column(name = "LATITUDE")
	private Double latitude;

	@Column(name = "LONGITUDE")
	private Double longitude;

	/* Getter Setter */
	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getOfficeContactNo() {
		return officeContactNo;
	}

	public void setOfficeContactNo(String officeContactNo) {
		this.officeContactNo = officeContactNo;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public boolean isResourceManager() {
		return isResourceManager;
	}

	public void setResourceManager(boolean isResourceManager) {
		this.isResourceManager = isResourceManager;
	}

	public String getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}

	public Title getTitleId() {
		return titleId;
	}

	public void setTitleId(Title titleId) {
		this.titleId = titleId;
	}

	public OfficeAddress getOfficeLocationId() {
		return officeLocationId;
	}

	public void setOfficeLocationId(OfficeAddress officeLocationId) {
		this.officeLocationId = officeLocationId;
	}

	public Long getResourceManagerId() {
		return resourceManagerId;
	}

	public void setResourceManagerId(Long resourceManagerId) {
		this.resourceManagerId = resourceManagerId;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

}