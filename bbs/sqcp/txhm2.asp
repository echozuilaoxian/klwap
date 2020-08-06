<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/sqcp/conn.asp"-->
<wml>
<card id="card1" title="特码投注">
<p align="left">
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
    End if
set rs=server.createobject("adodb.recordset")
sql="select * from kjhm order by id desc"
rs.open sql,conn,1,1
%>
选择生肖:<select name='csx' value='猪'>
<option value="鼠">鼠</option>
<option value="牛">牛</option>
<option value="虎">虎</option>
<option value="兔">兔</option>
<option value="龙">龙</option>
<option value="蛇">蛇</option>
<option value="马">马</option>
<option value="羊">羊</option>
<option value="猴">猴</option>
<option value="鸡">鸡</option>
<option value="狗">狗</option>
<option value="猪">猪</option>
</select>
<br/>购买金额:<input  name="ks"  value="100" format="*N" size="7" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/sqcp/txhmcl1.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(csx)"/>
<postfield name="ks" value="$(ks)"/>
</go>
</anchor><br/>
-------------
<br/><a href='/bbs/sqcp/sqcp.asp?SessionID=<%=SessionID%>'>返回社区彩票</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>
<% 
rs.close
Set rs= Nothing
conn.close
set conn=nothing
%>