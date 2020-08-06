<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='智力闯关'>  
<p align='left'>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim id
dim n
dim mykey
dim useranswer
dim right1
dim tjhm
useranswer=""
id=request("id")
n=request("n")
mykey=request("mykey")

for j=0 to 5
  if(j=Cint(mykey)) then
  useranswer=useranswer&"1"
  else
  useranswer=useranswer&"0"
  end if
  
  if(mid(id,j+1,1)="1")then  	
  right1=j+1
  end if
next 
if(Session("ok")="true") then
if id=useranswer then
Server.ScriptTimeout=999
iduse=Session("useid")
dim useid
useid=request("useid")
   set objgbrs=Server.CreateObject("ADODB.Recordset")
 sql="update usereg set xf=xf+0 where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
    set objgbrs=nothing
  Session("ok")="false"
  response.write "恭喜您，答对了！<br/><a href='/BBS/txjl/index.asp?n="&n&"&amp;SessionID=" & SessionID & "'>继续</a>"
else	
response.write "抱歉，答错了！正确的答案是选第"&right1&"个!<br/><a href='/BBS/txjl/index.asp?SessionID=" & SessionID & "'>继续</a>"
end if   

else
	
	response.write "请不要刷新！<br/><a href='/BBS/txjl/index.asp?n="&n&"&amp;SessionID=" & SessionID & "'>继续</a>"
	
end if             
%> 
<br/><a href='/bbs/school/school.asp?SessionID=<%=SessionID%>'>[社区学校]</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>[我的地盘]</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[社区首页]</a>
<br/><%=now%>
</p>
</card>
</wml>