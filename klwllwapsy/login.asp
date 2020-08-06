<%@LANGUAGE="VBScript" CODEPAGE="65001"%>

<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<!-- #include file="conn.asp" -->
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="网站后台管理">
<p>
<%
set Rsipcc=server.createobject("adodb.recordset")
                Sqlqqcc="select [ipzr] from [zrsz]"
                Rsipcc.open sqlqqcc,conn,1,1
                if not (Rsipcc.bof and Rsipcc.eof) then
                ipnum=Rsipcc("ipzr")
end if
Rsipcc.close
set Rsipcc=nothing
ip=Request.ServerVariables("REMOTE_ADDR")
              set Rsip=server.createobject("adodb.recordset")
              Sqlqqq="select * from [zrip]"
              Rsip.open sqlqqq,conn,1,1
              if not (Rsip.bof and Rsip.eof) then
              if ip=Rsip("ip") and Rsip("ipnum")>=ipnum then
              response.redirect "/getout.asp"
          end if 
     end if
Rsip.close
set Rsip=nothing
dim ydzq
ydzq="go.ppqy.cn"

%>
网站用户：<br/>
<input name="username" title="名称" type="text" maxlength="20" /><br/>
登录密码：<br/>
<input name="password" title="密码" type="password" maxlength="20" /><br/>
高级密码：<br/>
<input name="password1" title="密码" type="password" maxlength="20" /><br/>
<anchor>确认进入>><go href="Chkadmin.asp" method="post" accept-charset="utf-8">
        <postfield name="username" value="$(username)"/>
        <postfield name="password" value="$(password)"/>
        <postfield name="password1" value="$(password1)"/>
        <postfield name="ydzq" value="<%=ydzq%>"/>
    </go>
</anchor>
<br/>
<!--#include file="bq.gif"-->
</p></card></wml>