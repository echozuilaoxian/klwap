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
<%
dim sql,rs
dim username,password
username=replace(trim(request("username")),"'","")
password=replace(trim(Request("password")),"'","")
mofei=request("mofei")
if mofei="" then
response.write "<card id='card1' title='出错了'><p>错误原因:验证码为空!"
response.write "<br/><a href='/Wap/admin/wap_Admin_Login.asp'>返回登陆页面</a>"
response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
response.end
end if
if cstr(session("getcode"))<>cstr(mofei) then
response.write "<card id='card1' title='出错了'><p>错误原因:验证码输入有误!请核对!"
response.write "<br/><a href='/Wap/admin/wap_Admin_Login.asp'>返回登陆页面</a>"
response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
response.end
end if
if UserName="" then
response.write "<card id='card1' title='登陆管理'><p>用户名不能为空!"
response.write "<br/><a href='/Wap/admin/wap_Admin_Login.asp'>返回登陆页面</a>"
response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
response.end
end if
if Password="" then
response.write "<card id='card1' title='登陆管理'><p>登陆密码不能为空!"
response.write "<br/><a href='/Wap/admin/wap_Admin_Login.asp'>返回登陆页面</a>"
response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
response.end
end if
if FoundErr<>True then
	password=md5(password)
	set rs=server.createobject("adodb.recordset")
	sql="select * from admin where password='"&password&"' and username='"&username&"'"
	rs.open sql,conn,1,3
	if rs.bof and rs.eof then
		FoundErr=True
		ErrMsg="用户名或密码错误！！！"
	else
		if password<>rs("password") then
			FoundErr=True
			ErrMsg="用户名或密码错误！！！"
		else
			session("AdminName")=rs("username")
			session("Adminid")=rs("id")
			rs.close
			set rs=nothing
			call CloseConn()
			adminmid=md5(password&"yxxe.net,kyaa.cn,kywap.net")
			Response.Redirect "/Wap/admin/wap_Admin_dlcg.asp?adminmid="&adminmid&""
		end if
	end if
	rs.close
	set rs=nothing
end if
if FoundErr=True then
	call WriteErrMsg()
end if
call CloseConn()

'****************************************************
'过程名：WriteErrMsg
'作  用：显示错误提示信息
'参  数：无
'****************************************************
response.write "<card id='card1' title='登陆管理'><p>"&ErrMsg&""
response.write "<br/><a href='/Wap/admin/wap_Admin_Login.asp'>返回登陆页面</a>"
response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
%>
