package db;

import org.junit.Test;
import user.UserDto;

import java.sql.Connection;

import static org.junit.Assert.assertEquals;

public class DbDataTest {
    @Test
    public void getConnectionTest(){

        Connection res = DbData.getConnection();
        assertEquals("Authenticate", null,res);
    }
}
