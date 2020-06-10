package service;

import com.github.pagehelper.PageInfo;
import entity.Admin;

import java.util.Map;

public interface AdminService {
    // 插入
    boolean insert(Admin admin);

    // 通过id查询
    Admin selectById(Integer id);

    // 通过账号查询
    Admin selectByAccount(String account);

    // 分页查询，map为查询条件
    PageInfo<Admin> selectByPage(Map<String, Object> map);

    // 删除
    boolean delete(Integer id);

    // 修改
    boolean update(Admin admin);

    // 与Role关联查询
    Admin selectWithRoleMapping(Integer id);

    // 与Operator关联查询
    Admin selectWithOperatorMapping(Integer id);
}
