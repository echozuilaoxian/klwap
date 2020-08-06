<%
response.ContentType="text/vnd.wap.wml;charset=utf-8"
Response.Expires = -1
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "Cache-Control", "no-cache, must-revalidate"
%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id='main' title='闯关升级'>  
<p align='left'>
	<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Session("ok")="false"
if session("useid")<>"" then	
n=0
if(request("n")<>"") then
n=Cint(request("n"))
end if
n=n+1
%>
第<%=n%>关<br/>
<%	
'id = 20896
Randomize
 id = Int((20896) * Rnd + 1) 
 sql = "select top 1 * from title where tmxh="&id
        set rs = server.createobject("adodb.recordset")	
	rs.open sql,conn,1,1
        if not rs.eof and not rs.bof then
 response.write "问题："&converttowidebaiti(rs("tmnr"))&"<br/>"
 response.write "---------<br/>"
  response.write "1."&converttowidebaiti(rs("tmda1"))&"<br/>"
if(rs("tmda2")<>"") then
 response.write "2."&converttowidebaiti(rs("tmda2"))&"<br/>"
end if
if(rs("tmda3")<>"") then
 response.write "3."&converttowidebaiti(rs("tmda3"))&"<br/>"
end if
if(rs("tmda4")<>"") then
 response.write "4."&converttowidebaiti(rs("tmda4"))&"<br/>"
end if
if(rs("tmda5")<>"") then
 response.write "5."&converttowidebaiti(rs("tmda5"))&"<br/>"
end if
if(rs("tmda6")<>"") then
 response.write "6."&converttowidebaiti(rs("tmda6"))&"<br/>"
end if
 response.write "<select name='answer'>"
 response.write "<option value='0'>1</option>"
if(rs("tmda2")<>"") then
 response.write "<option value='1'>2</option>"
end if
if(rs("tmda3")<>"") then
 response.write "<option value='2'>3</option>"
end if
if(rs("tmda4")<>"") then
 response.write "<option value='3'>4</option>"
end if
if(rs("tmda5")<>"") then
 response.write "<option value='4'>5</option>"
end if
if(rs("tmda6")<>"") then
 response.write "<option value='5'>6</option>"
end if
 response.write "</select>"
  end if   
response.write "<br/><a href='/BBS/txjl/temp.asp?n="&n&"&amp;mykey=$(answer)&amp;id="&rs("tmzqda")&"&amp;idd="&rs("tmxh")&"&amp;SessionID=" & SessionID & "'>确 定</a><br/>---------<br/>"
        end if      
%> 
说明:如果不显示，请刷新<br/>
<a href='/bbs/school/school.asp?SessionID=<%=SessionID%>'>[社区学校]</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>[我的地盘]</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[社区首页]</a>
<br/>报时:<%=time%>

</p>
</card>
</wml>
<%      set rs=nothing   
	conn.close
	set conn=nothing
%>                      