package com.kh.fourweeks.error;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class TargetNotFoundException extends RuntimeException{
	public TargetNotFoundException(String message) {
		super(message);
	}
}
