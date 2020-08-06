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
<card id="card1" title="删帖记录"><p>版主本月删贴<br/>----------------<br/>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="41"
lasttls
  dim page,bz,objgbrs
  page=request("page")
  id=request("id")
  sql="Delete FROM delzl WHERE DATEDIFF('s', times, now()) > 43200*60"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from delzl Where CStr(reids)='" & id &"' order by id desc"
  objgbrs.open ssql,conn,1,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息！</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
End if
if objgbrs.eof then
   Response.write "暂时空缺<br/>"
 Else
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("idss")
Response.write bihao+bihaocont & "." & converttowidebaiti(objgbrs("baoti")) & "<br/>作者:" & converttowidebaiti(redtjname) & "ID:" & objgbrs("idss")
tjhm=objgbrs("reids")
Response.write "<br/>操作:" & converttowidebaiti(redtjname) & "ID:" & objgbrs("reids") & "<br/>时间:" & objgbrs("times") & "<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.Write "----------------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='delzlbz.asp?id=" & id & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='delzlbz.asp?id=" & id & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
conn.close
set objgbrs=nothing
set conn=nothing
Response.Write "----------------<br/>"
Response.Write "<a href='/bbs/reg/bzcj.asp?id="&id&"&amp;SessionID=" & SessionID & "'>返回斑竹资料</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>



