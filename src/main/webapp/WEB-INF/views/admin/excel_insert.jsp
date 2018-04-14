<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sams.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import="java.util.*,java.io.*,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"%>
<%@ page import="java.sql.*,java.sql.Date"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="jxl.*"%>s

<%@ include file="/WEB-INF/include/header.jsp"%>

<%
	String savePath = request.getRealPath("/") + "upload/tmp"; // 저장할 디렉토리   wepCount에 저장할 파일 명을 upload 부분에 써야함

	int sizeLimit = 30 * 1024 * 1024; // 용량제한   
	String formName = "";
	String fileName = "";
	Vector vFileName = new Vector();
	Vector vFileSize = new Vector();
	String[] aFileName = null;
	String[] aFileSize = null;
	long fileSize = 0;

	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8",
			new DefaultFileRenamePolicy());

	Enumeration formNames = multi.getFileNames();

	while (formNames.hasMoreElements()) {
		formName = (String) formNames.nextElement();
		fileName = multi.getFilesystemName(formName);

		if (fileName != null) // 파일이 업로드 되면
		{
			fileSize = multi.getFile(formName).length();
			vFileName.addElement(fileName);
			vFileSize.addElement(String.valueOf(fileSize));
		}

	}

	aFileName = (String[]) vFileName.toArray(new String[vFileName.size()]);
	aFileSize = (String[]) vFileSize.toArray(new String[vFileSize.size()]);
%>

<%
	Workbook workbook = Workbook.getWorkbook(new File(savePath + "/" + fileName));
	Sheet sheet = workbook.getSheet(0);

	int col = sheet.getColumns(); // 시트의 컬럼의 수를 반환한다.    
	int row = sheet.getRows(); // 시트의 행의 수를 반환한다.
%>


<HTML>
<HEAD>
<TITLE>Excel Document Reader</TITLE>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="../css/default.css">

<style>
td {
	padding: 3px 5px;s
}
</style>
</HEAD>
<BODY>

	workbook =
	<%=workbook%>
	<br> 행 수 :
	<%=row%>
	<br> 컬럼 수 :
	<%=col%>
	<br>
	<br>
	<br>

	<table border="1">
		<%
			String[][] content = new String[row][col];

			for (int i = 0; i < row; i++) {
				for (int j = 0; j < col; j++) {
					content[i][j] = sheet.getCell(j, i).getContents(); // 첫번째 인자가 열 값, 두번째 인자값이 행 값이다.!
				}
			}
			out.println("테이블형태의 방식");
			for (int k = 0; k < content.length; k++) // 자동 : 테이블 형태의 방식으로 출력
			{
				out.println("<tr>");
				for (int l = 0; l < content[k].length; l++) {
					out.println("<td>");
					out.println(content[k][l]);
					out.println("</td>");
				}
				out.println("</tr>");
			}
		%>
	</table>
	<br>
	<br>
	<br>

	<table border="1">

		<%
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {

				//     DB 접속 
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;databaseName=SAMS", "sa", "test123");

				//      Record를 읽어 배열로 저장
				out.println("DB에 저장되는 데이터");

				for (int i = 0; i < row; i++) // 수동 : 테이블 형태의 방식
				{
					System.out.println("검사");
					String auto_no = sheet.getCell(0, i).getContents(); //첫번째 인자가 열 값, 두번째 인자값이 행 값..!
					String dept_no = sheet.getCell(1, i).getContents();
					String pword = sheet.getCell(2, i).getContents();
					String phone_number_id = sheet.getCell(3, i).getContents();
					String phone_change = sheet.getCell(4, i).getContents();
					String batch = sheet.getCell(5, i).getContents();
					String name = sheet.getCell(6, i).getContents();
					String photo = sheet.getCell(7, i).getContents();
					String position = sheet.getCell(8, i).getContents();
					String email = sheet.getCell(9, i).getContents();
					String addr = sheet.getCell(10, i).getContents();
					String birth_date = sheet.getCell(11, i).getContents();
					String w_tel = sheet.getCell(12, i).getContents();
					String w_position = sheet.getCell(13, i).getContents();
					String work = sheet.getCell(14, i).getContents();
					String sql = "insert into member(auto_no, dept_no, pword, phone_number_id,phone_change, batch, name, photo, position, email, addr, birth_date, w_tel, w_position, work) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

					pstmt = conn.prepareStatement(sql);

					int auto_no_i = Integer.parseInt(auto_no);
					pstmt.setInt(1, auto_no_i);

					int dept_no_i = Integer.parseInt(dept_no);
					pstmt.setInt(2, dept_no_i);

					pstmt.setString(3, pword);
					pstmt.setString(4, phone_number_id);

					//					boolean phone_change_b = Boolean.valueOf("phone_change").booleanValue();
					boolean phone_change_b = Boolean.valueOf("").booleanValue();
					pstmt.setBoolean(5, phone_change_b);
					//int phone_change_i =Integer.parseInt(phone_change);
					//pstmt.setInt(5, phone_change_i);

					int batch_i = Integer.parseInt(batch);
					pstmt.setInt(6, batch_i);
					pstmt.setString(7, name);

					int photo_i = Integer.parseInt(photo);
					pstmt.setInt(8, photo_i);
					pstmt.setString(9, position);
					pstmt.setString(10, email);
					pstmt.setString(11, addr);

					Date birth_date_d = Date.valueOf(birth_date);
					pstmt.setDate(12, birth_date_d);

					pstmt.setString(13, w_tel);
					pstmt.setString(14, w_position);
					pstmt.setString(15, work);
					/*
					pstmt.setString(1, auto_no);
					pstmt.setString(2, dept_no);
					pstmt.setString(3, pword);
					pstmt.setString(4, phone_number_id);
					pstmt.setString(5, phone_change);
					pstmt.setString(6, batch);
					pstmt.setString(7, name);
					pstmt.setString(8, photo);
					pstmt.setString(9, position);
					pstmt.setString(10, email);
					pstmt.setString(11, addr);
					pstmt.setString(12, birth_date);
					pstmt.setString(13, w_tel);
					pstmt.setString(14, w_position);
					pstmt.setString(15, work);
					*/
					pstmt.executeUpdate();

					out.println("<tr>"); // 테이블 형태의 방식으로 출력
					out.println("<td>" + auto_no + "</td>");
					out.println("<td>" + dept_no + "</td>");
					out.println("<td>" + pword + "</td>");
					out.println("<td>" + phone_number_id + "</td>");
					out.println("<td>" + phone_change + "</td>");
					out.println("<td>" + batch + "</td>");
					out.println("<td>" + name + "</td>");
					out.println("<td>" + photo + "</td>");
					out.println("<td>" + position + "</td>");
					out.println("<td>" + email + "</td>");
					out.println("<td>" + addr + "</td>");
					out.println("<td>" + birth_date + "</td>");
					out.println("<td>" + w_tel + "</td>");
					out.println("<td>" + w_position + "</td>");
					out.println("<td>" + work + "</td>");
					out.println("</tr>");
				} // end of for

			} catch (Exception e) {
				e.printStackTrace();
				//conn.rollback();
		%>
		<script>
			alert("처리중 오류가 발생하였습니다\n잠시후 다시 시도하세요!!");
			history.back();
		</script>
		<%
			} finally {
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			}
		%>

	</table>

</BODY>
</HTML>
<%@ include file="/WEB-INF/include/footer.jsp"%>