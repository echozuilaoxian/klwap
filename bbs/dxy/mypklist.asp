<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card title="挑战记录">
<p>【我的历史挑战记录】<br/>
我的挑战记录<br/>
<%
dim rs,ssql,TP,gettxt
  set rs=Server.CreateObject("ADODB.Recordset")
  gettxt="暂时还没有挑战记录!<br/>"
  ssql="select * from YD_jd where useid=" & myid & "  order by id desc"
  rs.open ssql,ydzqconn,1,1
if rs.eof then
response.write gettxt
Else
Dim PageSize,i
	PageSize=listnum					
	Dim Count,page,pagecount,gopage			
	gopage="mypklist.asp?SessionID="&SessionID&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For	
id2=rs("reuseid")
	dim getusename,getusename2
	if rs("about2")="A" then
	getusename="获胜,"
	getusename2="您赚了"&rs("num")&getcent&"！<br/>"
	elseif rs("about2")="B" then
	getusename="失败,"
	getusename2="您输了"&rs("num")&getcent&"！<br/>"
	elseif rs("about2")="C" then
	getusename="平局"
	getusename2="！<br/>"
	else
	getusename="对方放弃挑战"
	getusename2="！<br/>"
	end if
If rs("op")=1 Then

    Response.write "编号<a href='showjd.asp?id=" & rs("id") & "&amp;SessionID=" & SessionID & "'>"&rs("id")&"</a>被ID<a href='/bbs/reg/useinfo.asp?id=" & id2 & "&amp;SessionID=" & SessionID & "'>" & rs("reuseid") & "</a>应战,"&getusename&getusename2

else
if rs("reuseid")<>0 then
Response.write "编号<a href='showjd.asp?id=" & rs("id") & "&amp;SessionID=" & SessionID & "'>"&rs("id")&"</a>被ID<a href='/bbs/reg/useinfo.asp?id=" & id2 & "&amp;SessionID=" & SessionID & "'>" & rs("reuseid") & "</a>应战,未回应"
    else
    Response.write "编号<a href='showjd.asp?id=" & rs("id") & "&amp;SessionID=" & SessionID & "'>"&rs("id")&"</a>公开挑战,未回应"
    end if
    Response.write "<a href='deljd.asp?id=" & rs("id") & "&amp;SessionID=" & SessionID & "'>[删]</a>"
end if

    Response.write "<br/>"
rs.moveNext
 	Next
	'response.write "<br/>"&chr(13)
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下一页</a>"&chr(13)
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上一页</a>"&chr(13)

response.write "<br/>["&page&"/"&pagecount&"页 "&count&"条]<br/>"
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