package com.my.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.my.spring.dao.CategoryDAO;
import com.my.spring.exception.CategoryException;
import com.my.spring.pojo.Category;
import com.my.spring.validator.CategoryValidator;

@Controller
@RequestMapping("/category/*")
public class CategoryController {

		@Autowired
		@Qualifier("categoryValidator")
		CategoryValidator categoryValidator;
		
		@Autowired
		@Qualifier("categoryDao")
		CategoryDAO categoryDAO;

		@InitBinder
		private void initBinder(WebDataBinder binder) {
			binder.setValidator(categoryValidator);
		}

		@RequestMapping(value = "/category/add", method = RequestMethod.POST)
		public ModelAndView addCategory(@ModelAttribute("category") Category category, BindingResult result) throws Exception {
			
			categoryValidator.validate(category, result);
			
			if (result.hasErrors()) {
				return new ModelAndView("category-form", "category", category);
			}

			try {				
				category = categoryDAO.create(category.getTitle());
			} catch (CategoryException e) {
				System.out.println(e.getMessage());
				return new ModelAndView("error", "errorMessage", "error while login");
			}
			return new ModelAndView("category-success", "category", category);
			
		}

		@RequestMapping(value="/category/add", method = RequestMethod.GET)
		public ModelAndView initializeForm() throws Exception {			
			return new ModelAndView("category-form", "category", new Category());
		}
		
		@RequestMapping(value="category/ajaxservice",method = RequestMethod.POST)
		@ResponseBody
		public String ajaxService(HttpServletRequest request)
		{
			String queryString= request.getParameter("course");
			String result="";
			List<Category> catList = null;
			try {
				catList = categoryDAO.list();
			} catch (CategoryException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (int i=0;i<catList.size();i++)
			{
				if(catList.get(i).getTitle().toLowerCase().contains(queryString.toLowerCase()))
				{
					result+= catList.get(i);
				}
			}
			
			return result;
			
		}


}