<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="球彩排行榜" >
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")

  if ky="" or ky>8 or ky<1 then
	ky=8
  end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if

set rss=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rss.open rsQL,myc,1,2
if rss.recordcount<1 then
rss.addnew
rss("ids")=iduse
rss.update
end if
usejf=rss("usejf")
        rss.Close
	Set rss=Nothing
idsx=request("idsx")
page=request("page")
ky=request("ky")

set rsf=Server.CreateObject("ADODB.Recordset")
rsQf="select * from cpjf where cstr(ids)='"&idsx&"'"
rsf.open rsQf,myc
if rsf.eof then
Response.write "没有该用户信息<br/>"
else
tjhm=rsf("ids")
%>
<%if iduse<>tjhm then%> 
<%=ubb(redtjname)%>:的中奖记录<br/><a href='/BBS/reg/useinfo.asp?id=<%=idsx%>&amp;SessionID=<%=SessionID%>'>社区资料</a>|<a href='/BBS/friandbook/addcl.asp?frid=<%=idsx%>&amp;SessionID=<%=SessionID%>'>加为好友</a><br/>--------------<br/>
<%else%>
我的状态<br/>
--------------<br/>
拥有球币:<b><%=usejf%></b><br/>
社区金币:<b><%=ssusejf%></b><br/>
--------------<br/>
<%end if%>
<b>历史投注累计:</b><b><%=ubb(rsf("tmmrjf"))%></b>球币<br/>
<b>历史中奖累计:</b><b><%=ubb(rsf("tmjf"))%></b>球币<br/>
<b>历史赢利累计:</b><b><%=rsf("tmjf")-rsf("tmmrjf")%></b>球币<br/>
<%if iduse<>tjhm then%> 
<a href='TOP.Asp?kyzc=yxxe&amp;idsx=<%=iduse%>&amp;SessionID=<%=SessionID%>'>我的中奖记录</a><br/>
<%else%>
<anchor><prev/>返回上级面页</anchor><br/>
<%end if%>
<%
end if
rsf.Close
Set rsf=Nothing

%>--------------<br/>
<a href="Index.Asp?SessionID=<%=SessionID%>">返回球赛博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>