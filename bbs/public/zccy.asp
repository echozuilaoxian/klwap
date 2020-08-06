<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<%
	dim id,itid
id=request("id")
itid=request("itid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;itid="&itid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&itid
rse.open rspple,conn,1,2
if rse.eof then
Response.write "<card id='card1' title='系统提示'><p>ID错误...</p></card></wml>"
else
bkmc=rse("TJHM")
end if
rse.close
Set rse= Nothing
if Session("useid")=bkmc Then

    sql="update usereg set bzbzz='0' where CStr(id)='" & id & "' and CStr(bzbzz)='" & itid & "'"
    conn.execute(sql)

    sql="update jzbl set rcx=rcx-1 where CStr(id)='" & itid & "'"
    conn.execute(sql)

Response.write "<card id='card1' title='掌门人操作' ontimer='/bbs/public/cylb.asp?bz=" & itid & "&amp;SessionID=" & SessionID & "'>"
Response.write "<timer value='5'/><p>成功逐出该成员,正在返回..."
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>用户资料</a></p></card></wml>"
End if
conn.close
set conn=nothing
%>







