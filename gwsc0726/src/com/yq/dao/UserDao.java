package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.User;

public interface UserDao {
	@Insert("insert into s_user(username,password,orgid,roleid,state,remark,photo) value(#{username},#{password},#{orgid},#{roleid},#{state},#{remark},#{photo})")
	public void insert(User user);
	@Select("select * from s_user where username=#{username} and password=#{password}")
	public List<User> login(User user);
	@Select("select * from s_user")
	public List<User> select(User user);
	@Delete("delete from s_user where id=#{id}")
	public void delete(int id);
	@Update("update  s_user  set password=#{password}  where id=#{id}")
	public void update(User user);


	
}
