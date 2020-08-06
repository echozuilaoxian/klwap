<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="在线对对碰"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="174"
lasttls
  dim namid,namorid,pages,objgbrs
  namorid=Cstr(request("namorid"))
  namid=Cstr(request("namid"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
if namorid="1" then
   ssql="select top 20 * from SoftDown_online where name<>'&#x6E38;&#x5BA2;' and Cstr(id)=" & namid & "order by id desc"
 else
   namids="%" & namid & "%"
   ssql="select top 20 * from SoftDown_online where  name<>'&#x6E38;&#x5BA2;' and lasttl like '" & namids & "' order by id desc"
end if
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
   Response.write "对不起，没有搜索到您要找的会员，可能该会员尚未注册.......<br/>"
Else
objgbrs.PageSize=20
pages =CLng(Request("pages"))
if pages<1 or pages="" then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
Response.write "对碰出" & objgbrs.RecordCount & "位<br/>------------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*20-20
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("name")) & "ID:" & objgbrs("id") & "</a>(在线)<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.write "-------------<br/>"
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='findcl2.asp?pages=" & (pages+1) & "&amp;namid=" & namid & "&amp;namorid=" & namorid & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='findcl2.asp?pages=" & (pages-1) & "&amp;namid=" & namid & "&amp;namorid=" & namorid & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
End if
conn.close
set objgbrs=nothing
set conn=nothing
Response.write "-------------<br/>"
Response.Write "<a href='/bbs/public/find.asp?SessionID=" & SessionID & "'>返回有缘交友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>



