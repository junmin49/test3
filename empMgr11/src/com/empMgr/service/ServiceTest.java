package com.empMgr.service;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;

import com.empMgr.dao.EmpMgrDao;

public class ServiceTest {

	EmpMgrService service;
	
	@Before
	public void setup(){
		EmpMgrDao dao = new EmpMgrDao();
		service = new EmpMgrService(dao);
		
	}
	
	@Test
	public void readEmployeeTest(){
		HttpServletRequest req = mock(HttpServletRequest.class);
		given(req.getParameter("employee_id")).willReturn("115");
		String result = service.readEmployee(req);
		System.out.println(result);
	}

	
}
