package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.ProductVO;

public interface ViewMainpageDAO {
	public ProductVO selectMaxTotalsalesProduct(ProductVO vo);
	
	public List<ProductVO> viewAllproduct(ProductVO vo);
}
