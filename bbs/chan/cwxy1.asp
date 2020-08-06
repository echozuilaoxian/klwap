<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="宠物浴室"><p>
<% 
dim lx,sl,msg
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
lx=request.form("lx")
sl=request.form("sl")
bb=request.form("usejf")
Jname=Session("useid")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
	select case lx
	     case "rou"	                        
            if objgbrs("usejf")< sl*20 then response.redirect"signal1.asp"
                sql="update usereg set usejf=usejf-"& sl*20 &",cwsm=cwsm+"& sl*1 &" where CStr(id)='" & Jname & "'" 
			conn.execute sql
	msg="您的宠物选择了普通洗澡，洗了"& sl &"次,生命增加了"& sl*1&""          
            case "gt"
            if objgbrs("usejf")< sl*40 then response.redirect"signal1.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*40 &",cwsm=cwsm+"& sl*2 &",cwrq=cwrq+"& sl*1 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
		msg="您的宠物选择了游泳，洗了"& sl &"次，,生命增加了"& sl*2 &",热情增加了"& sl*1 &""
		case "xnj"
            	 if objgbrs("usejf")< sl*150 then response.redirect"signal1.asp"   
                      sql="update usereg set usejf=usejf-"& sl*150 &",cwsm=cwsm+"& sl*7 &",cwrq=cwrq+"& sl*6 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物选择了桑拿服务洗了"& sl &"次,,生命增加了"& sl*7 &",热情增加了"& sl*6 &""
		case "lhr"               
               if objgbrs("usejf")< sl*170 then response.redirect"signal1.asp"
			sql="update usereg set usejf=usejf-"& sl*170 &",cwsm=cwsm+"& sl*7 &",cwrq=cwrq+"& sl*8 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物选择了刷毛服务,洗了"& sl &"次,,生命增加了"& sl*7 &",热情增加了"& sl*8 &""
		case "hzj"               
                  if objgbrs("usejf")< sl*200 then response.redirect"signal1.asp"
			sql="update usereg set usejf=usejf-"& sl*200 &",cwsm=cwsm+"& sl*8 &",cwrq=cwrq+"& sl*9 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您的宠物选择了按摩服务,洗了"& sl &"次,生命增加了"& sl*8 &",热情增加了"& sl*9 &""		              
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>------------
<br/><a href='cwxy.asp?SessionID=<%=SessionID%>'>返回宠物浴室</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
