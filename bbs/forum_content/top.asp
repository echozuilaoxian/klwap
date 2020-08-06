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
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="145"
lasttls
Session("returnuppath")=""
  dim ky,desc
  ky=request.querystring("ky")
  if ky="" or ky>9 then
	ky=5
  end if
  san="f"
  select case ky
'================================
  case 1
  jh="t"
  wheretmp="where jh='" & jh & "' and san='" & san & "' and Cstr(itid)<>'80' "
  tip="精华"
  yxxe_net="100"
  desc="Id"
'================================
  case 8
  a="t"
  wheretmp="where a='" & a & "' and san='" & san & "' and Cstr(itid)<>'80' "
  tip="强帖"
  yxxe_net="100"
  desc="Id"
'================================
  case 9
  times="2100-10-10 12:12:12"
  wheretmp="where times='" & times & "' and san='" & san & "' and Cstr(itid)<>'80' "
  tip="顶贴"
  yxxe_net="100"
  desc="Id"
'================================
  case 7
  hd="t"
  wheretmp="where hd='" & hd & "' and san='" & san & "' and Cstr(itid)<>'80' "
  tip="活动"
  yxxe_net="100"
  desc="Id"
'================================
  case 2
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "' and DATEDIFF('s', retimes, now()) < 4760*60 "
  tip="热点"
  yxxe_net="100"
  desc="rc"
'================================
  case 3
  tj="t"
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "' and tj='" & tj & "'"
  tip="推荐"
  yxxe_net="100"
  desc="Id"
'================================
  case 4
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "' and DATEDIFF('s', retimes, now()) < 2880*60 "
  tip="热评"
  yxxe_net="100"
  desc="hfcont"
'================================
  case 6
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "'"
  tip="全部"
  yxxe_net="10000"
  desc="id"
'================================
  case 5
  wheretmp="where Cstr(itid)<>'80' and san='" & san & "' and DATEDIFF('s', retimes, now()) < 2880*60 "
  tip="最新"
  yxxe_net="100"
  desc="id"
  end select
