package service;

import entity.Role;

import java.util.List;

public interface RoleService {
    int add(Role role);

    List<Role> selectAll();

    int delete(Integer id);

    Role selectById(Integer id);

    int update(Role role);
}
