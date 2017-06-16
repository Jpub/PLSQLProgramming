import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PlsqlFunctionUsingSelect {
  public static void main(String[] args) throws SQLException 
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB ����
    Connection conn = DriverManager.getConnection(
           "jdbc:oracle:thin:@localhost:1521:ORA112", "scott", "tiger");

    // ���� ����
    int inValue = Integer.parseInt(args[0]);
    
    PreparedStatement stmt;
    // SELECT���� ����� �Լ� ȣ��
    stmt = conn.prepareStatement("SELECT factorial(?) FROM DUAL");

    // setXXX �Լ��� ����Ͽ� ���ε� ���� �� ����
    stmt.setInt(1, inValue);
    
    // SELECT�� ����
    ResultSet rs = stmt.executeQuery();
    
    // ��� ���
    while (rs.next())
    {
        System.out.println(inValue + "! = " + rs.getLong(1));
    }
  }
}
