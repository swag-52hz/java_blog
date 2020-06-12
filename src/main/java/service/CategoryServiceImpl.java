package service;

import entity.Category;
import mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> selectByParentId(Integer parentId) {
        return categoryMapper.selectByParentId(parentId);
    }
}
