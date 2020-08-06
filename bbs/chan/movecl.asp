<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区餐厅"><p>
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
                sql="update usereg set usejf=usejf-"& sl*100 &",ml=ml+"& sl*1 &",tili=tili+"& sl*1 &"  where CStr(id)='" & Jname & "'" 
			conn.execute sql
			msg="您吃了"& sl &"个鸡蛋,体力增加了"& sl*1 &",魅力增加了"& sl*1 &""          
            case "gt"
            if objgbrs("usejf")< sl*30 then response.redirect"signal.asp"  
           	      sql="update usereg set usejf=usejf-"& sl*150 &",ml=ml+"& sl*2 &",tili=tili+"& sl*2 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"根排骨,体力增加了"& sl*2 &",魅力增加了"& sl*2 &""
		case "xnj"
            	 if objgbrs("usejf")< sl*35 then response.redirect"signal.asp"   
                      sql="update usereg set usejf=usejf-"& sl*175 &",ml=ml+"& sl*3 &",tili=tili+"& sl*3 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"条鱼,体力增加了"& sl*3 &",魅力增加了"& sl*3 &""
		case "xz"               
               if objgbrs("usejf")< sl*15 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*300 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"个汉堡,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""
		case "lhr"               
                  if objgbrs("usejf")< sl*20 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*100 &",ml=ml+"& sl*1 &",tili=tili+"& sl*1 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"碗粥,体力增加了"& sl*1 &",魅力增加了"& sl*1 &""
		case "hzj"
                 if objgbrs("usejf")< sl*50 then response.redirect"signal.asp"
               		sql="update usereg set usejf=usejf-"& sl*250 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"斤牛肉,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""
		case "bhp"                
                if objgbrs("usejf")< sl*50 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*250 &",ml=ml+"& sl*4 &",tili=tili+"& sl*4 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"斤羊肉,体力增加了"& sl*4 &",魅力增加了"& sl*4 &""
		case "hss"              
                if objgbrs("usejf")< sl*100 then response.redirect"signal.asp"
			sql="update usereg set usejf=usejf-"& sl*500 &",ml=ml+"& sl*6 &",tili=tili+"& sl*6 &"  where CStr(id)='" & Jname & "'"
			conn.execute sql
			msg="您吃了"& sl &"条龙虾,体力增加了"& sl*6 &",魅力增加了"& sl*6 &""                
		end select
response.write msg
	conn.close
	set rs=nothing
	set conn=nothing
%>
<br/>------------
<br/><a href='index.asp?SessionID=<%=SessionID%>'>返回社区餐厅</a><br/>
<a href='/BBS/chan/xiaof.asp?SessionID=<%=SessionID%>'>返回消费中心</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>