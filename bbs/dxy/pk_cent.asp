﻿<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<%
 Response.write "<card  title=""斗西游对战高手""><p>"
  Response.write "【赚钱排行】<br/>"
 Response.write "排行榜按照在斗西游净赚"&getcent&"数排名<br/>"
set rs=Server.CreateObject("ADODB.Recordset")
rsppl="select userid,jbnum,id from YD_plist where jbnum > 0 order by jbnum desc"
rs.open rsppl,ydzqconn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10						
	Dim Count,page,pagecount,gopage			
	gopage="pk_cent.asp?SessionID="&SessionID&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For
set rs1=Server.CreateObject("ADODB.Recordset")
rs1.open"select usename from usereg where id="&rs("userid")&" order by id desc",conn,1,1
if not rs1.eof then
   Response.write "<a href=""/bbs/reg/useinfo.asp?id="&rs("userid")&"&amp;SessionID="&SessionID&""">"&ubb(rs1("usename"))&"(ID:"&ubb(rs("userid"))&")</a>[净胜"&rs("jbnum")&getcent&"]<br/>"
end if
rs1.close
set rs1=nothing
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input usename=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">跳转</a><br/>"
Else
   Response.write "暂无相关记录！<br/>"
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>