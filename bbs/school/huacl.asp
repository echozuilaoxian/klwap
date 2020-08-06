<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="关爱生命-浇花">
<p align="left">
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")

Dim RefreshTime,isRefresh   
RefreshTime = 60  '防止刷新时间,单位（秒）   
isRefresh = 1   '是否使用防刷新功能，0=否，1=是   
If isRefresh = 1 Then  

If (Not IsEmpty(Session("RefreshTime"))) And RefreshTime > 0 Then  
If DateDiff("s", Session("RefreshTime"), Now()) < RefreshTime Then  
aaa=DateDiff("s", Session("RefreshTime"), Now())
     response.write "速度过快,请在<b>"&RefreshTime-aaa&"</b>秒后操作……"
     response.write "<br/><a href='hua.asp?SessionID=" & SessionID & "'>&gt;等待&lt;</a>"
     response.write "<br/>-----------<br/><a href='/bbs/school/school.asp?SessionID="&SessionID&"'>社区学校</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
     response.end
Response.End  
Else  
Session("RefreshTime") = Now()   
End If  
Else  
Session("RefreshTime") = Now()   
End If  
End If
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,qs,id,usejf,nianji from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("tili")<20 then
  response.write "你当前的体力是:"&objgbrs("tili")&",不够20体力,因此不能参与这劳动!"
  end if
  if objgbrs("tili")>=10 then
  sql="update usereg set tili=tili-20,qs=qs+10,love=love+10,xf=xf+1 where Cstr(id)='"& iduse &"'"
conn.Execute(sql)
response.write "浇花成功!<br/>"
response.write "系统奖励爱心+10，情商+10，学分+1，体力-20<br/>"
response.write "你当前的属性：<br/>爱心:"&objgbrs("love")&"<br/>情商:"&objgbrs("qs")&"<br/>学分:"&objgbrs("xf")&"<br/>体力:"&objgbrs("tili")&""
response.write "<br/>------------<br/><a href='hua.asp?SessionID="&SessionID&"'>&gt;继续浇花&lt;</a>"
end if
%>
<% 
Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/school/labor.asp?SessionID="&SessionID&"'>返回劳动首页</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>
