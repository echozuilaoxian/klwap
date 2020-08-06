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
<card id="card1" title="结婚登记"><p>
<% 
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
bz="t"
lasttlls="40"
lasttls
  dim page,bz,objgbrs
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jief where bz='"& bz &"' order by id desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
response.write "&#x6682;&#x65F6;&#x6CA1;&#x6709;&#x8BB0;&#x5F55;<br/>"
else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/pcblic/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a><br/>"
End if
response.write "" & "共有" & objgbrs.RecordCount & "对新人结婚"
response.write "<br/>-------------<br/>"
if objgbrs.eof then
   Response.write "&#x6682;&#x65F6;&#x7A7A;&#x7F3A;<br/>"
 Else
if pages=1 then
bihao=0
else
bihao=pages*objgbrs.PageSize-objgbrs.PageSize
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
tjhm=objgbrs("ids")
Response.write bihao+bihaocont & "." & converttowide(redtjname) & "ID:" & objgbrs("ids") & ""
tjhm=objgbrs("idss")
Response.write " [&#x548C;]"
Response.write " " & converttowide(redtjname) & "ID:" & objgbrs("idss") & ""
Response.write "<br/>[婚否]"
Response.write "&#x5DF2;&#x7ECF;&#x7ED3;&#x5A5A;!"
Response.write "<br/>&#x7231;&#x60C5;&#x8868;&#x767D;:"& converttowide(objgbrs("biao"))
Response.write "<br/>&#x7ED3;&#x5A5A;&#x65F6;&#x95F4;:" & month(objgbrs("lasttime"))&"-"&day(objgbrs("lasttime"))&"-"&hour(objgbrs("lasttime"))&":"&minute(objgbrs("lasttime"))&"<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "--------------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='jiefb.asp?pages=" & (pages+1) & "'>&#x4E0B;&#x9875;</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='jiefb.asp?pages=" & (pages-1) & "'>&#x4E0A;&#x9875;</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
end if
Response.Write "<a href='/bbs/jieh/index.asp?wap=" & wap & "'>&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a><br/><a href='/bbs/ztlb.asp?wap=" & wap & "'>返回社区论坛</a>"
response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>