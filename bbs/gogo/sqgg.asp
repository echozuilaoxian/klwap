<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then
response.redirect "/bbs/index.asp?SessionID=" & SessionID & ""
response.end
end if 
%>
<card id="card1" title="点击赚币"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("bbslybz")=""
    End if
 set zmyars=Server.CreateObject("ADODB.Recordset")
  zmyasql="select * from ltsy"
zmyars.open zmyasql,conn
ggzb=zmyars("ggzb")

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
gfdsa=Session("ltname")
iduse=Session("useid")
lasttlss="7"
lasttlls="7"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
usejf=objgbrs("usejf")
%>
您好<%=gfdsa%>!欢迎您来点击赚币!<br/>
你现在有<%=usejf%>金币<br/>
〓精彩推荐〓<br/>

<%
set rs=server.createobject("adodb.recordset")
sql = "select * from gogo where id"
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "暂时还没有推荐!"

else
Page=Int(Abs(Request("page")))
IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then page=1
rs.pagesize = 10 '每页显示记录数
total = rs.RecordCount
mp = rs.pagesize
rs.absolutepage = page
i=0:k=0

do while not rs.eof and mp>0:k=k+1
%>
<%
if Request("page")="" then %>
<%=i+1%>.<a href='sqggcl.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>'><%=rs("name")%></a><br/>
<% else %>
<%=i+1+10*(Request("page")-1)%>.<a href='sqggcl.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>'><%=rs("name")%></a><br/>

<%
end if
i=i+1
mp=mp-1
rs.movenext
loop

if page>rs.pagecount then Response.redirect("sqgg.asp?page=&rs.pagecount&amp;SessionID=" & SessionID & "")
if page>1 then
response.Write(" <a href='sqgg.asp?page="&page-1&"&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x4E00;&#x9875;</a> ")
end if


if page<rs.pagecount then
response.Write("<a href='sqgg.asp?page="&page+1&"&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x4E00;&#x9875;</a><br/>")
end if
end if
response.Write(" &#x5171;"&total&"条")
response.write "&#40;" & page & "&#47;" & rs.PageCount & "&#41;<br/>"
if rs.PageCount>1 then
response.write "到<input  name='page' value='4' size='5' format='*N'/>页<anchor>确定<go method='post' href='sqgg.asp?SessionID=" & SessionID & "'><postfield name='page' value='$(page)'/></go></anchor>>><br/>"
End if
rs.close
set rs=nothing

%>
说明:推荐均为免费内容,每天每条【24小时】只能点击一次,每点击一次赠送<%=ggzb%>金币的奖励!<br/>---------<br/>
 <a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/><%=now%>
</p>
</card>
</wml>
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>