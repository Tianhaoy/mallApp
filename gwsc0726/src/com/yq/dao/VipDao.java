package com.yq.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yq.bean.Vip;

public interface VipDao {
	@Insert("insert into s_vip(name,password,email,photo) value(#{name},#{password},#{email},#{photo})")
	public int insert(Vip vip);
	@Select("select * from s_vip where name=#{name} and password=#{password}")
	public Vip login(Vip vip);
}
