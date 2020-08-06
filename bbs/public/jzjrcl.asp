<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
	dim id,setbzczz,objgbrs
	id=request("id")
	setbzczz=CStr(request("setbzczz"))

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;setbzczz="&setbzczz&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
	f="f"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&setbzczz
rse.open rspple,conn,1,2
if rse.eof then
Response.write "<card id='card1' title='无此帮派' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "出错了,无此帮派<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
elseif rse("a")<>f then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "出错了,该帮派拒绝收人.找其它帮派吧！<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
      else
bkmc=rse("biaoti")
end if
rse.close
Set rse= Nothing

set rsse=Server.CreateObject("ADODB.Recordset")
rsppl="select * from usereg where id="&id
rsse.open rsppl,conn,1,2
if rsse.eof then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "系统无法识别你的身份.....<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
elseif rsse("bzbzz")<>0 then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "你已经加入其他门派了,请先<a href='bptc.asp?SessionID=" & SessionID & "'>退出</a>再来吧.....<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
else
    sql="update usereg set bzbzz=" & setbzczz & " where CStr(id)='" & id & "'"
    conn.execute(sql)
    sql="update jzbl set rcx=rcx+1 where CStr(id)='" & setbzczz & "'"
    conn.execute(sql)
 sql="update usereg set usejf=usejf-200 where CStr(id)='" & id & "'"
  conn.execute sql
Response.write "<card id='card1' title='加入-"&converttowidebaiti(bkmc)&"帮派' ontimer='/bbs/djcs.asp?id=" & setbzczz & "&amp;SessionID=" & SessionID & "'>"
Response.write "<timer value='50'/><p>成功加入"&converttowidebaiti(bkmc)&"帮派,好好为你的家争光吧。正在返回..."

Response.write "<br/><a href='/bbs/djcs.asp?id=" & setbzczz & "&amp;SessionID=" & SessionID & "'>返回我的帮派</a>"
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;wap=" & wap & "'>返回我的资料</a></p></card></wml>"
end if
rsse.close
Set rsse= Nothing
conn.close
set conn=nothing
%>