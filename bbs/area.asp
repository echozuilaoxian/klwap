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
<card id="card1" title="帮派中心">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
dim ky
  ky=request.querystring("ky")
  if ky="" or ky>3 or ky<1 then
	ky=1
  end if
  select case ky
'================================
  case 1
  tip="最新"
  desc="Id"
'================================
  case 2
  tip="人数"
  desc="rcx"
'================================
  case 3
  tip="点击"
  desc="hfcont"
  end select

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if
%>
加入帮派需要交纳200金币的费用哦<br/>
<%
Response.write "<a href='/BBS/sctt.asp?SessionID=" & SessionID & "'>申请创建帮派</a><br/>"
dim rs
 set rs=Server.CreateObject("ADODB.Recordset")
       ssql1="select bzbzz from usereg where CStr(id)='" & iduse&"'"
       rs.open ssql1,conn
if rs("bzbzz")=0 then
Response.write "您的帮派:无门无派<br/>"
else
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&rs("bzbzz")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=rse("biaoti")
end if
Response.write "您的帮派:<a href='/bbs/djcs.asp?id=" & rse("id") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a><br/>"
end if
rs.close
Set rs= Nothing

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select id,biaoti,nai,rcx,tjhm from jzbl order by "&desc&" desc"
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=5
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if

 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if

if objgbrs.eof then
   Response.write "<br/>暂时没有帮派<br/>"
Else

Response.Write "<a href='/BBS/area.asp?ky=1&amp;SessionID=" & SessionID & "'>最新</a>.<a href='/BBS/area.asp?ky=2&amp;SessionID=" & SessionID & "'>人数</a>.<a href='/BBS/area.asp?ky=3&amp;SessionID=" & SessionID & "'>点击</a>"&tip&"<br/>----------<br/>"

 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*5-5
   End if
For i=1 to objgbrs.PageSize
    bihaocont=bihaocont+1
tjhm=objgbrs("tjhm")
Response.write bihao+bihaocont & "." & "帮派:<a href='/bbs/djcs.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("biaoti")) & "</a><br/>"
Response.Write "帮主:<a href='/BBS/reg/useinfo.asp?id=" & tjhm & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a><br/>"
Response.Write "<a href='/bbs/public/cylb.asp?bz=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>成员" & objgbrs("rcx") & "</a>."
Response.Write "<anchor>加入<go method='post' href='/bbs/public/jzjrcl.asp?SessionID=" & SessionID & "'><postfield name='setbzczz' value='" & objgbrs("id") & "'/><postfield name='id' value='" & iduse & "'/></go></anchor>.<anchor>退出<go method='post' href='/bbs/public/tcjz.asp?SessionID=" & SessionID & "'><postfield name='bzbzz' value='" & objgbrs("id") & "'/><postfield name='id' value='" & iduse & "'/></go></anchor><br/>"
Response.Write "简介:" & converttowidebaiti(objgbrs("nai")) & "<br/>----------<br/>"
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
if objgbrs.PageCount>1 then
End if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/area.asp?ky="&ky&"&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if

If page>1 then
    Response.Write "" & "<a href='/BBS/area.asp?ky="&ky&"&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if

if objgbrs.PageCount>1 then
response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "" & "共" & objgbrs.RecordCount & "个&#41;<br/>"
response.write "<input  name='page' value='2' size='2' format='*N'/>页<anchor>跳页<go method='post' href='/BBS/area.asp?ky="&ky&"&amp;SessionID=" & SessionID & "'><postfield name='page' value='$(page)'/></go></anchor><br/>"
End if
%>
<%
response.write "----------<br/>"
Response.write "<a href='/BBS/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>