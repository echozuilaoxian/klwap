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
lasttlls="200"
lasttls
  dim page,bz,objgbrs,id
  page=request("page")
  bz=request("bz")

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&bz
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=converttowidebaiti(rse("biaoti"))
yxxes=rse("tjhm")
end if
rse.close
Set rse= Nothing
 %>
<card id="card1" title="<%=bkmc%>-成员列表"><p>
<% 
  id=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(bzbzz)=" & bz & " order by id"
  objgbrs.open ssql,conn,1,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bz=" & bz & ""
End if
Response.write "" & bkmc & "-成员列表(排名不分先后)"
Response.write "<br/>共有" & objgbrs.RecordCount & "个成员"
Response.write "<br/>--------<br/>"
if objgbrs.eof then
   Response.write "尚无成员加入...<br/>"
 Else
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
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename"))  & "(" & frionline(objgbrs("id")) & ")</a><br/>"
if Session("useid")=yxxes then
Response.write "|<a href='/bbs/public/zccy.asp?itid=" & bz & "&amp;id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>逐出</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
If pages<objgbrs.PageCount then
Response.Write "<a href='/bbs/public/cylb.asp?bz=" & bz & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='/bbs/public/cylb.asp?bz=" & bz & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if

Response.write "--------<br/><a href='/bbs/djcs.asp?id=" & bz & "&amp;SessionID=" & SessionID & "'>返回"&bkmc&"</a>"
response.write "<br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
conn.close

set objgbrs=nothing
set conn=nothing

Function frionline(fid)
   page=request("page")
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select * from SoftDown_online where Cstr(ids)='" & fid & "'"
   objgbrr.open ssql,conn
   if not objgbrr.eof then
      frionline="在线"
   Else
      frionline="离线"
   End if
   set objgbrr=nothing
End function
%>





