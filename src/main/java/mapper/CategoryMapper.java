package mapper;

import entity.Category;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CategoryMapper {
    @Select("select * from t_category where parentid=#{parentId}")
    List<Category> selectByParentId(Integer parentId);
}
