package com.yq.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yq.bean.User;
import com.yq.dao.UserDao;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserDao userDao;
	
	/*
	 * 添加用户
	 */
	@RequestMapping("insert")
	public String insert(MultipartFile up,User u,HttpServletRequest request) {
		long size=up.getSize();		
		if(size>0) {
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("images/photo");
			File dest=new File(realpath,filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			u.setPhoto(filename);
		}	
		userDao.insert(u);
		return "redirect:/user/select";
		
	}
	/*
	 * 登陆
	 */
	@RequestMapping("login")
	public String login(User u,Model model,HttpSession session) {
		List<User> list=userDao.login(u);
		if(list.size()==0) {
			return "login";
		}
		session.setAttribute("u", list.get(0));
		return "index";
	}
	/*
	 * 退出
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("u");
		return "login";
	}
	/*
	 * 查询
	 */
	@RequestMapping("select")
	public String select(User u,Model model) {
		List<User> list=userDao.select(u);
		model.addAttribute("users", list);
		return "userList";
	}
	/*
	 * 删除
	 */
	@RequestMapping("delete")
	public String delete(int id) {
		userDao.delete(id);
		return "forward:/user/select";
	}
	/*
	 * 修改密码
	 */
	@RequestMapping("update")
	public String update(User u) {
		userDao.update(u);
		return "forward:/user/select";
	}


}
