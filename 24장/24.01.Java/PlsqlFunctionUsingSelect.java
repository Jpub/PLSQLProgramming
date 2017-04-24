import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PlsqlFunctionUsingSelect {
  public static void main(String[] args) throws SQLException 
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB 접속
    Connection conn = DriverManager.getConnection(
           "jdbc:oracle:thin:@localhost:1521:ORA112", "scott", "tiger");

    // 변수 선언
    int inValue = Integer.parseInt(args[0]);
    
    PreparedStatement stmt;
    // SELECT문을 사용한 함수 호출
    stmt = conn.prepareStatement("SELECT factorial(?) FROM DUAL");

    // setXXX 함수를 사용하여 바인드 변수 값 설정
    stmt.setInt(1, inValue);
    
    // SELECT문 수행
    ResultSet rs = stmt.executeQuery();
    
    // 결과 출력
    while (rs.next())
    {
        System.out.println(inValue + "! = " + rs.getLong(1));
    }
  }
}
