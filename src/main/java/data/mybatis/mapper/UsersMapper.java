package data.mybatis.mapper;

import com.spring.datatree.Security.CustomUserDetail;
import com.spring.datatree.Vo.UsersVo;
import com.spring.datatree.Vo.Users_AuthorityVo;

public interface UsersMapper {
	CustomUserDetail getAuths(String userid);
	int UserInsert(UsersVo vo);
	int AuthInsert(Users_AuthorityVo vo);
}
