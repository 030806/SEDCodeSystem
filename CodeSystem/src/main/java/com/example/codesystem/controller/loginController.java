package com.example.codesystem.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class loginController {
    @RequestMapping("/")
    public String login()
    {
        return "";
    }

    @RequestMapping("/logout")
    public String logout()// HttpServletRequest request
    {
//        HttpSession session = request.getSession(false);
//        if (session != null) {
//            session.invalidate();
//        }
        return "";  //返回登陆页
    }

    @RequestMapping("/ToMine")
    public String toMine()
    {
        return "";
    }  //返回个人信息页
}
