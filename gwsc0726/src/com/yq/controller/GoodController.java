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
import com.yq.bean.Good;
import com.yq.dao.CategoryDao;
import com.yq.dao.GoodDao;

@Controller
@RequestMapping("good")
public class GoodController {
	@Resource
	private GoodDao goodDao;
	@Resource
	private CategoryDao categoryDao;
	
	/*
	 * 查询所有商品
	 */
	@RequestMapping("select")
	public String select(Good good,Model model) {
		List<Good> list=goodDao.select();
		model.addAttribute("goods", list);
		return "goodList";
	}
	/*
	 * 添加商品信息
	 */
	@RequestMapping("insert")
	public String insert(MultipartFile up,Good good,HttpServletRequest request) {
		long size=up.getSize();
		if(size>0) {
			String filename =up.getOriginalFilename();
			String realpath=request.getRealPath("images/gphoto");
			File dest=new File(realpath,filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			good.setPhoto(filename);
		}
		goodDao.insert(good);
		return "redirect:/good/select";
	}
	/*
	 * 删除
	 */
	@RequestMapping("delete")
	public String delete(int id) {
		goodDao.delete(id);
		return "forward:/good/select";
	}
	/*
	 * 修改预加载
	 */
	@RequestMapping("edit")
	public String edit(int id,Model model) {
		Good good =goodDao.edit(id);
		model.addAttribute("gs",good);
		List<Category> list=categoryDao.select();
		model.addAttribute("cs", list);
		return "goodEdit";
	}
	/*
	 * 修改
	 */
	@RequestMapping("update")
	public String update(MultipartFile up,Good good,HttpServletRequest request) {
		long size=up.getSize();
		if(size>0) {
			String filename =up.getOriginalFilename();
			String realpath=request.getRealPath("images/gphoto");
			File dest=new File(realpath,filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			good.setPhoto(filename);
		}
		goodDao.update(good);
		return "forward:/good/select";
	}
	/*
	 * 预添加
	 */
	@RequestMapping("insertone")
	public String insertone(Model model) {
		List<Category> list=categoryDao.select();
		model.addAttribute("cs", list);
		return "goodAdd";
	}
	/*
	 * jsonp方式的ajax查询
	 */
	@RequestMapping(value="ajaxselect" ,produces="text/html;charset=utf-8")
	@ResponseBody
	public String ajaxselect(Good good,String callback) {
		System.out.println(callback);
		good.setBegin((good.getPage()-1)*good.getRows());
		List<Good> list = goodDao.ajaxselect(good);
		Gson gson=new Gson();
		String str=gson.toJson(list);
		String s=callback+"("+str+")";
		System.out.println(s);
		return s;
		
	}
	/*
	 * 分页查询ajax
	 */
	@RequestMapping(value="ajaxcount" ,produces="text/html;charset=utf-8")
	@ResponseBody
	public String ajaxcount(Good good,String callback){
		System.out.println(callback);
		int count=goodDao.selectcount(good.getCid());
		System.out.println(count);
		int pages=count%good.getRows()==0?count/good.getRows():count/good.getRows()+1;
		Gson gson=new Gson();
		String str=gson.toJson(pages);
		String s=callback+"("+str+")";
		System.out.println(s);
		return s;
	}
	/*
	 * 显示页detail
	 */
	@RequestMapping(value="ajaxdetail",produces="text/html;charset=utf-8")
	@ResponseBody
	public String ajaxdetail(String callback,int id) {
		System.out.println(callback);
		Good good=goodDao.edit(id);
		Gson g=new Gson();
		String s=g.toJson(good);
		String msg=callback+"("+s+")";
		System.out.println(msg);
		return msg;
	}

}
