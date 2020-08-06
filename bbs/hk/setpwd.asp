<!--#include file="wmlhead.asp"--><!--#include file="inc/md5utf8.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
public info
select case request("action")
case "setpwd"
	call setpwd()
case else
	call default()
end select
call closeconn()

sub default()
%><wml>
<card id="main" title="设置密码">
<p><%
response.write info
devid=Request.Cookies("phone")
if session("useid")>0 and len(devid)=11 then
%>手机号：<%response.write devid%><br/> 
密码:<input type="password" name="pwd" maxlength="20" /><br/>
确认:<input type="password" name="pwd1" maxlength="20" /><br/>
<anchor>设置密码
<go href="setpwd.asp?action=setpwd&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="pwd" value="$(pwd)"/>
<postfield name="pwd1" value="$(pwd1)"/>
</go>
</anchor><br/>
<%
else
%>您尚未登录或系统无法取得您的手机号，无法设置密码<br/>
<%end if
%>--------<br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<%else%>
<a href="/bbs/hk/index.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub setpwd()
pwd=checkstr(request("pwd"))
pwd1=checkstr(request("pwd1"))
if pwd="" or pwd1="" then
	info="密码不能为空！请重试"
elseif pwd<>pwd1 then
	info="密码与确认密码不一致！"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_user where devid='"&devid&"'"
	rs.open sql,conn,1,3
	if rs.eof then
		rs.addnew
		rs("devid")=devid
		rs("password")=md5(pwd,16)
		rs("useid")=session("useid")
		rs("ltname")=session("ltname")
		rs.update
		info="密码设置成功！电脑上传软件时请访问"&geturl()&"add.asp"
	else
		rs("devid")=devid
		rs("password")=md5(pwd,16)
		rs("useid")=session("useid")
		rs("ltname")=session("ltname")
		rs.update
		info="密码修改成功！电脑上传软件时请访问:"&geturl()&"add.asp"
	end if
	rs.close
	set rs=nothing
end if
%><wml>
<card id="main" title="设置结果">
<p><%
response.write info
%><br/>
--------<br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub
%>