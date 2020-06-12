package entity;

import java.util.Map;

// 接收Layui表格接收请求数据的对象
public class LayRequest {
    private int page;   // 当前页
    private int limit;  // 每页记录数
    private Map<String, Object> params;    // 其他参数

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
