package user;
import static org.junit.Assert.*;
import org.junit.Test;

public class UserDaoTest {
    UserDao ud = new UserDao();
    UserDto udto  = new UserDto();
    @Test
    public void addUserTest(){
        udto.setName("Swaraj");
        udto.setEmail("swaraj@gmail.com");
        udto.setGender("Male");
        udto.setPassword("swaraj");
        udto.setPhone("7000273946");
        udto.setReqRat(1);
        udto.setRideRat(1);
        Boolean res = ud.addUser(udto);
        assertEquals("Add User", false,res);
    }
    @Test
    public void authenticateTest(){
        UserDto res = ud.authenticate("7000273946","swaraj");
        assertEquals("Authenticate", null,res);
    }
    @Test
    public void viewTest(){
        UserDto res = ud.viewUser("7000273946");
        assertEquals("View User", null,res);
    }
    @Test
    public void updateUser(){
        udto.setName("Swaraj");
        udto.setEmail("swaraj@gmail.com");
        udto.setGender("Male");
        udto.setPassword("swaraj");
        udto.setPhone("7000273946");
        udto.setReqRat(1);
        udto.setRideRat(1);
        Boolean res = ud.updateUser(udto);
        assertEquals("Update User", false,res);
    }
    @Test
    public void deleteUserTest(){
        Boolean res = ud.deleteUser("7000273946");
        assertEquals("Delete User", false,res);
    }
    @Test
    public void rideRatTest(){
        Boolean res = ud.rideRat("7000273946",1);
        assertEquals("Ride Rating", false,res);
    }
    @Test
    public void reqRatTest(){
        Boolean res = ud.reqRat("7000273946",1);
        assertEquals("Ride Rating", false,res);
    }
}
