package com.wmz.cakeonlineshop.user.service;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wmz.cakeonlineshop.entity.User;
import com.wmz.cakeonlineshop.user.dao.UserDaoImpl;

@Service
@Transactional(readOnly = false)
public class UserServiceImpl {

	@Resource
	private UserDaoImpl userDaoImpl;

	/**
	 * 添加用户
	 * @param user
	 */
	public void addUser(User user) {
		java.util.Date date = new java.util.Date(); // 获取一个Date对象
		Timestamp timeStamp = new Timestamp(date.getTime()); // 讲日期时间转换为数据库中的timestamp类型
		user.setRegistertime(timeStamp);
		userDaoImpl.insertUser(user);
	}

	/**
	 * 判断是否允许用户注册
	 * @param user
	 * @param queren
	 * @return
	 */
	public int admitRegister(User user,String queren) {
		if (user.getEmail() == null || user.getEmail().equals("")) {
			return 1;// email为空
		} else if (userDaoImpl.findByEmail(user.getEmail()) == true) {
			return 2;// email已被注册
		} else if (user.getName() == null || user.getName().equals("")) {
			return 3;// 名字为空
		} else if (user.getAddress() == null || user.getAddress().equals("")) {
			return 4;// 地址为空
		} else if (user.getPhone() == null || user.getPhone().equals("")) {
			return 5;// 电话为空
		} else if (user.getPassword() == null || user.getPassword().equals("")) {
			return 6;// 密码为空
		} else if (!(user.getPassword().equals(queren))) {
			return 7;// 密码前后不一致
		} else {
			return 0;// 注册成功
		}
	}
	
	/**
	 * 判断是否允许用户登录
	 * @param email
	 * @param password
	 * @param checkbox
	 * @return
	 */
	public int admitLogin(String email,String password,String[] checkbox) {
		if(userDaoImpl.findByEmailPsd(email, password)==true) {
			if(checkbox!=null) {
				return 0;//符合登录条件,且保持自动登录
			}else {
				return 1;//符合登录条件
			}
		}else {
			if(userDaoImpl.findByEmail(email)==true) {
				return 2;//密码错误
			}
		}
		return 3;//用户不存在
	}
}
