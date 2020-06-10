package service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Admin;
import mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public boolean insert(Admin admin) {
        return adminMapper.insert(admin)>0?true:false;
    }

    @Override
    public Admin selectById(Integer id) {
        return adminMapper.selectById(id);
    }

    @Override
    public Admin selectByAccount(String account) {
        return adminMapper.selectByAccount(account);
    }

    @Override
    public PageInfo<Admin> selectByPage(Map<String, Object> map) {
        int pageNum = map.get("pageNum")==null?1:Integer.parseInt(map.get("pageNum").toString());
        int pageSize = map.get("pageSize")==null?2:Integer.parseInt(map.get("pageSize").toString());
        // 设置当前页和每页记录数
        PageHelper.startPage(pageNum, pageSize);
        // 执行查询
        List<Admin> admins = adminMapper.selectByMap(map);
        // 创建PageInfo，并将返回结果传入
        PageInfo<Admin> adminPageInfo = new PageInfo<>(admins);
        return adminPageInfo;
    }

    @Override
    public boolean delete(Integer id) {
        return adminMapper.delete(id)>0?true:false;
    }

    @Override
    public boolean update(Admin admin) {
        return adminMapper.update(admin)>0?true:false;
    }

    @Override
    public Admin selectWithRoleMapping(Integer id) {
        return adminMapper.selectWithRoleMapping(id);
    }

    @Override
    public Admin selectWithOperatorMapping(Integer id) {
        return adminMapper.selectWithOperatorMapping(id);
    }


}
