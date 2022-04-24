package ridecreator;
import static org.junit.Assert.*;
import org.junit.Test;
import user.UserDto;

import java.util.ArrayList;

public class RideDaoTest {
    RideDto rd = new RideDto();
    RideDao rdao = new RideDao();
    @Test
    public void createRideTest(){
        boolean res = rdao.createRide(rd);
        assertEquals("CreateRide", false,res);
    }
    @Test
    public void deleteRideTest(){
        boolean res = rdao.deleteRide("7000273946");
        assertEquals("CreateRide", false,res);
    }
    @Test
    public void viewAllRideTest(){
        ArrayList<RideDto> res = rdao.viewAllRide();
        ArrayList<RideDto> expected = new ArrayList<>();
        assertEquals("CreateRide",expected,res);
    }
    @Test
    public void viewRideTest(){
        RideDto res = rdao.viewRide("7000273946");
        assertEquals("CreateRide", null,res);
    }
}
