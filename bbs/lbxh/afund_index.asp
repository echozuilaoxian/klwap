<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="我的龙宝"><p><br/>
序号/龙宝/数量/价格<br/>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

Server.ScriptTimeout=999
iduse=Session("useid")
page=Request("page")
 dim page,objgbrs
  page=request("page")
 sql="Delete FROM jj_hk_my WHERE CStr(jjsl)<=0"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
 ssql="select myjjnames,myjjid,mytime,myjjjg,jjsl from jj_hk_my where CStr(ids)='" & iduse &"' order by mytime desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "你没有购买龙宝<br/>"
else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
dim pages,srs
  set srs=Server.CreateObject("ADODB.Recordset")
  sql="select jj_id from jj_hk WHERE cstr(jj_id)='" & objgbrs("myjjid") & "'"
  srs.open sql,conn,1,1
if srs.eof then
 sql="update usereg set jjsl=jjsl-"&objgbrs("jjsl")&" where cstr(id)='" & iduse & "'"
	conn.execute sql
sql="Delete FROM jj_hk_my WHERE myjjid="& objgbrs("myjjid") & " and ids="&iduse
  conn.Execute sql
srs.close
	set srs=nothing
end if

Response.write bihao+bihaocont & ".<a href='Afund_buys.asp?jjid=" & objgbrs("myjjid") & "&amp;SessionID=" & SessionID & "'>" & objgbrs("myjjnames") & "</a>/" & objgbrs("jjsl") & "份/" & objgbrs("myjjjg")&"<br/>(" & objgbrs("mytime") & ")<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
Response.write "-------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='Afund_index.asp?pages=" & (pages+1) & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='Afund_index.asp?pages=" & (pages-1) & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
objgbrs.close
set objgbrs=nothing
Response.Write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
<%
conn.close
set conn=nothing%>
</p></card></wml>



