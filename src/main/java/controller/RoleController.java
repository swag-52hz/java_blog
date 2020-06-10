package controller;

import entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.RoleService;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("/add")
    public String add(Role role){
        System.out.println("进入控制层方法");
        roleService.add(role);
        return "redirect:list";
    }

    @RequestMapping("/list")
    public String list(ModelMap modelMap){
        List<Role> roles = roleService.selectAll();
        modelMap.put("roles", roles);
        return "list.jsp";
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "add.jsp";
    }

    @RequestMapping("/delete")
    public String delete(Integer id){
        roleService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(Integer id,ModelMap modelMap){
        Role role = roleService.selectById(id);
        modelMap.put("role", role);
        return "update.jsp";
    }

    @RequestMapping("/update")
    public String update(Role role){
        role.setUpdateTime(new Date());
        roleService.update(role);
        return "redirect:list";
    }
}
