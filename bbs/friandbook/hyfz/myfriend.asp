<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<card id="card1" title="管理分组"><p>管理分组<br/>-----------<br/>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="42"
lasttls
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(idd)=" & iduse & "  order by thank"
rs.open ssql1,conn
if rs.eof then
   Response.write "你没有创建分组<br/>"
 Else
For k=1 to 10
Response.write "<a href='dc.asp?idd=" & rs("thank") & "&amp;wap=" & wap & "'>" & rs("country")&"</a><br/>"
rs.Movenext
if rs.EOF then Exit for
 Next
End if
rs.close
	set rs=nothing

 
Response.write "------------<br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>我的好友</a><br/><a href='/bbs/public/ckly.asp?wap=" & wap & "'>收件箱</a> <a href='/bbs/friandbook/subnocl1.asp?wap=" & wap & "'>黑名单</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a>-<a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
%>



