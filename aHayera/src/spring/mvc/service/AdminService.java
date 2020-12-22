package spring.mvc.service;

import java.util.List;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;

public interface AdminService {
	
	public AdminVO adminLogin(AdminVO vo);
	
	public List<ProductVO> adminSearchProduct(String search);
	
	public void insertProduct(ProductVO vo);
}
