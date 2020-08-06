<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的号码"><p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

dim idss,zjhm
set objgbr=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from zjhm"
  objgbr.open ssqlx,conn,1,1
if objgbr.eof then
   'Response.write "晕晕的...还没开奖呢!<br/>"
else
objgbr.movelast
idss=objgbr("idss")
idssl=objgbr("idss")+1
response.write "本期是第<b>"&idssl&"</b>期,"
End if
objgbr.close
Set objgbr= Nothing

id=Session("useid")
dim jdshow,id
jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select * from sqcp where ids='" & id & "'  "
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
  response.write "你下了<b><u>"&objgbrs.RecordCount&"</u></b>注<br/>------------<br/>"

if objgbrs.eof then
   Response.write "哟!真健忘,我本期还没买呢!"
Else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
    Response.write "第<b><u>"&bihao+bihaocont &"</u></b>张."&"号码:<b><u>"& objgbrs("hm") &"</u></b> <br/>时间:<u>"&objgbrs("time")&"</u><br/>"
objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
if objgbrs.PageCount>1 then
    response.write "------------<br/>"
  End if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/bbs/sqcp/wdhm.asp?page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If page>1 then
    Response.Write "<a href='/bbs/sqcp/wdhm.asp?page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#47;" & "" & objgbrs.RecordCount & "&#41;"
response.write "<a href='#card2'>跳页</a><br/>"
    else
    response.write "<br/>"
End if

Response.write "------------<br/><a href='/bbs/sqcp/qbhm.asp?SessionID=" & SessionID & "'>查看全部号码</a><br/><a href='/bbs/sqcp/sqcp.asp?sessionID=" & SessionID & "'>返回社区彩票</a><br/><a href='/bbs/index.asp?sessionID=" & SessionID & "'>返回社区首页</a></p></card>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
Response.write "<card id='card2' title='跳页'><p>"
Response.write "跳到第：<input  name='page' value='1' format='*N'/><anchor>页，跳吧<go method='post'  href='/bbs/sqcp/wdhm.asp?'><postfield name='id' value='" & useid & "'/><postfield name='sessionID' value='" & sessionID & "'/><postfield name='page' value='$(page)'/></go></anchor></p></card></wml>"
%>