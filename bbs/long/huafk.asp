<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card id="hotpk" title="果园最近访客"><p>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
hoid=request("hoid")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hoid=" &hoid & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=525
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &hoid & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hoid=" &hoid & "&amp;"
End if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>我的果园</a>〓<a href='index1.Asp?hoid=" &hoid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"果园</a><br/><img src='img/logo.gif' alt=''/><br/>"


Response.write ""&converttowidebaiti(objgbrs("usename"))&"的果园最近访客<br/>"
dim hd,objgbrsd
hd="t"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select * from huaf where topao=" &hoid& "  and fname='k'   order by times desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有访客......."
Else
   objgbrsd.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrc.PageCount then pages=objgbrc.PageCount
objgbrsd.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrsd.PageSize 
 bihaocont=bihaocont+1
Response.write ""&bihao+bihaocont&":<a href='index1.Asp?hoid=" & objgbrsd("useid") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti (objgbrsd("fname"))&"</a>."&converttowidebaiti("访问日期:")&"" & objgbrsd("times") & "<br/>"
objgbrsd.Movenext
if objgbrsd.EOF then Exit for
 Next
End if
If pages<objgbrsd.PageCount then
Response.Write "<a href='huafk.asp?hoid=" &hoid & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='huafk.asp?hoid=" &hoid & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrsd.PageCount>1 then
response.write "(" & pages & "/" & objgbrsd.PageCount & ")<br/>"
End if

	objgbrsd.close
	set objgbrsd=nothing
end if

Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


