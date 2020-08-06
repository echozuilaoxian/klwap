<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
dim idss,guanb
wap=request.querystring("wap")
idss=Session("useid")
cw=request("cw")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn		   
if objgbrs("usejf")<500000 then response.redirect"signal.asp"
                sql="update usereg set usejf=usejf-500000  where CStr(id)='" & idss & "'" 
			conn.execute sql
    sql="update usereg set cw=" & sqlstr(cw) &" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & idss & "'"
  objgbrs.open sql,conn	
conn.close
set objgbrs=nothing
set conn=nothing
Response.write "<card id='card1' title='购买宠物成功' ontimer='/bbs/public/gygl.asp?wap=" & wap & "'><timer value='10'/>"
Response.write "<p>购买宠物成功!正在返回..."
Response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



