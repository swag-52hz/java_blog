package controller;

import entity.Category;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import service.CategoryService;

import java.util.List;


// todo:@RestController：适用于前后端分离，该类中所有的方法只返回json数据
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/childCategory")
    public Result<List<Category>> findChildCategory(Integer parentid){
        List<Category> categories = categoryService.selectByParentId(parentid);
        return new Result<>(200, "查询成功",categories);
    }
}
