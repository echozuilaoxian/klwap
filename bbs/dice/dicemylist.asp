<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->

<%
dim paysmall,paybig,payds,payss,paybz,paylu
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paysmall,paybig,payds,payss,paybz,paylu from diceadmin where id=1",ydzqconn,1,1
if not rs.eof then
paysmall=rs(0)
paybig=rs(1)
payds=rs(2)
payss=rs(3)
paybz=rs(4)
paylu=rs(5)
end if
rs.close
set rs=nothing
 Response.write "<card  title=""幸运彩球投注记录""><p>您的幸运彩球投注记录<br/>"
set rs=Server.CreateObject("ADODB.Recordset")
rsppl="select diceid,paytype,winer,comeover,hs,payusid  from dicelist where payusid="&myid&" group by diceid,paytype,winer,comeover,hs,payusid"
rs.open rsppl,ydzqconn,1,1
If Not rs.eof	Then
	Dim PageSize,i
	PageSize=10						
	Dim Count,page,pagecount,gopage			
	gopage="dicemylist.asp?SessionID=" & SessionID &"&amp;"
	Count=rs.recordcount	
	page=int(request.QueryString ("page"))
	if page<=0 or page="" then page=1		
	pagecount=(count+pagesize-1)\pagesize	
        if page>pagecount then page=pagecount
	rs.move(pagesize*(page-1))
	For i=1 To PageSize     						
	If rs.eof Then Exit For
	
	dim paycents,rs1
if rs("paytype")<>5 then
  set rs1=ydzqconn.execute("Select sum(paycent) as paycents from dicelist where paytype="&rs("paytype")&" and diceid="&rs("diceID")&" and payusid="&rs("payusid"))
  else
  set rs1=ydzqconn.execute("Select sum(paycent) as paycents from dicelist where paytype="&rs("paytype")&" and hs="&rs("hs")&" and diceid="&rs("diceID")&" and payusid="&rs("payusid"))
  end if
  paycents=rs1("paycents")
  rs1.close
  set rs1=nothing
  dim typeName,paycentall
if rs("paytype")=1 then
paycentall=abs(int(paycents*paysmall))
typeName="压小点"
elseif rs("paytype")=2 then
paycentall=abs(int(paycents*paybig))
typeName="压大点"
elseif rs("paytype")=3 then
paycentall=abs(int(paycents*payds))
typeName="压单点"
elseif rs("paytype")=4 then
paycentall=abs(int(paycents*payss))
typeName="压双点"
elseif rs("paytype")=5 then
paycentall=abs(int(paycents*paybz))
typeName="压合数("&rs("hs")&")"
end if

if rs("comeover")>0 then
if rs("winer")=1 then

Response.write "第"&rs("diceid")&"期"&typeName&""&paycents&getcent&",赢"&paycentall&getcent&"<br/>"
else
Response.write "第"&rs("diceid")&"期"&typeName&""&paycents&getcent&",输局<br/>"
end if
else
Response.write "第"&rs("diceid")&"期"&typeName&""&paycents&getcent&",未开<br/>"
end if

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