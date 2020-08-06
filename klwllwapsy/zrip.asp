<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include file="Admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="注入管理"><p>
<%
Dim Action,ID,ipzrcs
ID=Request.QueryString("ID")
ipzrcs=Request.QueryString("ipzrcs")
Action=Request.QueryString("Action")
Select case Action
Case"iplock"
	iplock
Case"ipdel"
	ipdel
Case"ipsz"
	ipsz
Case"ipzrs"
	ipzrs
Case Else
	zrip
End select
Sub zrip
Dim Rs,Sql
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select [id],[time],[ip],[ipnum] from [zrip]"
	Rs.open Sql,Conn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=5						
	Dim Count,page,pagecount,gopage,parent			
	gopage="zrip.asp?sid="&sid&"&amp;"
	Count=rs.recordcount
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount	
	rs.move(pagesize*(page-1))				
	For i=1 To PageSize       						
	If rs.eof Then Exit For				
response.write ""&i+(page-1)*PageSize&"."
response.write " 注入IP:"&rs("ip")&"<br/>"
response.write " 注入时间:"&rs("time")&"<br/>"
response.write " <a href=""zrip.asp?Action=iplock&amp;sid="&sid&"&amp;id="&rs("id")&""">封锁</a>|"
response.write " <a href=""zrip.asp?Action=ipdel&amp;sid="&sid&"&amp;id="&rs("id")&""">删除</a><br/>"  
	rs.moveNext								
	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">>></a>"
Else
response.write " (没有IP记录)<br/>"
end if
rs.close
set rs=nothing
End Sub
Sub ipdel
Dim Rss
     Set rss=conn.Execute("Delete From [zrip] Where ID="&ID&"")
     response.write "操作成功,成功删除封锁IP纪录!"
     response.write "<br/><a href=""zrip.asp?sid="&sid&""">[返回]</a><br/>"
End Sub
Sub iplock
     sql="update zrip set ipnum=ipnum+1000 Where ID="&ID&""   '应该你不会限制允许一千次注入吧
     conn.Execute(sql)
     response.write "操作成功,成功封锁IP纪录!"
     response.write "<br/><a href=""zrip.asp?sid="&sid&""">[返回]</a><br/>"
End Sub
Sub ipsz
response.write " 设置允许注入次数<br/>"  
response.write " <input name=""ipzrcs"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""4""/>次<a href=""zrip.asp?Action=ipzrs&amp;sid="&sid&"&amp;ipzrcs=$(ipzrcs)"">确定</a><br/>" 
End Sub
Sub ipzrs
set Rssip=Server.CreateObject("ADODB.Recordset")
Sqlip="select [ipzr] from [zrsz]"
	Rssip.open Sqlip,Conn,1,3
if not (Rssip.bof and Rssip.eof) then
        Rssip("ipzr")=ipzrcs
        Rssip.update()
     response.write "操作成功,成功设置允许注入次数!"
     response.write "<br/><a href=""zrip.asp?sid="&sid&""">[返回]</a><br/>"
else
     response.write "非法操作!GET OUT!"
end if
End Sub
%>
<a href="zrcl.asp?sid=<%=sid%>">[注入管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>