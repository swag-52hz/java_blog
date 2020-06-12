package mapper;

import entity.Resource;
import entity.Role;

import java.util.List;

public interface RoleMapper {
    // 插入角色
    int insert(Role role);

    // 查询所有角色
    List<Role> selectAll();

    // 删除角色
    int delete(Integer id);

    Role selectById(Integer id);

    int update(Role role);

    // 根据角色ID查询所有权限
    List<Resource> selectByRoleId(Integer roleid);
}
