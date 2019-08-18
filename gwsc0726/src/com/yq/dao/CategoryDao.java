package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.Category;

public interface CategoryDao {
	@Select("select * from s_category")
	public List<Category> select();
	@Insert("insert into s_category(name,type,photo) value(#{name},#{type},#{photo})")
	public void insert(Category category);
	@Delete("delete from s_category where id=#{id}")
	public void delete(int id);
	@Select("select * from s_category where id=#{id}")
	public Category edit(int id);
	@Update("update s_category set name=#{name}, type=#{type},photo=#{photo} where id=#{id}")
	public void update(Category category);
	
	public List<Category> ajaxselect1(Category category); //Ìõ¼þ²éÑ¯
	
	@Select("select * from s_category where type=#{type}")
	public List<Category> select2(Category category);
}
