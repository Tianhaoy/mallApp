package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.Cart;

public interface CartDao {
	
	@Select("select c.*,g.name name, g.standard standard, g.newprice newprice,g.photo photo,g.remark remark from s_cart c,s_good g where c.gid=g.id and c.uid=#{uid}")
	public List<Cart> ajaxselect(int uid);
	@Insert("insert into s_cart(gid,uid,num) values(#{gid},#{uid},#{num})")
	public void insert(Cart cart);
	@Update("update s_cart set num=#{num} where id=#{id}")
	public void update(Cart cart);
	@Select("select * from s_cart where gid=#{gid} and uid=#{uid}")
	public Cart select(Cart cart);
	@Delete("delete from s_cart where id=#{id}")
	public void delete(int id);

}