%>
<card id="card1" title="<%=converttowidebaiti(tip)%><%=converttowidebaiti("帖子")%>TOP<%=yxxe_net%><%=converttowidebaiti("帖")%>">
<p>
<%=converttowidebaiti("排序:")%>
<select name="url" title="<%=converttowidebaiti("按精华排序")%>" value="<%=converttowidebaiti("按精华排序")%>">
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=1&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按精华排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=2&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按热点排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=3&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按推荐排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=4&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按热评排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=5&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按新帖排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=7&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按活动排序")%></option>
<option onpick='/BBS/Forum_ContenT/Top.Asp?ky=8&amp;SessionID=<%=SessionID%>'><%=converttowidebaiti("按强帖排序")%></option>
</select><br/>------------<br/>
<%
dim jdshow
jdshow=CLng(Session("showjd"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top "&yxxe_net&" * from wuza " & wheretmp & " order by "& desc &" desc "
  objgbrs.open ssql,conn,1,1
 objgbrs.PageSize=jdshow

  page=CLng(Request("page"))
 if page<1 or page="" then
    page=1
  End if

 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
if objgbrs.eof then

   Response.write ""&converttowidebaiti("暂时没有")& "" & converttowidebaiti(tip) & ""&converttowidebaiti("帖子")& "<br/>"
Else

 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    bihaocont=bihaocont+1
    tjhm=objgbrs("tjhm")
   if objgbrs("jh")="t" then
     jh="<img src='tu/jin.gif' alt='精'/>"
    else
     jh=""
   End if
   if objgbrs("pic")="k" then
     pics="<img src='tu/tu.gif' alt='图'/>"
    else
     pics=""
   End if
   if objgbrs("pic")="l" then
     ljj="<img src='tu/lian.gif' alt='链'/>"
    else
     ljj=""
   End if
   if objgbrs("pic")="r" then
     ruan="<img src='tu/luan.gif' alt='软'/>"
    else
     ruan=""
   End if
   if objgbrs("lzdname")="y" then
     yyy="<img src='tu/yin.gif' alt='隐'/>"
    else
     yyy=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="<img src='tu/tou.gif' alt='投'/>"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     lis="<img src='tu/bi.gif' alt='币'/>"
    else
     lis=""
   End if

   if objgbrs("maimai")="k" then
     mai="<img src='tu/mai.gif' alt='卖'/>"
    else
     mai=""
   End if

 if objgbrs("tj")="t" then
     tj="<img src='tu/jian.gif' alt='荐'/>"
    else
     tj=""
   End if
 if objgbrs("hd")="t" then
     hd="<img src='tu/huo.gif' alt='活'/>"
    else
     hd=""
   End if
 if objgbrs("bntj")="t" then
   bntj="<img src='tu/min.gif' alt='名'/>"
    else
     bntj=""
   End if
 if objgbrs("bntjyy1")="t" then
    bnt="<img src='tu/suo.gif' alt='锁'/>"
    else
     bnt=""
   End if
   if objgbrs("times")="2100-10-10 12:12:12" then
     zd="<img src='tu/din.gif' alt='顶'/>"
    else
     zd=""
   end if
if objgbrs("times")="2000-10-10 12:12:12" then
     sd="<img src='tu/di.gif' alt='底'/>"
 else 
 sd=""
End if
 if objgbrs("a")="t" then
      ggg="<img src='tu/qian.gif' alt='强'/>"
    else
     ggg=""
   End if
    hfyl=left(objgbrs("biaoti"),13)
   if len(objgbrs("biaoti"))>13 then
    hfyl=hfyl+"..."
   End if
Response.Write bihao+bihaocont & "." & "" & ggg &"" &  zd &"" & yyy &"" & jh &"" & tj &"" & hd &"" & bntj &"" & pics &"" & ljj &"" & ruan &"" & tou &"" & lis &"" & mai &""
Response.write"<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "&amp;ky=" & ky & "'>" & converttowidebaiti(hfyl) & "</a>"
if objgbrs("hfcont")>=1 then
Response.write "&nbsp;" & converttowidebaiti(redtjname) & "("&converttowidebaiti("回")& "<a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & objgbrs("itid") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & objgbrs("hfcont") & "</a>/"&converttowidebaiti("阅")& "" & objgbrs("rc") & ")<br/>"
else
Response.write "&nbsp;" & converttowidebaiti(redtjname) & "("&converttowidebaiti("阅")& "" & objgbrs("rc") & ")<br/>"
end if
    objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
    if objgbrs.PageCount>1 then
    response.write "---------------<br/>"
End if
If page<objgbrs.PageCount then
    Response.Write "<a href='/BBS/Forum_ContenT/Top.Asp?page=" & (page+1) & "&amp;SessionID=" & SessionID & "&amp;ky=" & ky & "'>"&converttowidebaiti("下页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("下页")& ""
End if
If page>1 then
    Response.Write "<a href='/BBS/Forum_ContenT/Top.Asp?page=" & (page-1) & "&amp;SessionID=" & SessionID & "&amp;ky=" & ky & "'>"&converttowidebaiti("上页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("上页")& ""
End if
if objgbrs.PageCount>1 then
response.write ""&converttowidebaiti("(" &  page & "/" & objgbrs.PageCount & "/" & objgbrs.RecordCount & ")")& "<br/>"
response.write "<input  name='p' value='2' size='3' format='*N'/>"&converttowidebaiti("页")& "<anchor>"&converttowidebaiti("跳页")& "<go method='post' href='/BBS/Forum_ContenT/Top.Asp?SessionID=" & SessionID & "&amp;ky=" & ky & "'><postfield name='page' value='$(p)'/></go></anchor><br/>"
End if

Response.write "---------------<br/><a href='/BBS/Forum_ContenT/Top.Asp?ky=6&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("查看全部帖子")& "</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区首页")& "</a><br/>"
response.write "报时:"&time&"</p></card></wml>"

conn.close
Set objgbrs= Nothing
set conn=nothing
%>
