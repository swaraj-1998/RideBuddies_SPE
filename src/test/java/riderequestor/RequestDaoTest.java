package riderequestor;

import org.junit.Test;
import user.UserDto;

import static org.junit.Assert.assertEquals;

public class RequestDaoTest {
    RequestDto rd = new RequestDto();
    RequestDao rdo = new RequestDao();
    @Test
    public void addRequestTest(){
        Boolean res = rdo.addRequest(rd);
        assertEquals("Add Request", false,res);
    }
    @Test
    public void delRequestTest(){
        Boolean res = rdo.delRequest(rd);
        assertEquals("Delete Request", false,res);
    }
    @Test
    public void delAllRequestTest(){
        Boolean res = rdo.delAllRequest("Swaraj");
        assertEquals("Delete All Request", false,res);
    }
    @Test
    public void viewMyRequestTest(){
        RequestDto res = rdo.viewMyRequest("Swaraj");
        assertEquals("View My Request", null,res);
    }
    @Test
    public void findAccReqTest(){
        RequestDto res = rdo.viewMyRequest("Swaraj");
        assertEquals("Find Acc Request", null,res);
    }

}
