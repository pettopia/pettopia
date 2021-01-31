/*=========================
   StudentController.java
=========================*/
package com.pettopia.jw;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
   
   @RequestMapping(value = "/main.action", method = RequestMethod.GET)
   public String mainlist(Model model)
   {
      String result = null;
      
      result = "/WEB-INF/views/main.jsp";
      
      return result;
   }
   
   @RequestMapping(value = "/petdiary.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String petdiary(Model model)
   {
      String result = null;
      
      result = "/WEB-INF/views/DiaryInfo.jsp";
      
      return result;
   }
   
}