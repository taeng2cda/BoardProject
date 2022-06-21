package com.spring.datatree.Vo;

import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PhotoVo {
	private MultipartFile FileData;
	private String callback;
	private String callback_func;

}
