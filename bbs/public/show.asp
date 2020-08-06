<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
	dim idss,guanb
	idss=Session("useid")
	guanb=request("guanb")
    sql="update usereg set guanb=" & sqlstr(guanb) &" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & idss & "'"
  objgbrs.open sql,conn	
conn.close
set objgbrs=nothing
set conn=nothing
Response.write "<card id='card1' title='管理资料' ontimer='/bbs/public/guanb.asp?id=" & idss & "&amp;SessionID=" & SessionID & "'><timer value='3'/>"
Response.write "<p>操作成功,正在返回"
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>