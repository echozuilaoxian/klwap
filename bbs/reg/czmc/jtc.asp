<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
dim idss,guanb
wap=request.querystring("wap")
idss=Session("useid")
cz=request("cz")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("cz")=0 then
     response.write "<card id='card1' title='汽车买卖'><p>你没有脚踏车，赶快去买吧."
     response.write "<br/><a href='/bbs/chan/cz.asp?wap=" & wap & "'>汽车公司</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
	 response.end
    End if		   
if objgbrs("usejf")<0 then response.redirect"signal.asp"
                sql="update usereg set usejf=usejf+700  where CStr(id)='" & idss & "'" 
			conn.execute sql
    sql="update usereg set cz=" & sqlstr(cz) &" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & idss & "'"
  objgbrs.open sql,conn	
conn.close
set objgbrs=nothing
set conn=nothing
Response.write "<card id='card1' title='汽车买卖' ontimer='/bbs/public/gygl.asp?wap=" & wap & "'><timer value='5'/>"
Response.write "<p>成功卖掉你的脚踏车!系统已经返还你700钻币了,正在返回..."
Response.write "<br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



