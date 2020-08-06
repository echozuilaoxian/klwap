
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%
dim paylu
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paylu,pcent from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
paylu=rs(0)
pcent=rs(1)
end if
rs.close
set rs=nothing
 Response.write "<card  title=""水果机投注记录""><p>"
response.write"<a href=""index.asp?SessionID="&SessionID&""">返回投注</a><br/>"
response.write"我的水果机投注记录<br/>"
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select pg,mg,xg,mag,sx,jz,sq,yb,appleID from myapple where payusid="&myid&" order by id desc",ydzqconn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10		
	Dim Count,page,pagecount,gopage			
	gopage="applemylist.asp?SessionID="&SessionID&"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For
	
	dim rs2,V_appletext
	V_appletext=""
 Set rs2 = Server.CreateObject("ADODB.Recordset")
 rs2.open"Select appletext from apple Where  id = "&rs("appleID")&" ORDER BY ID",ydzqconn,1,1

  if not rs2.eof then
 V_appletext=rs2(0)
 end if
 rs2.close
 set rs2=nothing
	
dim lutype,paycentall
if InStr(V_appletext,"[小]")>0 then
 lutype=3
 else
 lutype=LuApple(V_appletext)
end if

dim m_appletext:m_appletext=left(V_appletext,2)

paycentall=0

   if newappleID<>rs("appleid") then
   Response.write "-----------------<br/>第"&rs("appleid")&"期开奖:<b>"&V_appletext&"</b><br/>"
   end if

 response.write"下注"
  if rs("pg")>0 then
  response.write",苹果"&rs("pg")&"注"
  if m_appletext="苹果" then
  paycentall=abs(int(rs("pg")*pcent*lutype))
  end if
  end if
  if rs("mg")>0 then
  response.write",桔子"&rs("mg")&"注"
  if m_appletext="桔子" then
  paycentall=abs(int(rs("mg")*pcent*lutype))
  end if
  end if
  if rs("xg")>0 then
  response.write",芒果"&rs("xg")&"注"
  if m_appletext="芒果" then
  paycentall=abs(int(rs("xg")*pcent*lutype))
  end if
  end if
  if rs("mag")>0 then
  response.write",铃铛"&rs("mag")&"注"
  if m_appletext="铃铛" then
  paycentall=abs(int(rs("mag")*pcent*lutype))
  end if
  end if
  if rs("sx")>0 then
  response.write",西瓜"&rs("sx")&"注"
  if m_appletext="西瓜" then
  paycentall=abs(int(rs("sx")*pcent*lutype))
  end if
  end if
  if rs("jz")>0 then
  response.write",双星"&rs("jz")&"注"
  if m_appletext="双星" then
  paycentall=abs(int(rs("jz")*pcent*lutype))
  end if
  end if
  if rs("sq")>0 then
  response.write",双七"&rs("sq")&"注"
  if m_appletext="双七" then
  paycentall=abs(int(rs("sq")*pcent*lutype))
  end if
  end if
  if rs("yb")>0 then
  response.write",老王"&rs("yb")&"注"
  if m_appletext="老王" then
  paycentall=abs(int(rs("yb")*pcent*lutype))
  end if
  end if
if V_appletext<>"" then
if paycentall>0  then
Response.write "<br/>结果:赚"&paycentall&getcent&"<br/>"
else
Response.write "<br/>结果:输局<br/>"
end if
else
Response.write "<br/>结果:未开奖<br/>"
end if
newappleID=rs("appleid")
	rs.moveNext
 	Next
	if page-pagecount<0 then response.write "<a href="""&gopage&"page="&page+1&""">下页</a>"
	if page>1 then response.write "<a href="""&gopage&"page="&page-1&""">上页</a>"
	if pagecount>1 then response.write "<br/><b>"&page&"</b>/"&pagecount&"页<input name=""page"" format=""*N"" value="""&page&""" type=""text"" maxlength=""5"" emptyok=""true"" size=""3""/><a href="""&gopage&"page=$(page)"">跳转</a><br/>"
Else
   Response.write "暂无相关记录！<br/>"
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>注意：赌场每次从赢家奖金抽水<%=paylu%>%作为赌场佣金<br/>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>