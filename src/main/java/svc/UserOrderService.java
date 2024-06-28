package svc;

import vo.Mc_order;
import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;

public class UserOrderService {

	public boolean userOrder(Mc_order order) throws Exception {
		boolean orderSuccess = false;
		MocaDAO mocaDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		mocaDAO.setConnection(con);
		int insertCount = mocaDAO.insertOrder(order);
		
		if(insertCount > 0){
			orderSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return orderSuccess;
	}


}
