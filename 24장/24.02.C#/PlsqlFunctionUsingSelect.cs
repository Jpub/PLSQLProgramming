using System;
using System.Linq;
using System.Data;
using Oracle.DataAccess.Client;

namespace PlsqlFunctionUsingSelect
{
  class Program
  {
    static void Main(string[] args)
    {
      if (args.Count() != 1)
      {
        Console.WriteLine("사용 방법: " + AppDomain.CurrentDomain.FriendlyName + " 숫자");
        return;
      }
      int num = Int32.Parse(args[0]); // 첫 번째 파라미터로 주어진 숫자의 팩토리얼을 구한다.

      try
      {
        OracleConnection con = new OracleConnection();

        // 오라클 데이터베이스에 접속(Data Source=<TNS명>)
        con.ConnectionString = "User Id=scott;Password=tiger;Data Source=ORA112";
        con.Open();

        OracleCommand cmd = con.CreateCommand();       // Command 객체 생성
        cmd.CommandText = "SELECT factorial(:num) FROM DUAL"; // 함수를 포함한 SELECT문
        cmd.CommandType = CommandType.Text; // 저장 프로시저 타입 선택

        // 함수의 매개변수로 사용될 바인드 변수
        cmd.Parameters.Add(":num", OracleDbType.Int32, num, ParameterDirection.Input);

        OracleDataReader dr = cmd.ExecuteReader();  // 실행

        while (dr.Read())
          Console.WriteLine(num.ToString() + "! = " + dr.GetDecimal(0).ToString());

        // 접속 종료
        con.Close();
        con.Dispose();
      }
      catch (Exception ex)
      {
        Console.WriteLine("오류가 발생했습니다.\n" + ex.Message);
      }
    }
  }
}