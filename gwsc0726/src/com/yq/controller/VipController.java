package com.yq.controller;

import javax.annotation.Resource;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.google.gson.Gson;
import com.yq.bean.Vip;
import com.yq.dao.VipDao;

@RestController
@RequestMapping("vip")
public class VipController {
	@Resource
	private VipDao vipDao;
	
	/*
	 * 注册用户ajax
	 */
	@RequestMapping(value="ajaxinsert",produces="text/html;charset=utf-8")
	public String insert(Vip vip,String callback) {
		int rows=vipDao.insert(vip);		
		Gson gson=new Gson();
		String s=gson.toJson(rows);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;
	}
	/*
	 * 登陆用户ajax
	 */
	@RequestMapping(value="ajaxlogin",produces="text/html;charset=utf-8")
	public String login(Vip vip,String callback) {
		Vip v=vipDao.login(vip);
		Gson gson=new Gson();
		String s=gson.toJson(v);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;		
	}
}
