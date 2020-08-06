<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="md5.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<%If Request("SubmitFlag") <> "" Then			
			username=Request.Form("username")
			pass=Request.Form("pass")
			pass1=Request.Form("pass1")
			pass2=Request.Form("pass2")
			pass3=Request.Form("pass3")
if username="" or pass="" or pass1="" or pass2="" or pass3="" then
     response.write "<card id='card1' title='修改资料'><p align='left'>"
     response.write "对不起，各项都必须填写！<br/><br/><a href='admin_user.asp?sid="&sid&"'>返回重写</a><br/><a href='index.asp?sid="&sid&"'>[后台管理]</a></p></card></wml>"
     response.end
  End if
if pass<>pass1 then
     response.write "<card id='card1' title='修改资料'><p align='left'>"
     response.write "你的两次密码不一样！<br/><br/><a href='admin_user.asp?sid="&sid&"'>返回重写</a><br/><a href='index.asp?sid="&sid&"'>[后台管理]</a></p></card></wml>"
     response.end
  End if		
if pass2<>pass3 then
     response.write "<card id='card1' title='修改资料'><p align='left'>"
     response.write "你的两次高级密码不一样！<br/><br/><a href='admin_user.asp?sid="&sid&"'>返回重写</a><br/><a href='index.asp?sid="&sid&"'>[后台管理]</a></p></card></wml>"
     response.end
  End if	                 
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from admin"
				rs.open sql,conn,1,3
				if not (rs.bof and rs.eof) then                                    		                                rs("password")=md5(md5(pass,16),32)
                                rs("twapp_admin")=md5(md5(pass2,16),32)
			        rs("username")=md5(md5(username,16),32)
                              	rs.update				
				 Response.Write "<card id='card2' title='正在返回' ontimer='index.asp?sid="&sid&"'><timer value='5'/><p>"
			Response.Write "成功设置！正在返回..."
	 %>
<%else%>
<card id="index" title="后台帐号管理">
<p align="left"><img src="/IMG/3.gif" alt='修改帐号'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>
全部支持中文用户名和密码<br/>
管理员名称:<br/><input name="username" type="text"  value="" size="16" maxlength="255"/><br/>
		管理员密码:<br/><input name="pass" type="text"  size="16" maxlength="255" /><br/>
                确认新密码:<br/><input name="pass1" type="text"  size="16" maxlength="255" /><br/>
		管理员高级密码:<br/><input name="pass2" type="text"  size="16" maxlength="255" /><br/>
                确认新高级密码:<br/><input name="pass3" type="text"  size="16" maxlength="255" /><br/>
			<anchor>保存修改
			<go href="admin_user.asp?SubmitFlag=true&amp;sid=<%=sid%>" method="post">
			<postfield name="username" value="$(username:n)" />
			<postfield name="pass" value="$(pass:n)" />
			<postfield name="pass1" value="$(pass1:n)" />	
			<postfield name="pass2" value="$(pass2:n)" />
			<postfield name="pass3" value="$(pass3:n)" />		
			</go>
			</anchor>
<%end if%>

<br/><img src="/img/hr.gif" alt=""/><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
</wml>