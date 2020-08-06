<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="唇枪舌剑-咬好友"><p>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls



'--------------------
'宠物PK

'结束
'-------------------



  set objgbrsd=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename,usejf,usesex from usereg where CStr(id)='" & iduse & "'"
       objgbrsd.open ssql,conn
if objgbrsd.eof then
Response.write "错误,该号不存在"
else
if objgbrsd("usesex")=1 then
usesex="女"
else
usesex="男"
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd= &amp;"
End if
if objgbrsd("usejf")<10000  then 
                 %>
您的金币不够，进入游戏PK必须要10000金币以上<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<%
Response.Write "</p></card></wml>"
objgbrsd.close
Set objgbrsd= Nothing
response.end
end if
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8("name")=objgbrsd("usename")
rs8("sex")=usesex
rs8.update
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
if rs8("zhong")="n" then
Response.write "<a href='zhong.asp?SessionID="&SessionID&"'>请先设置你的种族</a><br/>"
else
Response.write "当你咬中你朋友的身体任何部位,被咬的好友会看自动的加入游戏.<br/>"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where ids='" & iduse & "' and Left(friid,1)<>'*' order by times desc"
objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "我的好友列表<br/>-----------<br/>你还没好友.快去寻找吧.<br/>"
  else
Response.write "我的好友列表<br/>-----------<br/>"
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages

if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize 
 bihaocont=bihaocont+1
tjhm=objgbrs("friid")
Response.write ""&bihao+bihaocont & ".<anchor title='确定'>" & converttowidebaiti(redtjname) & "<go method='post' href='zdcl.asp?SessionID="&SessionID&"'><postfield name='hotid' value='"&objgbrs("friid")&"'/></go></anchor><br/>"
objgbrs.Movenext

if objgbrs.EOF then Exit for
 Next
End if

Response.write "-----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='zd.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>[&gt;&gt;]</a>"
End if
If pages>1 then
Response.Write "" & "<a href='zd.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID& "'>[&lt;&lt;]</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
If pages<objgbrs.PageCount or pages>1 then
Response.write "-----------<br/>"
End if
End if
objgbrsd.close
set objgbrsd=nothing
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


