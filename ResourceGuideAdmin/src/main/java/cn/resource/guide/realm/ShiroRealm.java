package cn.resource.guide.realm;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.resource.guide.entity.Function;
import cn.resource.guide.entity.Role;
//import cn.resource.guide.controller.LoginController;
import cn.resource.guide.entity.User;
import cn.resource.guide.services.ShiroService;

public class ShiroRealm extends AuthorizingRealm {
	private static final Logger logger = Logger.getLogger(ShiroRealm.class);
	@Autowired
	private ShiroService shiroService;

	/**
	 * 认证回调函数, 登录时调用
	 * 
	 * @author Mr.GoldenWan
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		// 2. 从 UsernamePasswordToken 中来获取 username
		// 3. 调用数据库的方法, 从数据库中查询 username 对应的用户记录
		User user = shiroService.getUserByName(token.getUsername());
		if (user != null) {
			if (user.getIslock() == 1) {
				logger.info("msg:该已帐号禁止登录.");
				throw new AuthenticationException("msg:该已帐号禁止登录.");
			}
			SimpleAuthenticationInfo info = null;
			ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());

			if (token.getUsername().equals(user.getUsername())) {
				info = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), credentialsSalt,  getName());
				return info;
			} else {
				throw new UnknownAccountException("用户名错误");
			}
		} else
			logger.info("用户不存在！");
			throw new UnknownAccountException("用户不存在！");
	}

	public static void main(String[] args) {
		String hashAlgorithmName = "MD5";// sha1
		Object credentials = "123456";
		Object salt = ByteSource.Util.bytes("root");
		int hashIterations = 1024;

		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		System.out.println(result);
	}

	/**
	 * 授权查询回调函数, 进行鉴权当缓存中无用户的授权信息时调用
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 1. 从 PrincipalCollection 中来获取登录用户的信息
		// Object principal = principals.getPrimaryPrincipal();

		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
		String currentUsername = (String) super.getAvailablePrincipal(principals);
		User user = shiroService.getUserByName(currentUsername);
		if (user == null) {
			throw new AuthenticationException("msg:用户不存在。");
		}
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		// 权限
		List<Role> roleList = shiroService.getRoleByUserId(user.getId());
		// 操作
		List<Function> permList = shiroService.getPermissionByUserId(user.getId());

		if (roleList != null && roleList.size() > 0) {
			for (Role role : roleList) {
				if (role.getName() != null) {
					// 添加角色
					logger.info("role.getName():"+role.getName());
					simpleAuthorInfo.addRole(role.getName());
				}
			}
		}

		if (permList != null && permList.size() > 0) {
			for (Function perm : permList) {
				if (perm.getName() != null) {
					logger.info("perm.getName():"+perm.getName());

					// 添加权限
					simpleAuthorInfo.addStringPermission(perm.getName());
				}
			}
		}
		return simpleAuthorInfo;
	}


}
