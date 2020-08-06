<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="社区宾馆"><p>
<%
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
%>
<%
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM mydf"
rec.Open SQL,conn,1,1
   countall=countalls
   response.write "今天共有" & countall & "人来开房<br/>--------<br/>"
conn.close
set rec=nothing
set conn=nothing

Function countalls()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from mydf"
  objgbrr.open ssql,conn,1,1
countalls=objgbrr.RecordCount
set objgbrr=nothing
End Function
%>
第一步:<a href="/bbs/reg/dongf/loveroom/index.asp?nickname=%E6%88%BF%E5%AE%A2515&amp;act=custom&amp;SessionID=<%=SessionID%>">领取钥匙.打开房门</a><br/>
第二步:进入验证

<br/>------------<%
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"

Response.write "<br/>北京时间" & Hour(Time) & ":" & Minute(Time)
Response.write "</p></card></wml>"%>