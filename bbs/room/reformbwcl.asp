<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim idd,keyword,selects
selects=Cstr(request("select"))
keyword=request("keyword")
idd=Cstr(request("id"))
t=request("t")
keyword=untowide(keyword) 
if keyword="" then
     response.write "<card id='card1' title='修改版文'>"
     response.write "<p align='center'>"
     response.write "内容不能为空!"
     response.write "<br/><a href='romgl.asp?id=" & id & "&amp;ck=gg&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
  End if
  sql="update rom set baoti='" & keyword & "' Where CStr(idd)='" & id & "'"
  Application.Lock
  myc.Execute(sql)
  Application.Unlock
conn.close
set conn=nothing
  response.write "<card id='card1' title='修改版文' ontimer='/bbs/room/room.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='5'/><p>"
response.write"修改成功！！"
Response.write "<br/><a href='/bbs/room/room.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>返回聊室</a>"
Response.write "<br/><a href='/bbs/room/index.asp?SessionID=" & SessionID & "'>返回聊吧大厅</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
  response.write "<br/></p></card></wml>"
  
Function untowide(str)
str=replace(str,"<","<")
str=replace(str,">",">")
str=replace(str,"$","")
str=replace(str,"&","&amp;")
str=replace(str,"","")
str=replace(str,"ω","")
str=replace(str,"〣","")
str=replace(str,"≡","")
str=replace(str,"£","")
str=replace(str,"の","")
str=replace(str,"¤","")
str=replace(str,"ゞ","")
str=replace(str,"￡","")
str=replace(str,"§","")
str=replace(str,"℡","")
str=replace(str,"","")
str=replace(str,"〆","")
str=replace(str,"ㄣ","")
str=replace(str,"乆","")
str=replace(str,"ぷ","")
str=replace(str,"ش","")
str=replace(str,"%","")
str=replace(str,"ø","")
str=replace(str,"＿","")
str=replace(str,"一夜情","***")
str=replace(str,"坐爱","**")
str=replace(str,"日你妈","***")
str=replace(str,"人妖","**")
str=replace(str,"操你妈","***")
str=replace(str,"激情","**")
str=replace(str,"阴经","**")
str=replace(str,"阴道","**")
str=replace(str,"肉棒","**")
str=replace(str,"肉洞","**")
str=replace(str,"激情","**")
str=replace(str,"强奸","**")
str=replace(str,"法轮功","***")
str=replace(str,"办证","**")
str=replace(str,"做爱","**")
str=replace(str,"日逼","**")
str=replace(str,"口交","**")
str=replace(str,"射精","**")
str=replace(str,"精子","**")
str=replace(str,"精液","**")
str=replace(str,"阴茎","**")
str=replace(str,"罩乳","**")
str=replace(str,"头乳","**")
str=replace(str,"肉体","**")
str=replace(str,"雞巴","**")
str=replace(str,"鸡巴","**")
str=replace(str,"狗杂种","***")
str=replace(str,"性交","**")
str=replace(str,"狗日的","***")
str=replace(str,"骚逼","**")
untoWide=str
end function
%>



