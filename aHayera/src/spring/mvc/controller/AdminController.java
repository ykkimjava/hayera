package spring.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.InventoryVO;
import spring.mvc.domain.OrderListVO;
import spring.mvc.domain.ProductVO;
import spring.mvc.domain.QnaVO;
import spring.mvc.domain.Qna_ReplyVO;
import spring.mvc.domain.SalesVO;
import spring.mvc.service.AdminService;
import spring.mvc.service.ViewService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private ViewService viewService;
	
	private static final Logger logger = LoggerFactory.getLogger( AdminController.class );
	
	@RequestMapping("{step}.do")
	public String insert(@PathVariable String step) {
		return step;
	}
	
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String adminLogin(AdminVO vo, HttpSession session) {
		AdminVO result = adminService.adminLogin(vo);
		if(result!=null) {
			if(result.getManager_password().equals(vo.getManager_password())) {
				session.setAttribute("admin_id", result.getManager_id());
				logger.info(result.getManager_id() + " 관리자 로그인");
				return "1";
			}
			else return "-1";
		}
		else return "0";
	}
	
	@RequestMapping("/adminLogout.do")
	public String logout(HttpSession session) {
        session.removeAttribute("admin_id");
		return "redirect:/main.jsp";
	} // ----- end of adminLogout.do
	
	
	// ===== adminProduct.jsp =====	
	// 상품 추가하기	
	@RequestMapping("insertProduct.do")
	public String insertProduct(ProductVO vo, String s_price, String s_cost_price, String s_discount_price, String s_capacity, String s_stock) {
		vo.setPrice(Integer.parseInt(s_price.replaceAll(",", "")));
		vo.setCost_price(Integer.parseInt(s_cost_price.replaceAll(",", "")));
		vo.setDiscount_price(Integer.parseInt(s_discount_price.replaceAll(",", "")));
		vo.setCapacity(Integer.parseInt(s_capacity.replaceAll(",", "")));
		vo.setStock(Integer.parseInt(s_stock.replaceAll(",", "")));
		adminService.insertProduct(vo);
		return "redirect:/adminProduct.do";
	}

	// 상품 : AJAX로 자동완성
	@RequestMapping("/adminSearchProduct.do")
	@ResponseBody
	public List<ProductVO> adminSearchProduct(String search) {
		List<ProductVO> list = adminService.adminSearchProduct(search);
		return list;
	}
	
	// 수정할 상품 정보 가져오기
	@RequestMapping("/adminEditTarget.do")
	@ResponseBody
	public ProductVO adminEditTarget(ProductVO vo) {
		ProductVO data = adminService.adminEditTarget(vo);
		return data;
	}
	
	// 상품 수정하기
	@RequestMapping("/adminEditProduct.do")
	public String adminEditProduct(ProductVO vo, String prod_no, String s_price, String s_cost_price, String s_discount_price, String s_capacity, String s_stock) {
		vo.setPrice(Integer.parseInt(s_price.replaceAll(",", "")));
		vo.setCost_price(Integer.parseInt(s_cost_price.replaceAll(",", "")));
		vo.setDiscount_price(Integer.parseInt(s_discount_price.replaceAll(",", "")));
		vo.setCapacity(Integer.parseInt(s_capacity.replaceAll(",", "")));
		vo.setStock(Integer.parseInt(s_stock.replaceAll(",", "")));
		adminService.adminEditProduct(vo);
		return "redirect:/adminProduct.do";
	}
	
	// 상품 삭제하기
	@RequestMapping("/adminRemoveProduct.do")
	@ResponseBody
	public void adminRemoveProduct(String prod_no) {
		adminService.adminRemoveProduct(prod_no);
	}
	
	
	// ===== adminCustomer.jsp =====
	//	전체 고객 목록 보여주기
	@RequestMapping("/viewAllCustomer.do")
	@ResponseBody
	public List<CustomerVO> viewAllCustomer(CustomerVO vo)	{ 
		List<CustomerVO> data = adminService.viewAllCustomer(vo); 
		return data;
	}
	
	// 수정할 고객 정보 가져오기
	@RequestMapping("/adminCustomerEditTarget.do")
	@ResponseBody
	public CustomerVO adminCustomerEditTarget(CustomerVO vo) {
		CustomerVO data = adminService.adminCustomerEditTarget(vo);
		return data;
	}
	
	// 고객 정보 수정하기
	@RequestMapping("/adminEditCustomer.do")
	public String adminEditCustomer(CustomerVO vo) {
		adminService.adminEditCustomer(vo);
		return "redirect:/adminCustomer.do";
	}
	
	// 고객 삭제하기
	@RequestMapping("/adminRemoveCustomer.do")
	@ResponseBody
	public void adminRemoveCustomer(String customer_id) {
		adminService.adminRemoveCustomer(customer_id);
	}
	
	
	// ===== adminOrder.jsp =====
	//	전체 주문 목록 보여주기
	@RequestMapping("/viewAllOrderlist.do")
	@ResponseBody
	public List<OrderListVO> viewAllOrderlist(OrderListVO vo)	{ 
		List<OrderListVO> data = adminService.viewAllOrderlist(vo);
		return data;
	}
	
	// 수정할 주문 정보 가져오기
	@RequestMapping("/adminOrderEditTarget.do")
	@ResponseBody
	public OrderListVO adminOrderEditTarget(OrderListVO vo) {
		OrderListVO data = adminService.adminOrderEditTarget(vo);
		return data;
	}
	
	// 주문 정보 수정하기
	@RequestMapping("/adminEditOrder.do")
	public String adminEditOrder(OrderListVO vo) {
		adminService.adminEditOrder(vo);
		return "redirect:/adminOrder.do";
	}
	
	// 배송상태 수정하기
	@RequestMapping("/adminEditDeliveryStatus.do")
	@ResponseBody
	public void adminEditDeliveryStatus(OrderListVO vo) {
		adminService.adminEditDeliveryStatus(vo); 
	}
		
	
	// ===== adminReply.jsp =====
	//	전체 문의 목록 보여주기
	@RequestMapping("/viewAllInquiry.do")
	@ResponseBody
	public List<QnaVO> viewAllInquiry(QnaVO vo)	{ 
		List<QnaVO> data = adminService.viewAllInquiry(vo);
		return data;
	}
	
	// 문의 답변하기
	@RequestMapping("/adminReplyInquiry.do")
	public String adminReplyInquiry(Qna_ReplyVO vo) {
		adminService.adminReplyInquiry(vo);
		return "redirect:/adminReply.do";
	}

	// ===== adminInventory.jsp =====
	//	전체 재고 목록 보여주기	
	@RequestMapping("/viewInventory.do")
	@ResponseBody
	public List<InventoryVO> viewInventory(InventoryVO vo, ProductVO pvo)	{ 
		List<InventoryVO> data = adminService.viewInventory(vo); // 전체 재고 목록
		return data;
	}
	
	// 입고 등록하기
	@RequestMapping("/insertInventory.do")
	public String insertInventory(InventoryVO vo, String s_exist_qty, String s_exist_price, String s_stock_in_qty, String s_stock_in_price, String s_expected_price) {

		vo.setExist_qty(Integer.parseInt(s_exist_qty.replaceAll(",", "")));
		vo.setExist_price(Integer.parseInt(s_exist_price.replaceAll(",", "")));
		vo.setStock_in_qty(Integer.parseInt(s_stock_in_qty.replaceAll(",", "")));
		vo.setStock_in_price(Integer.parseInt(s_stock_in_price.replaceAll(",", "")));
		vo.setExpected_price(Integer.parseInt(s_expected_price.replaceAll(",", "")));
		
		try {
			adminService.insertInventory(vo);
		} catch (Exception e) {
			System.out.println("=== 오류 ===>>> insertInventory.do : " + e.toString());
		}
		
		return "redirect:/adminInventory.do";
	}
	
	
	// ===== adminMain.jsp =====
	//	지난 12개월 매출 데이터 가져오기	
	@RequestMapping("/viewSalesData.do")
	@ResponseBody
	public List<SalesVO> viewSalesData(SalesVO vo)	{ 
		List<SalesVO> data = adminService.viewSalesData(vo); // 전체 재고 목록
		return data;
	}
	
	//	지난 4주 일별 매출 데이터 가져오기
	@RequestMapping("/viewSalesDailyData.do")
	@ResponseBody
	public List<SalesVO> viewSalesDailyData(SalesVO vo)	{ 
		List<SalesVO> data = adminService.viewSalesDailyData(vo); // 전체 재고 목록
		return data;
	}
	
	//	아이템별 매출 데이터 가져오기
	@RequestMapping("/viewProductSalesData.do")
	@ResponseBody
	public List<SalesVO> viewProductSalesData(SalesVO vo)	{ 
		List<SalesVO> data = adminService.viewProductSalesData(vo); // 전체 재고 목록
		return data;
	}
	
}
