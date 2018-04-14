package sams;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationProvider implements AuthenticationProvider {

    @Autowired MemberMapper memberMapper;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String phone_number_id = authentication.getName();
        String pword = authentication.getCredentials().toString();
        return authenticate(phone_number_id, pword);
    }

    public Authentication authenticate(String phone_number_id, String pword) throws AuthenticationException {
        Member member = memberMapper.selectByPhoneId(phone_number_id);
        if (member == null) return null;
//        if (member.getPword().equals(encryptPasswd(pword)) == false) return null;
        if (member.getPword().equals(pword) == false) return null;
        
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_전체"));
        grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + member.getPosition()));
        return new MyAuthenticaion(phone_number_id, pword, grantedAuthorities, member);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

//    public static String encryptPasswd(String passwd) {
//        try {
//            MessageDigest md = MessageDigest.getInstance("MD5");
//            byte[] passBytes = passwd.getBytes();
//            md.reset();
//            byte[] digested = md.digest(passBytes);
//            StringBuffer sb = new StringBuffer();
//            for(int i=0;i<digested.length;i++)
//                sb.append(Integer.toHexString(0xff & digested[i]));
//            return sb.toString();
//        }
//        catch (Exception e) {
//            return passwd;
//        }
//    }

    public class MyAuthenticaion extends UsernamePasswordAuthenticationToken {
        private static final long serialVersionUID = 1L;
        Member member;

        public MyAuthenticaion (String loginId, String passwd, List<GrantedAuthority> grantedAuthorities, Member member) {
            super(loginId, passwd, grantedAuthorities);
            this.member = member;
        }

        public Member getMember() {
            return member;
        }

        public void setMember(Member member) {
            this.member = member;
        }
    }
}
