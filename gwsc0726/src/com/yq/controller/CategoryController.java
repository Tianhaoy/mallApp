package com.yq.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yq.bean.Category;
import com.yq.dao.CategoryDao;

@Controller
@RequestMapping("category")
public class CategoryController {
	@Resource
	private CategoryDao categoryDao;
	
	/*
	 * 查询所有显示到categotyList中
	 */
	@RequestMapping("select")
	public String select(Model model) {
		List<Category> list =categoryDao.select();
		model.addAttribute("categorys", list);
		return "categoryList";
	}
	/*
	 * 添加姓名类型照片文件到数据库
	 */
	@RequestMapping("insert")
	public String insert(MultipartFile up,Category category,HttpServletRequest request) {
		long size=up.getSize();
		if(size>0) {
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("images/cphoto");
			File dest=new File(realpath,filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			category.setPhoto(filename);
		}
		categoryDao.insert(category);
		return "redirect:/category/select";
	}
	/*
	 * 删除
	 */
	@RequestMapping("delete")
	public String delete(int id) {
		categoryDao.delete(id);
		return "forward:/category/select";
	}
	/*
	 * 修改预加载
	 */
	@RequestMapping("edit")
	public String edit(int id,Model model) {
		Category category =categoryDao.edit(id);
		model.addAttribute("cs", category);
		return "categoryEdit";
	}
	/*
	 * 修改
	 */
	@RequestMapping("update")
	public String update(MultipartFile up,Category category,HttpServletRequest request) {
		long size=up.getSize();
		if(size>0) {
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("images/cphoto");
			File dest=new File(realpath,filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			category.setPhoto(filename);
		}
		categoryDao.update(category);
		return "forward:/category/select";
	}
	/*
	 * 条件查询模糊查询 xml 
	 */
	@RequestMapping("ajaxselect1")
	public String ajaxselect1(Category category,Model model) {
		List<Category> list=categoryDao.ajaxselect1(category);
		String msg="";
		if(list.size()==0) {
			msg="没有查询到你输入的分类名，请换个关键字重新输入！";
		}
		model.addAttribute("categorys", list);
		model.addAttribute("msg", msg);
		return "categoryList";
	}
	/*
	 * 根据类型查询
	 */
	@RequestMapping("selecttype")
	public String select2(Category category,Model model) {
		List<Category> list=categoryDao.select2(category);
		model.addAttribute("categorys", list);
		return "categoryList";
				
	}
	
	/*	 
	 * jsonp方式的ajax查询
	 */
	@RequestMapping(value="ajaxselect",produces="text/html;charset=utf-8")
	@ResponseBody
	public String ajaxselect(String callback) {
		System.out.println(callback);
		List<Category> list=categoryDao.select();
		//show('admin')
		Gson gson=new Gson();
		String str=gson.toJson(list);
		String s=callback+"("+str+")";
		System.out.println(s);
		return s;
		
	}


}
