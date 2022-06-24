package data.mybatis.mapper;

import java.util.HashMap;

import com.spring.datatree.Vo.AuthorityVo;
import com.spring.datatree.Vo.UsersVo;

public interface UsersMapper {
	
	int UsersInsert(UsersVo vo);
	int AuthorityInsert(AuthorityVo vo);
	UsersVo UsersLogin(HashMap<String, String> map);
	AuthorityVo SelectAuthority(String userid);
}
