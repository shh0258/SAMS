package sams;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
    MemberMapper memberMapper;
	
	public String validateBeforeInsert(Member member) {
        String s = member.getName();
        if (StringUtils.isBlank(s))
            return "이름을 입력하세요";
        
        

//        Member member2 = memberMapper.selectById(s);
//        if (member2 != null)
//            return "로그인ID가 중복됩니다.";

        return null;
    }
	

	public static Member getCurrentMember() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof MyAuthenticationProvider.MyAuthenticaion)
            return ((MyAuthenticationProvider.MyAuthenticaion) authentication).getMember();
        return null;
    }

    public static void setCurrentMember(Member member) {
        ((MyAuthenticationProvider.MyAuthenticaion)
                SecurityContextHolder.getContext().getAuthentication()).setMember(member);
    }

}


