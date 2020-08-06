<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")

lasttlls="42"
lasttls
id=request("id")
idd=request("idd")
country=request("country")
thank=request("thank")
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(id)=" & id &" and Cstr(idd)=" & iduse
rs.open ssql1,conn
if rs.eof then
   Response.write "<card id='card1' title='好友分组'><p>ID错误<br/></p></card></wml>"
response.end
 Else
if country="" or thank="" then
   Response.write "<card id='card1' title='修改分组'><p>组名.排序不能为空<br/><a href='/bbs/friandbook/hyfz/bbs_fzxg.asp?idd="&idd&"&amp;SessionID=" & SessionID & "'>返回修改" & converttowidebaiti(ycccc) & "</a><br/></p></card></wml>"
response.end
 Else
  sql="update myfriend set useid='"& id & "' Where CStr(useid)='" & id & "' and ids='"&iduse&"'"
  conn.Execute(sql)

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from wry where id="&id
rs.open rspl,conn,1,2
if country<>"" then rs("country")=country
if thank<>"" then rs("thank")=thank
rs.update
'---关闭数据----
%>
<card id='card1' title='修改分组'>
<p>
成功编辑名为<u>[<%=country%>]</u>的分组
<% 
Response.Write "<br/>-------------<br/>"
Response.write "<a href='/bbs/friandbook/hyfz/myfzhy.asp?idd="&id&"&amp;SessionID=" & SessionID & "'>返回" &country& "</a><br/>"
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID& "'>返回默认分组</a><br/>"
Response.write "<a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>返回分组管理</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a></p></card></wml>"
%>
<%
rs.close
set rs=nothing
end if
end if
%>