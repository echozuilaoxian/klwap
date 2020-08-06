<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="<%=converttowidebaiti(SystemSiteName)%>银行转帐记录"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="330"
lasttls
  dim page,bz,objgbrs
  page=request("page")
  sql="Delete FROM jfpost1 WHERE DATEDIFF('s', times, now()) > 430000*60"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jfpost1 order by id desc"
  objgbrs.open ssql,conn,1,1
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=6"
End if
if objgbrs.eof then

Response.write "一个月删除一次<br/>销魂人民银行转帐记录<br/>----------<br/>暂时空缺<br/>"
Else
Response.write ""&converttowidebaiti(SystemSiteName)&"银行转帐记录<br/>一个月删除一次<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("ids")
Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("ids") & "</a>&#21521;:"
tjhm=objgbrs("reids")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("reids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("reids") & "</a><br/>转帐:<b>" & objgbrs("naiyo") & "</b>元]<br/>时间:" & objgbrs("times") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.write "-------------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='zzjl.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='zzjl.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
Response.write "-------------<br/>"
Response.Write "<a href='/bbs/reg/bank.asp?SessionID=" & SessionID & "'>返回人民银行</a>"
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"
%>
<% 
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
