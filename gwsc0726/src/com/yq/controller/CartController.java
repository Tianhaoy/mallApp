package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.yq.bean.Cart;
import com.yq.dao.CartDao;

@RestController
@RequestMapping("cart")
public class CartController {
	@Resource
	private CartDao cartDao;
	
	@RequestMapping(value="select",produces="text/html;charset=utf-8")
	public String select(Cart cart,String callback) {
		Cart c=cartDao.select(cart);
		Gson g=new Gson();
		String s=g.toJson(c);
		String msg=callback+"("+s+")";
		return msg;
	}
	
	/*
	 * ajax查询购物车
	 */
	@RequestMapping(value="ajaxselect",produces="text/html;charset=utf-8")
	public String ajaxselect(int uid ,String callback){
		List<Cart> list =cartDao.ajaxselect(uid);
		Gson gson=new Gson();
		String s=gson.toJson(list);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;		
	}
	/*
	 * ajax添加购物车
	 */
	@RequestMapping(value="ajaxinsert",produces="text/html;charset=utf-8")
	public String ajaxinsert(Cart cart,String callback) {
		boolean f=true;
		try {
			cartDao.insert(cart);			
		} catch (Exception e) {
			f=false;
			e.printStackTrace();
		}
		Gson gson=new Gson();
		String s=gson.toJson(f);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;
	}
	/*
	 * ajax修改购物车
	 */
	@RequestMapping(value="ajaxupdate",produces="text/html;charset=utf-8")
	public String ajaxupdate(Cart cart,String callback) {
		boolean f=true;
		try {
			cartDao.update(cart);			
		} catch (Exception e) {
			f=false;
			e.printStackTrace();
		}
		Gson gson=new Gson();
		String s=gson.toJson(f);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;
	}	
	/*
	 * ajax删除购物车
	 */
	@RequestMapping(value="ajaxdelete",produces="text/html;charset=utf-8")
	public String delete(int id,String callback) {
		boolean f=true;
		try {
			cartDao.delete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			f=false;
			e.printStackTrace();
		}
		Gson gson=new Gson();
		String s=gson.toJson(f);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;
	}
}
