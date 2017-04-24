import java.sql.*;

public class PlsqlFunction {
  public static void main(String[] args) throws SQLException 
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB ����
    Connection conn = DriverManager.getConnection(
           "jdbc:oracle:thin:@localhost:1521:ORA112", "scott", "tiger");

    // ���� ����
    int p1OutValue ;
    int p2InValue = Integer.parseInt(args[0]);
    
    CallableStatement cs;
    // ������ �� ���� ��� �� �ϳ��� ����ϸ� �ȴ�. �� ����� ������ �����ϴ�.
    // 1. �͸� PL/SQL ����� ����ϴ� ���
    cs = conn.prepareCall("BEGIN ? := factorial(?) ; END ;");
    // 2. JDBC���� �����ϴ� ���� �Լ� ȣ�� ���
    // cs = conn.prepareCall("{? = call factorial(?)}");

    // ����� ���� OUT parameter�� ���� ������ registerOutParameter �Լ��� �̿��Ͽ� ���� 
    cs.registerOutParameter(1, Types.INTEGER);
    
    // setXXX �޼ҵ带 ����Ͽ� IN ���� �Ķ������ �� ����
    cs.setInt(2, p2InValue);
    
    // Statement ����
    cs.execute();
    
    // ������ data�� ������
    p1OutValue = cs.getInt(1);
    
    // ������ ���
    System.out.println(p2InValue + "! = " + p1OutValue);
  }
}