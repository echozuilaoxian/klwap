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

<% 
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
  dim page,objgbrs
  page=request("page")
ForumID=request("ForumID")

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

    Response.write "<card id='card1' title='"&dlname&"-捐款记录'><p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
End if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry where CStr(about)='" & ForumID & "' order by id desc"
  objgbrs.open ssql,conn,1,1
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
if objgbrs.eof then
Response.write ""&dlname&"-捐款记录<br/>----------<br/>"
   Response.write "暂时空缺<br/>"
 Else
objgbrs.absolutepage=pages

Response.write ""&dlname&"-捐款记录<br/>----------<br/>"
%>
<%
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("useid")
Response.write bihao+bihaocont & ".<a href='/bbs/reg/useinfo.asp?ID=" & objgbrs("useid") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("useid") & "</a>给" & dlname & "捐款:" & objgbrs("reuseid") & "金币<br/>时间:" & objgbrs("times") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='1jkjl.asp?pages=" & (pages+1) & "&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='1jkjl.asp?pages=" & (pages-1) & "&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/><input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='1jkjl.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor>"
response.write ">><br/>"
End if
%>
<%

 response.write "<a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname& "</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>



