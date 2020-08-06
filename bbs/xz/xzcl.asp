<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
 <head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="购买勋章" >
<p>
<%
SessionID=request.querystring("SessionID")
dim id, txt, logo
id=request("id")
m=request("m")
iduse=Session("useid")
m=clng(m)


set rs=Server.CreateObject("ADODB.Recordset")
rspsl="select * from [usereg] where id="&iduse
rs.open rspsl,conn,1,2
 
if m>rs("usejf")  then
     response.write "您的金币不足.等金币够了再来吧<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if id<>"" then rs("zamw")=id
rs.update
sql="update usereg set usejf=usejf-"&m&" where cstr(id)="&iduse
  conn.Execute(sql)
'---关闭数据----

%>
购买勋章成功
<% 

    Response.Write "<br/>-------------<br/>"
response.write "<a href='/bbs/xz/xz.asp?SessionID=" & SessionID & "'>返回勋章商城</a><br/>"
response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
<% 


rs.close
set rs=nothing%>
<%
conn.close
set conn=nothing%>
</p></card></wml>