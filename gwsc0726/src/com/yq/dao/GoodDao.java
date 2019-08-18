package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.Good;

public interface GoodDao {
	@Select("select * from s_good order by sort asc,createdate desc ")
	public List<Good> select();
	@Insert("insert into s_good(name,oldprice,newprice,remark,cid,num,photo,createdate,sort,standard) value(#{name},#{oldprice},#{newprice},#{remark},#{cid},#{num},#{photo},now(),#{sort},#{standard})")
	public void insert(Good good);
	@Delete("delete from s_good where id=#{id}")
	public void delete(int id);
	@Select("select * from s_good where id=#{id}")
	public Good edit(int id);
	@Update("update s_good set name=#{name},oldprice=#{oldprice},newprice=#{newprice},remark=#{remark},cid=#{cid},num=#{num},photo=#{photo},sort=#{sort},standard=#{standard},createdate=now() where id=#{id}")
	public void update(Good good);
	@Select("select * from s_good  where cid=#{cid} order by sort asc,createdate desc limit #{begin},#{rows}")
	public List<Good> ajaxselect(Good good);
	@Select("select count(*)from s_good where cid=#{cid}")
	public int selectcount(int cid);
}
