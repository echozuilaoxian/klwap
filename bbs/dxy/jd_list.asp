<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card title="挑战列表">
<p>
<%
dim rs,ssql
  set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where reuseid=" & myid & " and about='J' order by id desc"
  rs.open ssql,ydzqconn,1,1
if rs.eof then
response.write "暂时还没有人向你发起挑战！<br/>"
Else
response.write "别人对我发起的挑战列表:<br/>"
Dim PageSize,i
	PageSize=10					
	Dim Count,page,pagecount,gopage			
	gopage="jd_list.asp?TP="&TP&"&amp;SessionID="&SessionID&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For	
dim id1,num,objgbrs1,ssql1
id1=rs("useid")
num=rs("num")
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename,id from usereg where id=" & id1
  objgbrs1.open ssql1,conn
Response.write ""&i+(page-1)*PageSize&"."
Response.write "<a href='/BBS/reg/useinfo.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>" & objgbrs1("usename") & "(ID:" & id1 & ")</a>向你发起挑战<br/>下注金额为" & rs("num") & getcent&"<br/>选择><a href='pk_jd2.asp?id=" & id1 & "&amp;SessionID=" & SessionID & "'>妖怪</a>.<a href='pk_st2.asp?id=" & id1 & "&amp;SessionID=" & SessionID & "'>悟空</a>.<a href='pk_b2.asp?id=" & id1 & "&amp;SessionID=" & SessionID & "'>唐僧</a><br/><a href='outjd.asp?id=" & id1 & "&amp;SessionID=" & SessionID & "'>放弃本次挑战</a><br/>"
rs.moveNext
 	Next
	'response.write "<br/>"&chr(13)
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下一页</a>"&chr(13)
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上一页</a>"&chr(13)
	if pagecount>1 then response.write "<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""2""/><a href="""&gopage&"page=$(page)"">跳到该页</a><br/>"
rs.close
set rs=nothing
end if
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>