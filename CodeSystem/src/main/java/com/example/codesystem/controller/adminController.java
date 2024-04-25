package com.example.codesystem.controller;
import jakarta.annotation.Resource;


import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/admin")
public class adminController {
    /**
     * 默认情况下，访问主页
     * @return 主页
     */
    @RequestMapping("/")
    public String admin()
    {
        return "admin/home";
    }

    /**
     * 访问主页
     * @return 主页
     */
    @RequestMapping("/home")
    public String adminHome()
    {
        return "admin/home";
    }
}
