<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn.asp" -->
<%set rssd=Server.CreateObject("ADODB.Recordset")
rspplsd="select smsxx,smsts from xxxx"
rssd.open rspplsd,conn,1,2
smsxx=rssd("smsxx")
smsts=rssd("smsts")
Dim GetFlag Rem(提交方式)
Dim ErrorSql Rem(非法字符) 
Dim RequestKey Rem(提交数据)
Dim ForI Rem(循环标记)
ErrorSql = ""&smsxx&"" Rem
ErrorSql = split(ErrorSql,"|")
If Request.ServerVariables("REQUEST_METHOD")="GET" Then
GetFlag=True
Else
GetFlag=False
End If
If GetFlag Then
For Each RequestKey In Request.QueryString
For ForI=0 To Ubound(ErrorSql)
If Instr(LCase(Request.QueryString(RequestKey)),ErrorSql(ForI))<>0 Then
response.write "<wml><card title='对不起,提交出错啦!!'><p>"&smsts&"<br/>请<anchor>返回修改<prev/></anchor><br/></p></card></wml>"
Response.End
End If
Next
Next 
Else
For Each RequestKey In Request.Form
For ForI=0 To Ubound(ErrorSql)
If Instr(LCase(Request.Form(RequestKey)),ErrorSql(ForI))<>0 Then
response.write "<wml><card title='对不起,提交出错啦!!'><p>"&smsts&"<br/>请<anchor>返回修改<prev/></anchor><br/><br/></p></card></wml>"
Response.End
End If
Next
Next
End If
%>
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card title='上传文章'>
<p><%
        classid=LCase(Request("classid"))
        test=LCase(Request("test"))
        user=LCase(Request("user"))
        title=LCase(Request("title"))
        if session("test")=1 then
response.write("您刚才已发表过文章！请稍后再发！<br/>")
        else
        if test="" then
response.write("文章内容不能为空！<br/>")
else
        set rs=server.createobject("adodb.recordset")
	sql="select * from sms"
	rs.open sql,conn,1,3
        rs.addnew
        rs("classid")=request("classid")
        rs("test")=request("test")
        rs("user")=request("user")
        rs("title")=request("title")
        rs.update
        session.timeout=1
        session("test")=1
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
response.write "文章发表成功!"
end if
end if
response.write "<br/>--------<br/>"
response.write "<a href='list.asp?class="&classid&"&amp;hk="&hk&"'>返回栏目</a><br/>"
%>
<a href='index.asp?hk=<%=hk%>'>返回首页</a>
</p>
</card>
</wml>

