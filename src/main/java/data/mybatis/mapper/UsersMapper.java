package data.mybatis.mapper;

import com.spring.datatree.Vo.AuthorityVo;
import com.spring.datatree.Vo.UsersVo;

public interface UsersMapper {
	
	int UsersInsert(UsersVo vo);
	int AuthorityInsert(AuthorityVo vo);
	UsersVo UsersLogin(UsersVo vo);
	AuthorityVo SelectAuthority(String userid);
}
