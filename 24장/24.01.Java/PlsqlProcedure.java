import java.sql.*;

public class PlsqlProcedure {
  public static void main(String[] args) throws SQLException 
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB ����
    Connection conn = DriverManager.getConnection(
           "jdbc:oracle:thin:@localhost:1521:ORA112", "scott", "tiger");
    
    // ���� ����
    int p1InValue    = Integer.parseInt(args[0]) ;
    int p2InOutValue = Integer.parseInt(args[1]);
    int p3OutValue   ;
    
    // Prepare statement
    // ������ �� ���� ��� �� �ϳ��� ����ϸ� �ȴ�. �� ����� ������ �����ϴ�.
    // 1. �͸� PL/SQL ����� ����ϴ� ���
    //CallableStatement cs = conn.prepareCall("BEGIN compute_power(?, ?, ?) ; END ;");
    // 2. JDBC���� �����ϴ� ���ν��� ȣ�� ���
    CallableStatement cs = conn.prepareCall("{ call compute_power(?, ?, ?) }");
    
    // IN �Ű������� setXXX�� ����Ͽ� ���� ����
    cs.setInt(1, p1InValue);
    
    // IN OUT �Ű������� setXXX�� registerOutParameter�� �� �� ���
    cs.setInt(2, p2InOutValue);
    cs.registerOutParameter(2, Types.INTEGER);
    
    // OUT �Ű������� registerOutParameter�� ����Ͽ� �ǵ��� ���� ������ Ÿ���� ����
    cs.registerOutParameter(3, Types.INTEGER);
    
    // Statement ����
    cs.execute();
    
    // ���� ��� data�� ������. 
    p2InOutValue = cs.getInt(2);
    p3OutValue   = cs.getInt(3);
    
    // ���� ��� ���
    System.out.println(p1InValue + "^" + p2InOutValue + " = " + p3OutValue);
  }
}
