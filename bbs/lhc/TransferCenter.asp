<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="六合虚拟博彩">
<p>
<%
dim iduse,kyzc
kyzc=request("kyzc")

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kyzc="&kyzc&""
End if

set rxs=Server.CreateObject("ADODB.Recordset")
rsxQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rxs.open rsxQL,myc,1,2
if rxs.recordcount<1 then
rxs.addnew
rxs("ids")=iduse
rxs.update
end if
usejf=rxs("usejf")
        rxs.Close
	Set rxs=Nothing
%>
<%if kyzc="jb" then%>
您有金币<%=ssusejf%>,与港币的汇率为1:1,即100金币能换100港币<br/>

请问您要用多少金币兑换港币呢?<br/>

我要用:<input name="num" size="3" format="*N" value="0" />

<br/><anchor>金币兑换<go method="post" href="/BBS/LHC/TransferCenter.asp?kyzc=jbcl&amp;SessionID=<%=request("SessionID")%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
<%

Response.Write "------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"
elseif kyzc="gb" then%>
您有港币<%=usejf%>,与金币的汇率为1:1,即100港币能换100金币<br/>
请问您要用多少港币兑换金币呢?<br/>
我要用:<input name="num" size="3" format="*N" value="0" />
<br/><anchor>港币兑换<go method="post" href="/BBS/LHC/TransferCenter.asp?kyzc=gbcl&amp;SessionID=<%=request("SessionID")%>">
<postfield name="num" value="$(num)"/>
</go></anchor><br/>
<%
Response.Write "------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"

elseif kyzc="gbcl" then
num=request("num")

if num="" or num<10 then
Response.Write "兑换数量不能为空或兑换数量低于10港币<br/>------------<br/><a href='/BBS/LHC/TransferCenter.asp?cnscu="&cnscu&"'>返回兑换中心</a><br/>"
else
num=clng(num)
usejf=clng(usejf)
if num>usejf then
msg="您没有这么多港币呀，你只有"&usejf&"港币<br/>------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"
else
sql="update usereg set usejf=usejf+"&num&" where cstr(id)="&iduse
  conn.Execute(sql)
sqlc="update cpjf set usejf=usejf-"&num&" where CStr(ids)="&iduse
myc.execute sqlc
msg="港币转换成功!<br/>"
end if
Response.Write ""&msg&""
end if

elseif kyzc="jbcl" then

num=request("num")
if num="" or num<10 then
Response.Write "兑换数量不能为空或兑换数量低于10金币<br/>------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"
else
ssusejf=clng(ssusejf)
yznum=clng(num)
if yznum>ssusejf then
msg="您没有这么多金币呀,你只有"&ssusejf&"金币<br/>------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"
else
sql="update usereg set usejf=usejf-"&num&" where cstr(id)="&iduse
  conn.Execute(sql)

sqlc="update cpjf set usejf=usejf+"&num&" where CStr(ids)="&iduse
myc.execute sqlc
msg="金币转换成功!<br/>------------<br/><a href='/BBS/LHC/TransferCenter.asp?SessionID="&SessionID&"'>返回兑换中心</a><br/>"
end if
Response.Write ""&msg&""
end if
else%>
您好.<b><%=ubb(gfdsa)%></b><br/>
你有<b><%=ubb(ssusejf)%></b>金币，<b><%=ubb(usejf)%></b>港币，
现转换一律免收手续费！<br/>
------------<br/>
<a href="/BBS/LHC/TransferCenter.asp?kyzc=jb&amp;SessionID=<%=request("SessionID")%>">金币转换港币</a><br/>
<a href="/BBS/LHC/TransferCenter.asp?kyzc=gb&amp;SessionID=<%=request("SessionID")%>">港币转换金币</a><br/>------------<br/>
<%end if%>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=request("SessionID")%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
</p>
</card>
</wml>
<%
conn.Close
      Set conn=Nothing

myc.Close
      Set myc=Nothing
%>