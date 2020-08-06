<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区美容"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
dim lx,sl,msg
lx=request.form("lx")
sl=request.form("sl")
bb=request.form("usejf")
Jname=Session("useid")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
	select case lx
	     case "rou"	                        
            if objgbrs("usejf")< sl*200 then response.redirect"signal.asp"
                sql="update usereg set usejf=usejf-"& sl*1000 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
			msg="您选择了"& sl &"次面膜,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""          
            case "gt"
            if objgbrs("usejf")< sl*500 then response.redirect"signal.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*2500 &",ml=ml+"& sl*10 &",tili=tili+"& sl*10 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您选择了"& sl &"次嫩肤,体力增加了"& sl*10 &",魅力增加了"& sl*10 &""            
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>-----------
<br/>
<a href='/BBS/chan/mr.asp?SessionID=<%=SessionID%>'>返回美容院</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>