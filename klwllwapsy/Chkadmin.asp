<%@LANGUAGE="VBScript" CODEPAGE="65001"%>

<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<!--#include file="conn.asp"-->
<!-- #include file="iprr.asp" -->
<!--#include file="md5.asp"-->
<card id="index" title="管理员登录"><p>
当前时间:<%=now()%><br/>
<% dim username,password,ydzq
ydzq=request.form("ydzq")
if ydzq<>"go.ppqy.cn" then
 Response.Write "程序已改版权！无法进入后台！<br/>"
 Response.Write "请尽快联系销魂堡站长,QQ762907090<br/>"
	        response.write "<a href='Login.asp'>返回</a><br/>"
 Response.Write "</p></card></wml>"
 response.end
 End if 
username=md5(md5(request.form("username"),16),32)
   password=md5(md5(request.form("password"),16),32)
   password1=md5(md5(request.form("password1"),16),32)
                set Rs=server.createobject("adodb.recordset")
                Sql="select * from [admin] where password='"&password&"' and twapp_admin='"&password1&"' and username='"&username&"'"
                Rs.open sql,conn,1,1
                if not(Rs.bof and Rs.eof) then
                sid=rs("sid")
                lastdate=rs("lastdate")
                lastip=rs("lastip")
                if password=Rs("password") and password1=rs("twapp_admin") and username=Rs("username") then
	        response.write "登录成功!"
rs.close
set rs=nothing
                End if
                 response.write "上次登录时间:"&lastdate&"<br/>"
                 response.write "上次登录IP:"&lastip&"<br/>"
                response.write "<a href='info.asp?sid="&sid&"'>进入管理>></a><br/>"
         else
	        response.write "用户或者密码不对!<br/><a href='Login.asp'>返回重新登录</a><br/>"
                ip=Request.ServerVariables("REMOTE_ADDR")
                set iipzr=server.createobject("adodb.recordset")
                Sqliqq="select * from [zrdl]"
                iipzr.open sqliqq,conn,1,3
                if not (iipzr.bof and iipzr.eof) then
                if ip=iipzr("ip") then         
                sql="update zrdl set dlnum=dlnum+1"             '注入一次加1
                conn.Execute(sql)
                End If
                else
                iipzr.addnew
                iipzr("ip")=ip
                iipzr("time")=now()
                iipzr.update()
End If
iipzr.close
set iipzr=nothing
End if   
conn.close
set conn=nothing
%><a href='/'>返回网站首页</a><br/>
<!--#include file="bq.gif"-->
</p>
</card>
</wml>
