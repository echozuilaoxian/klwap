<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
	dim id,bzbzz
id=Session("useid")
	bzbzz=request("bzbzz")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bzbzz="&bzbzz&"&amp;id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
set rsse=Server.CreateObject("ADODB.Recordset")
rsppl="select * from usereg where id="&id
rsse.open rsppl,conn,1,2
if rsse.eof then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "系统无法识别你的身份.....<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
elseif rsse("bzbzz")=0 then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "你还没加入门派呢,在这瞎退什么啊.....？<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end
elseif rsse("bzbzz")<>bzbzz then
Response.write "<card id='card1' title='系统提示' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><p>"
Response.write "ID错误,在这瞎退什么啊.....？<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a></p></card></wml>"
     response.end

else
    sql="update usereg set bzbzz='0' where CStr(id)='" & id & "'"
    conn.execute(sql)
    sql="update jzbl set rcx=rcx-1 where CStr(id)='" & bzbzz & "'"
    conn.execute(sql)

Response.write "<card id='card1' title='退出团体' ontimer='/BBS/area.asp?SessionID=" & SessionID & "'><timer value='20'/>"
Response.write "<p>成功退出,你可以再选择自己喜欢的帮派加入。正在返回..."
Response.write "<br/><a href='/BBS/area.asp?SessionID=" & SessionID & "'>返回社区帮派</a>"
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>返回我的资料</a></p></card></wml>"
rsse.close
set rsse=nothing
end if
conn.close
set conn=nothing
%>