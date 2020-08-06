<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="买入记录"><p>买入记录<br/>----------<br/>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
  dim page,objgbrs,stockcode
  stockcode=request("stockcode")
  page=request("page")
sql="Delete FROM gpmr WHERE CStr(jysl)='0' and DATEDIFF('s', times, now()) > 1*60"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gpmr Where CStr(gpid)='" & stockcode &"' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
   Response.write "暂时没有买入记录<br/>"
 Else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("idd") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("ltname")) & "ID:" & objgbrs("idd") & "</a>买入[<a href='guhq.asp?stockcode=" & objgbrs("gpid") & "&amp;SessionID=" & SessionID & "'>" & objgbrs("gpmz") & "</a>]" & objgbrs("jysl") & "股<br/>时间:" & objgbrs("times") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='jyjl.asp?pages=" & (pages+1) & "&amp;stockcode="&stockcode&"&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='jyjl.asp?pages=" & (pages-1) & "&amp;stockcode="&stockcode&"&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
Response.Write "<br/><a href='guhq.asp?stockcode="&stockcode&"&amp;SessionID=" & SessionID & "'>返回股票</a>"
%><!--#include file="bb.asp" -->
</p></card></wml><%
conn.close
set objgbrs=nothing
set conn=nothing
%>



