package com.kh.fourweeks.service;


import java.io.IOException;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

public interface AttachmentService {
	ResponseEntity<ByteArrayResource> load(int attachmentNo) throws IOException;
}
