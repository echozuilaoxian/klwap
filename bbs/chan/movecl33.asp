<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区桑拿"><p>
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
            if objgbrs("usejf")< sl*20 then response.redirect"signal1.asp"
                sql="update usereg set usejf=usejf-"& sl*20 &",ml=ml+"& sl*1 &",tili=tili+"& sl*1 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
	msg="哇！好舒服哦！你选择了普通洗澡，洗了"& sl &"次,体力增加了"& sl*1&",魅力增加了"& sl*1 &""          
            case "gt"
            if objgbrs("usejf")< sl*40 then response.redirect"signal1.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*40 &",ml=ml+"& sl*2 &",tili=tili+"& sl*2 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
		msg="哇！好舒服哦！你选择了普通洗澡，洗了"& sl &"次，,体力增加了"& sl*2 &",魅力增加了"& sl*2 &""
		case "xnj"
            	 if objgbrs("usejf")< sl*150 then response.redirect"signal1.asp"   
                      sql="update usereg set usejf=usejf-"& sl*150 &",ml=ml+"& sl*3 &",tili=tili+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="桑拿！是否感到热得不行了呢？撑下去！呵呵^_^。洗了"& sl &"次,,体力增加了"& sl*3 &",魅力增加了"& sl*3 &""
		case "lhr"               
               if objgbrs("usejf")< sl*170 then response.redirect"signal1.asp"
			sql="update usereg set usejf=usejf-"& sl*170 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="搓背！感到很舒服吧？洗了"& sl &"次,,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""
		case "hzj"               
                  if objgbrs("usejf")< sl*200 then response.redirect"signal1.asp"
			sql="update usereg set usejf=usejf-"& sl*200 &",ml=ml+"& sl*5 &",tili=tili+"& sl*5 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="按摩一下，浑身的疲劳都没了……洗了"& sl &"次,体力增加了"& sl*5 &",魅力增加了"& sl*5 &""		              
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>-----------
<br/><a href='ygxy.asp?SessionID=<%=SessionID%>'>返回洗浴中心</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
