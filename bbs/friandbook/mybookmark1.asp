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
<card id="card1" title="私人日记"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="43"
lasttls
  dim page,objgbrs,ids
  ids=Session("useid")
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from my_mark_book where Cstr(ids)=" & ids & " order by id desc"
  objgbrs.open ssql,conn,3,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?88=88"
End if
if objgbrs.eof then
    response.write "你没有日记<br/>"
  else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
Response.write "共有" & objgbrs.RecordCount & "条私人日记<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='viewmark1.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & converttowide(objgbrs("baoti")) & "</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.write "----------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='mybookmark1.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='mybookmark1.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
response.write "----------<br/><a href='addmark1.asp?SessionID=" & SessionID & "'>书写日记</a>-<a href='submarkall1.asp?SessionID=" & SessionID & "'>全部删除</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
response.write "-<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"

	conn.close
	set objgbrs=nothing
	Set conn = Nothing

%>


