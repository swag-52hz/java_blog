package controller;

import com.github.pagehelper.PageInfo;
import entity.Admin;
import entity.Result;
import entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import service.AdminService;
import service.RoleService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private AdminService adminService;
    @RequestMapping("/toAdd")
    public String add(ModelMap modelMap){
        List<Role> roles = roleService.selectAll();
        modelMap.put("roles", roles);
        return "add.jsp";
    }

    @RequestMapping("/list")
    public String list(@RequestParam Map<String, Object> map, ModelMap modelMap){
        PageInfo<Admin> pageInfo = adminService.selectByPage(map);
        modelMap.put("pageInfo", pageInfo);
        return "list.jsp";
    }

    // method:指定http请求方法
    @RequestMapping(value="/add", method = RequestMethod.POST)
    public String add(Admin admin){
        adminService.insert(admin);
        return "redirect:list";
    }

    @ResponseBody
    @GetMapping("/delete")
    public Result delete(Integer id){
        boolean status = adminService.delete(id);
        // 将返回对象转换成json格式
        return status?new Result(200, "删除成功！"):new Result(500, "删除失败！");
    }

    @RequestMapping("/login")
    public String login(String account, String password, Model model, HttpSession session){
        Admin admin = adminService.selectByAccount(account);
        if(admin!=null&&admin.getPassword().equals(password)){
            // 将用户信息存入session
            session.setAttribute("admin", admin);
            return "redirect:list";
        }else{
            model.addAttribute("error", "用户名或密码错误！");
            return "/login.jsp";
        }
    }

    @RequestMapping("/test")
    public String test(){
        Admin admin = adminService.selectWithRoleMapping(8);
        System.out.println("查询用户："+admin);
        System.out.println("用户角色："+admin.getRole());
        System.out.println("===admin与role之间的关联查询===");
        Admin admin1 = adminService.selectWithOperatorMapping(8);
        System.out.println("查询用户："+admin1);
        System.out.println("用户操作人："+admin1.getRunner());
        System.out.println("===admin与operator之间的关联查询===");
        return "/index.jsp";
    }
}
