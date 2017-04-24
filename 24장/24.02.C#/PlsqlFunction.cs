using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace PlsqlFunction
{
  class Program
  {
    static void Main(string[] args)
    {
      if (args.Count() != 1)
      {
        Console.WriteLine("사용 방법: " + AppDomain.CurrentDomain.FriendlyName +
                          " 숫자");
        return;
      }
      int num = Int32.Parse(args[0]); // 첫 번째 파라미터로 주어진 숫자의 팩토리얼을 구한다.
      int factorial;

      try
      {
        OracleConnection con = new OracleConnection();

        // 오라클 데이터베이스에 접속(Data Source=<TNS명>)
        con.ConnectionString = "User Id=scott;Password=tiger;Data Source=ORA112";
        con.Open();

        OracleCommand cmd = con.CreateCommand();       // Command 객체 생성
        // 다음의 두 가지 방법 중 하나를 사용하면 된다. 두 방법은 완전히 동일하다.
        // 1. 익명 PL/SQL 블록을 사용하는 방법
        //cmd.CommandText = "BEGIN :ret := factorial(:num); END;"; // 익명 PL/SQL 블록
        //cmd.CommandType = CommandType.Text;            // SQL 텍스트 타입 선택
        // 2. ODP.NET에서 지원하는 StoredProcedure 커맨드 타입 사용
        cmd.CommandText = "factorial";                 // 저장 함수명 입력
        cmd.CommandType = CommandType.StoredProcedure; // 저장 프로시저 타입 선택

        // 결과를 반환받을 바인드 변수
        //cmd.Parameters.Add(":ret", OracleDbType.Int32, 
        //                    ParameterDirection.Output);    // 1번 방법 사용 시
        cmd.Parameters.Add(":ret", OracleDbType.Int32, 
                              ParameterDirection.ReturnValue); // 2번 방법 사용 시
        // 함수의 매개변수로 사용될 바인드 변수
        cmd.Parameters.Add(":num", OracleDbType.Int32, num, ParameterDirection.Input);

        cmd.ExecuteNonQuery();  // 실행
        factorial = ((OracleDecimal)cmd.Parameters[":ret"].Value).ToInt32(); // 결괏값

        Console.WriteLine(num.ToString() + "! = " + factorial.ToString());

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