package top.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

public class MyRealm extends AuthorizingRealm{

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo(); 
		return simpleAuthorInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0) throws AuthenticationException {
		 AuthenticationInfo authcInfo = new SimpleAuthenticationInfo("玄玉", "xuanyu", this.getName());  
         this.setSession("currentUser", "玄玉");  
         return authcInfo;  
	}
    private void setSession(Object key, Object value){  
        Subject currentUser = SecurityUtils.getSubject();  
        if(null != currentUser){  
            Session session = currentUser.getSession();  
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");  
            if(null != session){  
                session.setAttribute(key, value);  
            }  
        }  
    }  

}
