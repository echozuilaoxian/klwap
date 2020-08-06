<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="Conn.Asp"-->
<!--#include file="ubbcode1.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
ns=Request.QueryString("ns")
n=Request.QueryString("n")
p=Request.QueryString("p")
page=Request.QueryString("page")
if not isnumeric(ns) then ns=10
if not isnumeric(p) then p=1
if not isnumeric(page) then page=1
if not isnumeric(n) then n=1
  dim sort,mytitle
  sort=request.querystring("sort")
  if sort="" then
  sort=1
end if
  select case sort
'================================
  case 1
  desc="Id"
  tip="网友最新上传照片"
  mytitle="最新上传"
'================================
  case 2
  tip="网友点击最多照片"
  mytitle="点击最多"
'================================
  case 3
  tip="网友评论最多照片"
  mytitle="评论最多"
'================================
  case else
  tip="网友最新上传照片"
  mytitle="最新上传"
 end select
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
Dim id
id=Request.QueryString("id")
If id="" or not IsNumeric(id) Then
response.write "<card id='card1' title='图片评论'><p>访问错误!"
response.write "<br/><a href='wap_showsoft.asp?sort="&sort&"&amp;adminmid="&request("adminmid")&"'>返回上级栏目</a></p></card></wml>"
response.end
End if

sqll="select * from data where Id="&id
set rss=server.createobject("adodb.recordset")
rss.open sqll,conn,1,1
if rss.eof and rss.bof then
response.write "<card id='card1' title='图片评论'><p>没有该图片<br/><a href='wap_showsoft.asp?sort="&sort&"&amp;adminmid="&request("adminmid")&"'>返回上级栏目</a></p></card></wml>"
response.end
end if
title=outHTM(rss("title"))
rss.close
set rss=nothing
%>
<card  title="针对-<%=title%>的评论">
<p>
<%
sql="select * from [Review] where PicID="&id
set rs=server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
end if
rs.close
set rs=nothing

call main
Function main
if id<>"" then%>
<%
Dim totalcs
sql="select * from [Review] where IswNumsClass="&id&" order by PicID desc"
set rs=server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,1
	pageID = Request("pageID")
	Rs.PageSize = 10
	if not (rs.bof and rs.eof)  then 
	IF Not IsEmpty(pageID) Then
		IF Not IsNumeric(pageID) Then		
			pageID=1
		Else
			pageID=Cint(pageID)
		End IF

		IF pageID > Rs.PageCount Then
			Rs.AbsolutePage = Rs.PageCount
		ElseIF pageID <= 0 Then
			Rs.AbsolutePage = 1
		Else
			Rs.AbsolutePage = pageID
		End IF
	Else
		Rs.AbsolutePage = 1
	End IF
	pageID = Rs.AbsolutePage
Response.Write("<a href='wap_Admin_zpReviewDelAll.asp?id="&rs("IswNumsClass")&"&amp;nid="&id&"&amp;sort="&sort&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'>删除本张图片所有的评论</a><br/>------------<br />")
	For i=1 to Rs.PageSize
		If Rs.Eof Then
			exit For
		End If
%>
<%=i+(pageID-1)*10%>.
<a href="wap_Admin_zpReviewDel.asp?id=<%=rs("PicID")%>&amp;nid=<%=id%>&amp;sort=<%=sort%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">删除本条评论</a><br/>
作者名称：<%=outHTM(rs(2))%><br />
评论内容：<%=UBBCode(outHTM(rs(3)))%><br />
评论时间：<%=String(2-Len(Month(rs("IswNumsDate"))),"0") & Month(rs("IswNumsDate")) %>月<%=String(2-len(Day(rs("IswNumsDate"))),"0") & Day(rs("IswNumsDate"))%>日<%=String(2-Len(hour(rs("IswNumsDate"))),"0") & hour(rs("IswNumsDate")) %>时<%=String(2-Len(minute(rs("IswNumsDate"))),"0") & minute(rs("IswNumsDate"))%>分<br />
评论人IP：<%=rs(6)%><br /> 
			<%
		Rs.MoveNext
	Next

        Response.Write ("------------<br />") 

    	if pageID>=Rs.PageCount then
        	'Response.Write ("下页")        
    	else
        	Response.Write("<a href='"&name&"?id="&id&"&amp;sort="&sort&"&amp;page="&page&"&amp;PageID=" & (PageID+1) & "&amp;adminmid="&request("adminmid")&"'>下页</a>")
    	end if

    	if pageID<=1 then
        	'Response.Write ("上页")
    	else        
        	Response.Write("<a href='"&name&"?id="&id&"&amp;sort="&sort&"&amp;page="&page&"&amp;PageID=" & (PageID-1) & "&amp;adminmid="&request("adminmid")&"'>上页</a>")
    	end if

    	if pageID > 1 or pageID < Rs.PageCount then
                response.write("("&pageID&"/"&Rs.PageCount&"/"&rs.recordcount&")<br/>")
                response.write("<input name='PageID' format='*N' size='2'/>页<a href='"&name&"?id="&id&"&amp;sort="&sort&"&amp;page="&page&"&amp;PageID=&#x24;(PageID)&amp;adminmid="&request("adminmid")&"'>跳页</a><br/>")
    	else
        	'Response.Write ("上页")
    	end if

       else%>
		暂无评论<br/>------------<br />
	<%end if
		Rs.close
		set rs=nothing
else
%>
出错啦!请不要非法提交参数<br/>
<%end if
end Function%>
<%
response.write "<a href='admin_wapDISPLAY.asp?id="&id&"&amp;sort="&sort&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'>返回" & title & "</a><br />"
%>
<a href="wap_showsoft.asp?sort=<%=sort%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">管理-<%=mytitle%></a><br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card></wml>
<%
set rs=nothing
conn.close()
set conn=nothing
%>