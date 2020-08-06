<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%id=request("id")
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
page=request("page")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche where AfficheId="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("ID错误!")
else
  sql="update affiche set AfficheHots=AfficheHots+1 Where CStr(AfficheId)='" & id & "'"
  conn.Execute(sql)
%>
<card id="main" title="公告-<%=converttowidebaiti(rs("AfficheName"))%>" >
<p>
<b>标题:</b><%=converttowidebaiti(rs("AfficheName"))%><br/><br/>
<%=converttowide(UBBCodes(rs("AfficheContent")))%><br/>
----------<br/>
查看次数:<%=rs("AfficheHots")%><br/>
添加时间:<%=rs("AfficheTime")%><br/>
<%end if
	rs.close
	set rs=nothing
%>
----------<br/>
<a href="bbs_affiche.asp?SessionID=<%=SessionID%>">返回公告列表</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p>
</card>
</wml>