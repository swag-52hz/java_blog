package controller;

import com.github.pagehelper.PageInfo;
import entity.Admin;
import entity.LayRequest;
import entity.Result;
import entity.Role;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import service.AdminService;
import service.RoleService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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

    @ResponseBody
    @RequestMapping("/layList")
    public Result<List<Admin>> list(LayRequest layRequest, ModelMap modelMap){
        PageInfo<Admin> pageInfo = adminService.selectByPage(layRequest);
        return new Result<>(0, pageInfo.getList(), pageInfo.getTotal());
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

//    @SessionAttribute("admin") Admin admin)

//    @RequestParam(required=false)
    @RequestMapping("/upload")
    public String upload(MultipartFile headpic,@RequestParam(required = false) Integer id) throws IOException {
        String fileName = headpic.getOriginalFilename();
        System.out.println("上传文件名："+fileName);
        File file = new File("F:/headpic/"+fileName);
        // todo:如果父目录不存在则创建目录
        if(!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
        }
        // todo:保存文件，将上传的文件写入file
        headpic.transferTo(file);
        Admin admin = new Admin(id);
        // todo:将头像路径保存到对象中
        admin.setHeadpic("/head/"+fileName);
        // todo:更新用户头像信息
        adminService.updateHeadPic(admin);
        return "redirect:list";
    }

    @GetMapping("/download")
    public ResponseEntity<byte[]> download(String filename) throws IOException {
        // todo:定位文件地址
        File file = new File("F:/headpic/"+filename);
        // todo:读取文件内容
        byte[] bytes = FileUtils.readFileToByteArray(file);
        // todo:设置http响应头
        HttpHeaders headers = new HttpHeaders();
        // todo:设置ContenType为stream（流类型）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // todo:设置以附件形式打开
        headers.setContentDispositionFormData("attachment", filename);
        //                                 内容     头部信息       状态码
        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.CREATED);
    }
}
