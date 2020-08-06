<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<%
kyzc=request("kyzc")
if kyzc="" then
%>
<card id="main" title="管理中心" >
<p align="center">
→社区管理←<br/>
<a href='BBSBoard1.asp?adminmid=<%=request("adminmid")%>'>社区排版</a>◆<a href='xhbao.asp?adminmid=<%=request("adminmid")%>'>排版说明</a><br/>
<a href="yxxe_bbs_sz.asp?adminmid=<%=request("adminmid")%>">社区设置</a>◆<a href="yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>">物品管理</a><br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">版块管理</a>◆<a href="wap_admin_affiche.asp?adminmid=<%=request("adminmid")%>">公告管理</a><br/>
<a href="BBSBoard.asp?Action=BBSTopic&amp;adminmid=<%=request("adminmid")%>">贴子管理</a>◆<a href="BBSBoard.asp?Action=BBSReply&amp;adminmid=<%=request("adminmid")%>">回复管理</a><br/>
<a href="adminbp.asp?adminmid=<%=request("adminmid")%>">帮派管理</a>◆◆◆◆◆<br/>
<a href="yxxe_bbs_bbzz.asp?adminmid=<%=request("adminmid")%>">版主管理</a>◆<a href="BBSBoard.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>">操作记录</a><br/>
<a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>">会员管理</a>◆<a href="/bbs/wapcs/klwllwapsc/index.asp">上传设置</a><br/>
<a href="yxxe_bbs_mes.asp?adminmid=<%=request("adminmid")%>">消息管理</a>◆<a href="wap_Admin_delzl.asp?adminmid=<%=request("adminmid")%>">帖子回收</a><br/>
<a href="id.asp?adminmid=<%=request("adminmid")%>">注册设置</a>◆<a href='admingg.asp?adminmid=<%=request("adminmid")%>'>广告管理</a><br/>
<a href='xhadmindj.asp?adminmid=<%=request("adminmid")%>'>道具管理</a>◆<a href='qfxx.asp?adminmid=<%=request("adminmid")%>'>群发信息</a><br/><a href='adminbbsgb.asp?adminmid=<%=request("adminmid")%>'>送花管理</a>◆<a href='adminggbb.asp?adminmid=<%=request("adminmid")%>'>广播管理</a><br/>
<a href="wapBBS.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>">动态记录</a>◆<a href='wapqk.asp?adminmid=<%=request("adminmid")%>'>一键清空</a><br/>
→建站工具←<br/>
<a href="wapadmin_index.asp?kyzc=useaq&amp;adminmid=<%=request("adminmid")%>">帐号管理</a>◆
<a href="wap_databf.asp?adminmid=<%=request("adminmid")%>">备份数据</a><br/><a href="wap_hfsj.asp?adminmid=<%=request("adminmid")%>">恢复数据</a>◆
<a href="wap_admin_Sql.asp?adminmid=<%=request("adminmid")%>">SQL管理</a><br/>

<%
elseif kyzc="useaq" then
%>
<card id='card1' title='帐号管理'><p>
<%
dim rs,sql
Come=request("Come")
ky=request("ky")

if ky="" then
response.write "帐号管理<br/>--------------<br/><a href='wapadmin_index.asp?kyzc=useaq&amp;ky=usegl&amp;adminmid="&request("adminmid")&"'>修改用户帐号</a><br/>"
elseif ky="usegl" then
Set rs=Server.CreateObject("Adodb.RecordSet")
sql="Select * from Admin where Id="&session("Adminid")
rs.Open sql,conn,1,3
%>
修改帐号
<br/>--------------<br/>
新用户名:<input type="text" name="UserName<%=minute(now)%><%=second(now)%>" emptyok="true"  value="<%=rs("UserName")%>" /><br/>
新的密码:<input type="text" name="password<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
新的密码:<input type="text" name="PwdConfirm<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
安全密码:<input type="text" name="PwdConfirm<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
<anchor>确认修改<go method="post" href="wapadmin_index.asp?kyzc=useaq&amp;ky=usexg&amp;adminmid=<%=request("adminmid")%>" accept-charset="UTF-8">
<postfield name="action" value="action"/>
<postfield name="UserName" value="$(UserName<%=minute(now)%><%=second(now)%>)"/>
<postfield name="password" value="$(password<%=minute(now)%><%=second(now)%>)"/>
<postfield name="PwdConfirm" value="$(PwdConfirm<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<%
elseif ky="useglnew" then
%>
增加新管理员
<br/>--------------<br/>
用户帐号:<input type="text" name="UserName<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
用户密码:<input type="text" name="password<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
安全密码:<input type="text" name="PwdConfirm<%=minute(now)%><%=second(now)%>" emptyok="true"  value="" /><br/>
<anchor>确认修改<go method="post" href="wapadmin_index.asp?kyzc=useaq&amp;ky=usesave&amp;adminmid=<%=request("adminmid")%>" accept-charset="UTF-8">
<postfield name="action" value="action"/>
<postfield name="UserName" value="$(UserName<%=minute(now)%><%=second(now)%>)"/>
<postfield name="password" value="$(password<%=minute(now)%><%=second(now)%>)"/>
<postfield name="PwdConfirm" value="$(PwdConfirm<%=minute(now)%><%=second(now)%>)"/>
</go></anchor><br/>
<%
elseif ky="usexg" then

if session("Adminid")="1" then
dim Action,ErrMsg
Action=trim(request("Action"))
dim password,PwdConfirm,UserName
	password=trim(Request("Password"))
	PwdConfirm=trim(request("PwdConfirm"))
	UserName=trim(request("UserName"))


if Action<>"" then
	if password="" then
		ErrMsg="新密码不能为空！<br/>"
	Elseif PwdConfirm<>""&PwdConfirm&"" then
		ErrMsg="安全密码错误！<br/>"
Else
sqls="Select * from Admin where Id="&session("Adminid")
Set rss=Server.CreateObject("Adodb.RecordSet")
rss.Open sqls,conn,1,3
if UserName<>"" then rss("UserName")=UserName
if Password<>"" then rss("password")=md5(password)
rss.update
rss.close
set rss=nothing
ErrMsg="修改密码成功！<br/>下次登录时记得换用新密码哦！<br/>"

end if
end if
Else
ErrMsg="欢迎参观本系统,请不要做任何修改,谢谢!<br/>"

end if
response.write ""&ErrMsg&""

rs.close
set rs=nothing

Elseif ky="usesave" then
	password=usb(Request("Password"))
	PwdConfirm=usb(request("PwdConfirm"))
	UserName=usb(request("UserName"))

	if password="" then
		ErrMsg="密码不能为空！<br/>"
	Elseif UserName="" then
		ErrMsg="用户名不能为空！<br/>"
	Elseif PwdConfirm<>""&PwdConfirm&"" then
		ErrMsg="安全密码错误！<br/>"
Else
set rsw=Server.CreateObject("ADODB.Recordset")
rspl="select * from [Admin] order by id desc"
rsw.open rspl,conn,1,2
rsw.addnew
rsw("UserName")=UserName
rsw("password")=md5(password)
rsw.update
Userid=rsw("id")
UserNames=rsw("UserName")
rsw.close
set rsw=nothing
ErrMsg="成功添加新管理员<br/>用户帐号:"&UserNames&"<br/>用户ID"&Userid&"<br/>"
end if
response.write ""&ErrMsg&""
end if
response.write "--------------<br/><a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a><br/>"


end if%>
--------------<br/>
<a href="/index.asp">返回网站首页</a><br/>
报时:<%=time%></p></card></wml>
