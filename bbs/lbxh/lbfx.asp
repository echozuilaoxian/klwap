<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="社区龙宝">
<p align="left">=龙宝发行=<br/>
<!--#include file="admin.asp"-->
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
if Session("zh")="wap" then
        response.redirect"/bbs/yksm.asp?SessionID=" & SessionID & ""
    End if
hk=request("hk")
if hk="" then
 %>
龙宝名:<input type="text" name="bbsname" title="龙宝名" maxlength="10" size="6"/>
<br/>价格:<input type="text" name="bbsid" title="龙宝价格" maxlength="15"  size="6"/>
<br/>数量:<input type="text" name="bbsjj" title="龙宝数量" maxlength="10" format="*N"  size="6"/>
<br/>发行部门:<input type="text" name="jjbm" title="发行部门" maxlength="10"  size="6"/>

<br/><anchor>确定发行
<go method="post" href='lbfx.asp?hk=cj&amp;SessionID=<%=SessionID%>'>
<postfield name="bbsname" value="$(bbsname)"/>
<postfield name="bbsjj" value="$(bbsjj)"/><postfield name="bbsid" value="$(bbsid)"/><postfield name="jjbm" value="$(jjbm)"/>
</go></anchor>
<%
end if
if hk="cj" then
bbsname=left(request("bbsname"),10)
bbsid=untowide(request("bbsid"))
bbsjj=clng(request("bbsjj"))
 bbsname=trim(bbsname)
 bbsjj=trim(bbsjj)
 bbsid=trim(bbsid)
  bbsname=untowide(bbsname)
jjbm=left(request("jjbm"),8)
jjbm=untowide(jjbm)
 if bbsname="" or jjbm="" or bbsjj="" or bbsid="" then
     response.write "各项必填<br/><a href='lbfx.aspSessionID="&SessionID&"'>返回重写</a>"
else
dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select jj_names from jj_hk where jj_names=" & sqlstr(bbsname)
  rs.open ssql,conn
if rs.eof then
sql="insert into jj_hk(jj_jg,jj_jg_y,jj_names,jj_sl,fh_name,fh_ids,jj_fh_sl,fh_jg)values("
  sql=sql & sqlstr(bbsid) & ","
  sql=sql & sqlstr(bbsid) & ","
sql=sql & sqlstr(bbsname) & ","
sql=sql & sqlstr(bbsjj) & ","
sql=sql & sqlstr(jjbm) & ","
sql=sql & sqlstr(1) & ","
sql=sql & sqlstr(bbsjj) & ","
  sql=sql & sqlstr(bbsid) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
 response.write "发行龙宝成功,<a href='lbfx.asp?SessionID="&SessionID&"'>点击这里</a>返回龙宝管理"
else
response.write "错误,系统已经存在["&bbsname&"]这股龙宝.<br/><a href='lbfx.asp?SessionID="&SessionID&"'>返回重写</a>"
rs.close
set rs=nothing
end if
end if
end if
end if

response.write "<br/><a href='index.asp?sessionID="&sessionID&"'>返回龙宝中心</a>"

%>

</p></card></wml>