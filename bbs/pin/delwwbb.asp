<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<%
dim page,debzs,itid,ids
  ids=request("ids")
  itid=request("itid")
  debzs=CStr(request("debz"))
  page=request("page")
  id=request("id")
if Cstr(Session("ltglzdl"))=Cstr(itid) or Cstr(ids)=Cstr(Session("useid")) or Session("Counter")="pass_numbers_55556666" then
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除评论'><p>确定删除?<br/><a href="delwwbb.asp?ids=<% =ids %>&amp;id=<% =id %>&amp;itid=<% =itid %>&amp;debzs=<% =debzs %>&amp;page=<% =page %>&amp;acc=1&amp;wap=<%=wap%>">是</a>
<br/><a href="zcwwclbb.asp?itid=<% =itid %>&amp;id=<% =id %>&amp;page=<% =page %>&amp;wap=<%=wap%>">否</a></p></card></wml>
<%
 conn.close
 set objgbrs=Nothing
 set conn=nothing
 response.end
end if

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuzayy Where CStr(id)='" & id &"' and Cstr(itid)='" & itid & "' and CStr(tjhm)=" & ids
  objgbrs.open ssql,conn
if not objgbrs.eof then
  idss=objgbrs("tjhm")
  baoti=Left(objgbrs("biaoti"),20)
 if Cstr(itid)<>"13" then
  delzlcl()
 End if
    sql="delete from wuzayy Where CStr(id)='" & id & "'"
  Application.lock
  conn.Execute(sql)
  Application.Unlock
end if
  response.write "<card id='card1' title='删除成功' ontimer='zcwwbb.asp?itid=" & itid & "&amp;page=" & page & "&amp;wap=" & wap & "'><timer value='10'/><p align='left'>"
  response.write "删除成功，正在返回...<br/>"
  response.write "<a href='zcwwbb.asp?itid=" & itid & "&amp;page=" & page & "&amp;wap=" & wap & "'>回上一级</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
else
  response.write "<card id='card1' title='删除成功'><p>越权操作！</p></card></wml>"
End if
 conn.close
 set objgbrs=Nothing
 set conn=nothing

function delzlcl()
end function
%>



