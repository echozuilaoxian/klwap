<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='&#25805;&#20316;&#25552;&#31034;' >
<p>
<%
SessionID=request.querystring("SessionID")
dim idss
word2=request("word2")
id=request("id")
idss=Session("useid")
        set rs=server.createobject("adodb.recordset")
	sqld="select * from dj where id="&request("id")
	rs.open sqld,conn,1,3
        set rs1=server.createobject("adodb.recordset")
	sql1="select * from usereg where CStr(id)='" & Session("useid") & "'"
	rs1.open sql1,conn,1,3
if request("word2")>10 or request("word2")<0 then 
  response.write "对不起,一次最多只能购买10件"
   else
if rs("sun")=<0 then 
  response.write "对不起,道具库存数量不够!"
   else
if rs1("usejf")<request("word2")*rs("jg") then 
  response.write "对不起你金币不够"
   else
     sql="update usereg set usejf=usejf-" & rs("jg") & "*" & word2 & "  where CStr(id)='" & idss & "'" 
	conn.execute sql
if request("id")=1 then 
    sql="update usereg set yyq=yyq+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
if request("id")=2 then 
    sql="update usereg set jls=jls+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
if request("id")=3 then 
    sql="update usereg set jsy=jsy+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
if request("id")=4 then 
    sql="update usereg set zyj=zyj+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
if request("id")=5 then 
    sql="update usereg set tkj=tkj+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
if request("id")=6 then 
    sql="update usereg set qbj=qbj+"&word2&" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  End if        
    sql="update dj set sun=sun-"&word2&" where CStr(id)='" & id & "'"
    conn.execute(sql)
     rs.close
	set rs=nothing
     rs1.close
	set rs1=nothing
	conn.close
	set conn=nothing
response.write "购买成功!"
  End if        
  End if        
  End if        
  response.write "<br/><a href='index1.asp?SessionID=" & SessionID & "'>我要继续购买</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回我的道具</a><br/>"
  response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>