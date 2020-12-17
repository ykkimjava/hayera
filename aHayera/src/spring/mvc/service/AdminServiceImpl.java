package spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.AdminDAO;
import spring.mvc.domain.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO loginDAO;
	
	public void adminLogin(AdminVO vo) {
		loginDAO.adminLogin(vo);
	}
}
