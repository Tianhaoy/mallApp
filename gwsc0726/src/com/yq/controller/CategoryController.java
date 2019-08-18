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
	 * ��ѯ������ʾ��categotyList��
	 */
	@RequestMapping("select")
	public String select(Model model) {
		List<Category> list =categoryDao.select();
		model.addAttribute("categorys", list);
		return "categoryList";
	}
	/*
	 * �������������Ƭ�ļ������ݿ�
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
	 * ɾ��
	 */
	@RequestMapping("delete")
	public String delete(int id) {
		categoryDao.delete(id);
		return "forward:/category/select";
	}
	/*
	 * �޸�Ԥ����
	 */
	@RequestMapping("edit")
	public String edit(int id,Model model) {
		Category category =categoryDao.edit(id);
		model.addAttribute("cs", category);
		return "categoryEdit";
	}
	/*
	 * �޸�
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
	 * ������ѯģ����ѯ xml 
	 */
	@RequestMapping("ajaxselect1")
	public String ajaxselect1(Category category,Model model) {
		List<Category> list=categoryDao.ajaxselect1(category);
		String msg="";
		if(list.size()==0) {
			msg="û�в�ѯ��������ķ��������뻻���ؼ����������룡";
		}
		model.addAttribute("categorys", list);
		model.addAttribute("msg", msg);
		return "categoryList";
	}
	/*
	 * �������Ͳ�ѯ
	 */
	@RequestMapping("selecttype")
	public String select2(Category category,Model model) {
		List<Category> list=categoryDao.select2(category);
		model.addAttribute("categorys", list);
		return "categoryList";
				
	}
	
	/*	 
	 * jsonp��ʽ��ajax��ѯ
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
