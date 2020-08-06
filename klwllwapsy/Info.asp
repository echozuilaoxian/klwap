<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%  sid=Request.querystring("sid")
set Rs=server.createobject("adodb.recordset")
                Sql="select * from [admin]"
                Rs.open sql,conn,1,3
                if not(Rs.bof and Rs.eof) then
                rs("lastdate")=now()
                rs("lastip")=Request.ServerVariables("REMOTE_ADDR")
                rs.update
else
	        response.write "出错了,请检查数据库是否存在"            
                End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<card id="main" title="正在进入" ontimer="index.asp?sid=<%=sid%>"><timer value="5"/>
<p>正在进入,请不要刷新...
</p>
</card>
</wml>