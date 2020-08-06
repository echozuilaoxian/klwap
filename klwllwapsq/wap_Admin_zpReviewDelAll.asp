<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include file="ubbcode1.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
page=int(request("page"))
sort=int(request("sort"))
nid=int(request("nid"))
id=int(request("id"))
%>
<%
   dim sql 
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="delete from Review where IswNumsClass="&request("id")  
   conn.execute sql
   set rs=server.createobject("adodb.recordset")
   sql="update data set re=0 where id="&request("nid")
   conn.execute sql
   set rs=nothing  
   conn.close
   set conn=nothing
%>
<card id='card1' title='删除评论' ontimer='wap_Admin_zpReviewView.asp?id=<%=nid%>&amp;sort=<%=sort%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>'><timer value='5'/>
<p>
成功删除本张图片所有评论，正在返回...<br/><br/>
<a href='wap_Admin_zpReviewView.asp?id=<%=nid%>&amp;sort=<%=sort%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>'>返回评论</a>
<br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>