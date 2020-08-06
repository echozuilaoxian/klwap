<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="ubbcode1.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="管理回收帖子" >
<p>
<%id=usb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from delzl where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该记录!")
else
%>
<%
reids=rs("idss")
if reids<>"0" then 
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&reids
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此会员"
Else
dlname=objgbrsy("usename")
end if
Else
dlname="系统消息"
end if
objgbrsy.close
Set objgbrsy= Nothing%>
帖子编号:<%=usb(rs("id"))%><br/>
<%
set objgbrsys=Server.CreateObject("ADODB.Recordset")
rspls="select * from usereg where id="&rs("reids")
objgbrsys.open rspls,conn,1,2
if objgbrsys.eof then 
dlnames="无此会员"
Else
dlnames=objgbrsys("usename")
end if
objgbrsys.close
Set objgbrsys= Nothing%>
帖子作者:<a href="yxxe_bbs_hy_gl.asp?id=<%=rs("idss")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>"><%=usb(dlname)%></a>(ID:<%=rs("idss")%>)<br/>
操作人员:<a href="yxxe_bbs_hy_gl.asp?id=<%=rs("reids")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>"><%=usb(dlnames)%></a>(ID:<%=rs("reids")%>)<br/>
操作时间:<%=usb(rs("times"))%><br/>
----------<br/>
帖子内容:<%=ubb(rs("yxxe"))%><br/>
----------<br/>
<a href="yxxe_bbs_Mes_xxxx.asp?adminmid=<%=request("adminmid")%>&amp;fid=<%=rs("idss")%>&amp;id=<%=id%>&amp;cz=1">将发帖人加黑</a><br/>
<%end if%>
----------<br/>
<a href="wap_Admin_delzl.asp?adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">返回回收帖子</a><br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p>
</card>
</wml>