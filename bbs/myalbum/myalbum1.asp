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
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<card id="card1" title="查看相册"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  dim page,objgbrs,id
useid=request("id")
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & useid & " and bz='1' order by times desc"
  objgbrs.open ssql,conn,3,3
if objgbrs.eof then

if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("ids") & ""
End if
    response.write "<img src='/bbs/logo/xxlogo.gif' alt='相册'/><br/>----------<br/>抱歉,该居民还没有上传相片<br/>"
  else
objgbrs.PageSize=2
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
tjhm=objgbrs("ids")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" &SessionID& "'>" & converttowidebaiti(redtjname) & "</a>有" & objgbrs.RecordCount & "张相片<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*4-4
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='myalbum.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowide(objgbrs("niayo")) & "</a><br/><a href='myalbum3.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'><img src='" & objgbrs("xclink") & "' width='80' height='80' alt='相片'/></a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='myalbum1.asp?id=" & objgbrs("ids") & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "<a href='myalbum1.asp?id=" &useid&"&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
response.write "<a href='/bbs/myalbum/index.asp?SessionID=" & SessionID & "'>网友相册</a><br/><a href='/bbs/wapcs/wap2.asp?SessionID=" &SessionID & "'>wap2.0上传</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



