package complete;

import org.junit.Test;
import riderequestor.RequestDao;
import riderequestor.RequestDto;

import java.util.ArrayList;

import static org.junit.Assert.assertEquals;

public class CompleteDaoTest {
    CompleteDao rd = new CompleteDao();
    CompleteDto rdo = new CompleteDto();
    @Test
    public void viewCompletedTest(){
        ArrayList<String> res = rd.viewCompleted("Swaraj","Tejas");
        ArrayList<String> expected = new ArrayList<String>();
        assertEquals("viewCompleted", expected,res);
    }
    @Test
    public void completeRideTest(){
        Boolean res = rd.completeRide("Swaraj","Tejas");
        assertEquals("completeRide", false,res);
    }
    @Test
    public void completeRideUpdateTest(){
        Boolean res = rd.completeRideUpdate("Swaraj","Tejas");
        assertEquals("completeRideUpdate", false,res);
    }
    @Test
    public void viewRideGivenTest(){
        ArrayList<String> res = rd.viewRideGiven("Swaraj");
        ArrayList<String> expected = new ArrayList<String>();
        assertEquals("viewRideGiven", expected,res);
    }
    @Test
    public void viewRideTakenTest(){
        ArrayList<String> res = rd.viewRideTaken("Swaraj");
        ArrayList<String> expected = new ArrayList<String>();
        assertEquals("viewRideTaken", expected,res);
    }

}
