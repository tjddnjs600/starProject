package com.myweb.ctrl;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConnectTest {
	private static Logger log = LoggerFactory.getLogger(ConnectTest.class);
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection cn =
				DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "staruser", "oracle")){
			log.info(">>> jdbc test ok : " + cn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
