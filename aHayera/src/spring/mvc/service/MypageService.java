package spring.mvc.service;

import spring.mvc.domain.CustomerVO;

public interface MypageService {  
	
	//고객 아이디를 활용해서 해당 고객의 모든 정보 가져오기
	public CustomerVO getAllById(CustomerVO vo);

}