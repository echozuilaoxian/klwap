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
<card id="card1" title="江湖在线玩家">
<p align="left">
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="190"
lasttls
  dim lasttlss,page,objgbrs
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
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?7=8"
End if
Response.write "共有" & objgbrs.RecordCount & "位玩家在线"
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
Response.write bihao+bihaocont & "." & "<a href='/bbs/yxxe/dfzl.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowide(objgbrs("name")) & "(ID:" & objgbrs("ids") & ")</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
if objgbrs.PageCount>1 then
Response.write "-------------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='ckzxhyany6.asp?pages=" & (pages+1) & "&amp;lasttlss=" & lasttlss & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>[下页]</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='ckzxhyany6.asp?pages=" & (pages-1) & "&amp;lasttlss=" & lasttlss & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>[上页]</a>"
End if
if objgbrs.PageCount>1 then
response.write "[" & pages & "/" & objgbrs.PageCount & "]<br/>"
response.write "转至<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='ckzxhyany6.asp?SessionID=" & SessionID & "'><postfield name='itid' value='" & itid & "'/><postfield name='pages' value='$(pages)'/></go></anchor><br/>"
End if
Response.Write "-------------<br/><a href='" & page & "?SessionID=" & SessionID & "'>返回热血江湖</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>