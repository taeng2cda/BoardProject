package com.spring.datatree.Security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import com.spring.datatree.Vo.Users_AuthorityVo;


// 사용자 인증에 대한 정보를 갖는 클래스
public class CustomUserDetail implements UserDetails{
	
	private String userid;
	private String password;
	private String enabled;
	private List<Users_AuthorityVo> authList;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auths= new ArrayList<GrantedAuthority>();
		for(Users_AuthorityVo vo : authList) {
			auths.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		//사용자 권한을 담은 컬렉션 객체를 리턴
		return auths;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
 
	
}
