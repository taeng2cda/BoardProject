package com.spring.datatree.Vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class UsersVo {
	private String userid;
	private String pw;
	private String name;
	private String phone;
	private String enabled;
	private Date regdate;
	
}
