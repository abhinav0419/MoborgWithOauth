package com.mob.custom.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.mob.custom.validator.annotation.EmailValidator;

public class ValidateEmail implements ConstraintValidator<EmailValidator, String> {
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@mobiquityinc.com";

	@Override
	public void initialize(EmailValidator arg0) {
	}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext arg1) {
		Pattern pattern = Pattern.compile(EMAIL_PATTERN);
		Matcher matcher = pattern.matcher(email);
		if (!matcher.matches()) {
			System.out.println("------------------email not okay !" + email);
			return false;
		} else{
			System.out.println("------------------email okay !" + email);
			return true;
			
		}	}

}
