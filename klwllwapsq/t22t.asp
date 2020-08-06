<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='Wap后台管理' >
<p>后台管理<br/>-------------
<%SessionID=request.querystring("SessionID")
kyzc=request("kyzc")
if kyzc=""  then kyzc="mian"
if kyzc="mian"  then
%>
<br/>帐号:<input type='text' name='username' size='20'/>
<br/>密码:<input type='password' name='password' size='20'/>
<br/>验证码:<img src='getcode.asp'/><input type='text' name='mofei' size='4' format='*N' emptyok='false' maxlength='4'/><br/>
<anchor>[-&#x767B;&#x9646;-]
<go href='t22t.asp?kyzc=login' method='post' accept-charset='utf-8'>
<postfield name='username' value='$(username)'/>
<postfield name='password' value='$(password)'/>
<postfield name="mofei" value="$(mofei)"/>
</go>
</anchor>
<br/>------------
<%
elseif kyzc="login"  then
dim sql,rs
dim username,password
username=request("username")
password=Request("password")
mofei=request("mofei")
if mofei="" then
response.write "<br/>出错了:验证码为空!<br/>------------<br/><a href='/klwllwapsq/t22t.asp'>返回登陆面页</a>"
elseif cstr(session("getcode"))<>cstr(mofei) then
response.write "<br/>验证码输入有误!请核对!<br/>------------<br/><a href='/klwllwapsq/t22t.asp'>返回登陆面页</a>"
elseif UserName="" or password="" then
response.write "<br/>用户名或密码不能为空!<br/>------------<br/><a href='/klwllwapsq/t22t.asp'>返回登陆面页</a>"
else
	password=md5(password)
	set rs=server.createobject("adodb.recordset")
	sql="select * from admin where password='"&password&"' and username='"&username&"'"
	rs.open sql,conn,1,3

	if rs.bof and rs.eof then
response.write "<br/>用户名或密码错误!"
	else
		if password<>rs("password") then
response.write "<br/>用户名或密码错误!"
		else
			session("AdminName")=rs("username")
			session("Adminid")=rs("id")
			rs.close
			set rs=nothing
			call CloseConn()
			adminmid=md5(password&"xh6666.cn,xhbao.cn,t22t.cn")
			Response.Redirect "/klwllwapsq/wapAdmin_index.asp?adminmid="&adminmid&""

		rs.close
		Set rs = Nothing

set rsk=Server.CreateObject("ADODB.Recordset")
rspl="select * from admin where CStr(id)="&session("Adminid")
rsk.open rspl,conn,1,2
	rsk("LastLoginIP")=Request.ServerVariables("REMOTE_ADDR")
	rsk("LastLoginTime")=now()
	rsk("LoginTimes")=rsk("LoginTimes")+1
	rsk.update
	Response.Redirect "/klwllwapsq/wapAdmin_index.asp?adminmid="&session("adminmid")&""
	rsk.close
	set rsk=nothing

	end if
	end if
%>
<br/>------------<br/><a href='/klwllwapsq/t22t.asp'>返回登陆面页</a> 
<%
end if
end if

		conn.close
		set conn=nothing
%>
<br/><a href='/BBS/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a> 
<br/><a href='/index.asp?SessionID=<%=SessionID%>'>返回网站首页</a> 
</p>

</card>
</wml>