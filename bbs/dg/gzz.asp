<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card" title="打工挣币">
<p align="center">
<%
SessionID=request.querystring("SessionID")
dim lx,sl
	Response.Buffer=True 
iduse=Session("useid")
lx=request.form("lx")
sl=request.form("sl")
if sl=0 or sl<0 then
	mess="您不工作到这里来干什么？"
else
	usejf=usejf
	sql="select * from usereg where Cstr(id)='" & iduse & "'"
		mess=usejf & ",您没钱了……"
		end if
	
		select case lx
		case "1"
            sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*2 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
	mess="您经过了一天的工作,您的体力减少了"& sl*2 &"点,收入增加了30&#x91D1;&#x5E01;!"
		case "2"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "3"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "4"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "5"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "6"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "7"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "8"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "9"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			case "10"
			sql="update [usereg] set usejf=usejf+30,tili=tili-"& sl*1 &"  where CStr(id)='" & iduse & "'"
			conn.execute sql
			mess="您经过了一天的工作.您的体力减少了"& sl*1 &"点收入增加了30&#x91D1;&#x5E01;!"
			end select
%>
<%=mess%>          
<%    
response.write "<br/><a href='/bbs/dg/gz.asp?SessionID=" & SessionID & "'>返回工作</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"  
%> 