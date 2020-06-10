package mapper;

import entity.Admin;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    // 插入
    int insert(Admin admin);

    // 查询所有
    List<Admin> selectAll();

    // 根据账号查询
    Admin selectByAccount(String account);

    // 根据id查询
    Admin selectById(Integer id);

    // 根据id删除
    int delete(Integer id);

    // 修改
    int update(Admin admin);

    // 多条件查询
    List<Admin> selectByMap(Map<String, Object> map);

    Admin selectWithRoleMapping(Integer id);

    Admin selectWithOperatorMapping(Integer id);
}
