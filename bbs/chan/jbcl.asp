<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区酒吧"><p>
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
            if objgbrs("usejf")< sl*20 then response.redirect"signal.asp"
                sql="update usereg set usejf=usejf-"& sl*20 &",ml=ml+"& sl*2 &",tili=tili+"& sl*2 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*2 &",魅力增加了"& sl*2 &""          
            case "gt"
            if objgbrs("usejf")< sl*30 then response.redirect"signal.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*30 &",ml=ml+"& sl*3 &",tili=tili+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*3 &",魅力增加了"& sl*3 &""
		case "xnj"
            	 if objgbrs("usejf")< sl*35 then response.redirect"signal.asp"   
                      sql="update usereg set usejf=usejf-"& sl*40 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""
		case "xz"               
               if objgbrs("usejf")< sl*15 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*15 &",ml=ml+"& sl*1 &",tili=tili+"& sl*1 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*1 &",魅力增加了"& sl*1 &""
		case "lhr"               
                  if objgbrs("usejf")< sl*20 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*20 &",ml=ml+"& sl*2 &",tili=tili+"& sl*2 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*2 &",魅力增加了"& sl*2 &""
		case "hzj"
                 if objgbrs("usejf")< sl*50 then response.redirect"signal.asp"
               		sql="update usereg set usejf=usejf-"& sl*50 &",ml=ml+"& sl*5 &",tili=tili+"& sl*5 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*5 &",魅力增加了"& sl*5 &""
		case "bhp"                
                if objgbrs("usejf")< sl*50 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*60 &",ml=ml+"& sl*6 &",tili=tili+"& sl*6 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*6 &",魅力增加了"& sl*6 &""
		case "hss"              
                if objgbrs("usejf")< sl*100 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*100 &",ml=ml+"& sl*8 &",tili=tili+"& sl*8 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您消费"& sl &"份,体力增加了"& sl*8 &",魅力增加了"& sl*8 &""                
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>-----------
<br/><a href='jb.asp?SessionID=<%=SessionID%>'>返回社区酒吧</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>