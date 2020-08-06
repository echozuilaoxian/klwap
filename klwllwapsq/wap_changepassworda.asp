<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="check.asp" -->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='card1' title='修 改 管 理 员 密 码'><p>
<%
dim Action,ErrMsg
dim rs,sql
Action=trim(request("Action"))
dim password,PwdConfirm,UserName
	password=trim(Request("Password"))
	PwdConfirm=trim(request("PwdConfirm"))
	UserName=trim(request("UserName"))


if Action<>"" then
	if password="" then
		ErrMsg="新密码不能为空！"
	Elseif PwdConfirm<>"752889" then
		ErrMsg="安全密码错误！"
Else
sql="Select * from Admin where Id="&session("Adminid")
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open sql,conn,1,3
if UserName<>"" then rs("UserName")=UserName
if Password<>"" then rs("password")=md5(password)
rs.update
rs.close
set rs=nothing
ErrMsg="修改密码成功！下次登录时记得换用新密码哦！"
end if
end if
response.write ""&ErrMsg&""
%>
<%
response.write "<br/>--------------<br/><a href='wap_changepassword.asp?adminmid="&request("adminmid")&"'>返回继续修改</a><br/><a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a></p></card></wml>" %>
