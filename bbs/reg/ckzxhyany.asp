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
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="158"
lasttls
  dim lasttlss,page,objgbrs,ForumID
ForumID=request("itid")

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname=""
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<card id="card1" title="<%=dlname%>在线用户">
<p align="left">
<% 
  lasttlss=Cstr(request("lasttlss"))
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where CStr(lasttl)='" & lasttlss & "' order by startime"
  objgbrs.open ssql,conn,1,3
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
Response.write ""&dlname&"共有" & objgbrs.RecordCount & "位在线"
Response.write "<br/>-------------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
ids=objgbrs("ids")
if objgbrs("name")="&#x6E38;&#x5BA2;" then
Response.write bihao+bihaocont & "."&objgbrs("name") & "ID:" & objgbrs("ids") &"<br/>"
else
Response.write bihao+bihaocont & "." & "<a href='/bbs/chatroom/talk1.asp?itid=1&amp;show=1&amp;ids=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("name")) & "(ID:" & objgbrs("ids") & ")</a>|<a href='useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>资料</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
Response.write "-------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='ckzxhyany.asp?ForumID=" & ForumID & "&amp;pages=" & (pages+1) & "&amp;lasttlss=" & lasttlss & "&amp;page=" & page & "&amp;SessionID=" &SessionID & "'>[下页]</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='ckzxhyany.asp?ForumID=" & ForumID & "&amp;pages=" & (pages-1) & "&amp;lasttlss=" & lasttlss & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>[上页]</a>"
End if
if objgbrs.PageCount>1 then
response.write "[" & pages & "/" & objgbrs.PageCount & "]<br/>"
response.write "转至<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='ckzxhyany.asp?ForumID=" & ForumID & "&amp;lasttlss=" & lasttlss & "&amp;SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor><br/>"
End if
Response.Write "<anchor>&#x8FD4;&#x56DE;&#x4E0A;&#x4E00;&#x9875;<prev/></anchor>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



