<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="爱心排行"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="156"
lasttlls="156"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "你好，<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowide(gfdsa) & "</a>"
Response.write "<br/><a href='/bbs/mysx.asp?SessionID=" & SessionID & "'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
  dim bz,objgbrs
  bz=request("bz")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 10 * from usereg order by love desc"
  objgbrs.open ssql,conn
Response.write "<br/>学校爱心排行前十<br/>------------<br/>"
if objgbrs.eof then
Response.write "暂时空缺<br/>"
 Else
For k=1 to 10
bihaocont=bihaocont+1
Response.write bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "</a><br/>爱心：(" & objgbrs("love") & ")<br/>"
Response.write "当前年级:"
if objgbrs("nianji")=1 then
Response.write "小学一年级<br/>"
end if
if objgbrs("nianji")=2 then
Response.write "小学二年级<br/>"
end if
if objgbrs("nianji")=3 then
Response.write "小学三年级<br/>"
end if
if objgbrs("nianji")=4 then
Response.write "小学四年级<br/>"
end if
if objgbrs("nianji")=5 then
Response.write "小学五年级<br/>"
end if
if objgbrs("nianji")=6 then
Response.write "小学六年级<br/>"
end if
if objgbrs("nianji")=7 then
Response.write "初中一年级<br/>"
end if
if objgbrs("nianji")=8 then
Response.write "初中二年级<br/>"
end if
if objgbrs("nianji")=9 then
Response.write "初中三年级<br/>"
end if
if objgbrs("nianji")=10 then
Response.write "高中一年级<br/>"
end if
if objgbrs("nianji")=11 then
Response.write "高中二年级<br/>"
end if
if objgbrs("nianji")=12 then
Response.write "高中三年级<br/>"
end if
if objgbrs("nianji")=13 then
Response.write "大学一年级<br/>"
end if
if objgbrs("nianji")=14 then
Response.write "大学二年级<br/>"
end if
if objgbrs("nianji")=15 then
Response.write "大学三年级<br/>"
end if
if objgbrs("nianji")=16 then
Response.write "大学四年级<br/>"
end if
if objgbrs("nianji")=17 then
Response.write "硕士生<br/>"
end if
if objgbrs("nianji")=18 then
Response.write "博士生<br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "------------<br/>"
Response.write "<a href='/bbs/school/ph.asp?SessionID="&SessionID&"'>返回排行榜</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>


