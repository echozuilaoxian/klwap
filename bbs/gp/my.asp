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
<card id="card1" title="我的股票"><p>我的股票<br/>----------<br/>
序号/股票/数量/价格<br/>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
 dim page,objgbrs
  page=request("page")
 sql="Delete FROM gpmr WHERE CStr(jysl)='0' and DATEDIFF('s', times, now()) > 1*60"
  conn.Execute sql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
 ssql="select gpmz,gpid,gpjg,times,jysl from gpmr where CStr(idd)='" & iduse &"' order by id desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
Response.write "你没有购买股票<br/>"
else
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
Response.write bihao+bihaocont & ".<a href='mygp.asp?stockcode=" & objgbrs("gpid") & "&amp;SessionID=" & SessionID & "'>" & objgbrs("gpmz") & "</a>/" & objgbrs("jysl") & "股/" & objgbrs("gpjg") & "元<br/>(" & objgbrs("times") & ")<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
Response.write "----------<br/>注:价格以4舍5入取价,交易以实际价格为准<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='my.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='my.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
%>
<!--#include file="bb.asp" -->
</p></card></wml><%
conn.close
set objgbrs=nothing
set conn=nothing
%>



