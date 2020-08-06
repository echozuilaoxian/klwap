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
<card id='card1' title='帐号管理'><p>
<%
dim rs,sql
Come=request("Come")
Classid=request("Classid")
kyzc=request("kyzc")
adminmid=request("adminmid")

if kyzc="" then
response.write "帐号管理<br/>--------------<br/><a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>修改用户帐号</a><br/>"
if session("Adminid")="1" then
response.write "<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>添加新管理员</a><br/>"
response.write "<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>管理人员列表</a><br/>"
End IF 

elseif kyzct="usegl" then
Set rs=Server.CreateObject("Adodb.RecordSet")
sql="Select * from Admin where Id="&session("Adminid")
rs.Open sql,conn,1,3
%>
修改帐号
<br/>--------------<br/>
新用户名:<input type="text" name="UserName<%=minute(now)%><%=second(now)%>" emptyok="true"  value="<%=rs("UserName")%>" /><br/>
新的密码:<input type="text" name="password<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
新的密码:<input type="text" name="PwdConfirm<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
<anchor>确认修改<go method="post" href="wap_changepassworda.asp?adminmid=<%=request("adminmid")%>" accept-charset="UTF-8">
<postfield name="action" value="action"/>
<postfield name="UserName" value="$(UserName<%=minute(now)%><%=second(now)%>)"/>
<postfield name="password" value="$(password<%=minute(now)%><%=second(now)%>)"/>
<postfield name="PwdConfirm" value="$(PwdConfirm<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<%
elseif kyzct="usexg" then

dim Action,ErrMsg
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
sqls="Select * from Admin where Id="&session("Adminid")
Set rss=Server.CreateObject("Adodb.RecordSet")
rss.Open sqls,conn,1,3
if UserName<>"" then rss("UserName")=UserName
if Password<>"" then rss("password")=md5(password)
rss.update
rss.close
set rss=nothing
ErrMsg="修改密码成功！下次登录时记得换用新密码哦！"

end if
end if
response.write ""&ErrMsg&""


rs.close
set rs=nothing
end if
response.write "--------------<br/><a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a></p></card></wml>" %>
