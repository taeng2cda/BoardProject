package com.spring.datatree.Vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class AuthorityVo {
	private String userid;
	private String authority;
	
	
	//superadmin
	//admin
	//member
}
