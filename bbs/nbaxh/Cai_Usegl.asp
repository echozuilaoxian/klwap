<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%

if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then
Action=request("Action")

if Action="" or Action="main" then Action="main"

if Action="main" then 
%>
	



<%
elseif Action="delky" then 
%>
	<card id="delsj" title="请选择要删除的数据">
		<p>

<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsj&amp;page=<%=page%>">清空所有开奖记录</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delcmsj&amp;page=<%=page%>">清空所有投注记录</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsysj&amp;page=<%=page%>">清空所有记录</a><br/>
------------<br/>
<a href="Admin.Asp?SessionID=<%=request("SessionID")%>">返回球赛管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delcmsj" then 
%>

	<card id="delcmsj" title="清空球迷所有投注记录">
		<p>

是否清空<u>球迷所有投注记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delcmsjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>
<%
elseif Action="delcmsjok" then 
%>
	<card id="delcmsjok" title="球迷所有投注记录">
		<p>

<%
 sql="Delete FROM cds"
 myc.execute(sql)
 sql="Delete FROM cdx"
 myc.execute(sql)
 sql="Delete FROM csx"
 myc.execute(sql)
 sql="Delete FROM cps"
 myc.execute(sql)
 sql="Delete FROM cwx"
 myc.execute(sql)
 sql="Delete FROM ctm"
 myc.execute(sql)
%>
成功删除<u>球迷所有投注记录</u>!<br/>------------<br/>
<a href="Admin.Asp?SessionID=<%=request("SessionID")%>">返回球赛管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>

<%
elseif Action="delsysj" then 
%>

	<card id="delsysj" title="清空所有记录">
		<p>

是否清空<u>投注记录及开奖记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsysjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>
<%
elseif Action="delsysjok" then 
%>

	<card id="delsj" title="清空所有记录">
		<p>

<%
 sql="Delete FROM ckjhm "
 myc.execute(sql)

 sql="Delete FROM cpjf "
 myc.execute(sql)

 sql="Delete FROM cds"
 myc.execute(sql)

 sql="Delete FROM cdx"
 myc.execute(sql)

 sql="Delete FROM csx"
 myc.execute(sql)

 sql="Delete FROM cps"
 myc.execute(sql)

 sql="Delete FROM cwx"
 myc.execute(sql)

 sql="Delete FROM ctm"
 myc.execute(sql)
%>
成功删除<u>所有记录</u>!<br/>------------<br/>
<a href="Admin.Asp?SessionID=<%=request("SessionID")%>">返回球赛管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>


<%
elseif Action="delsj" then 
%>

	<card id="delsj" title="清空开奖记录">
		<p>

是否清空<u>历史开奖记录</u>?<br/>
<a href="Cai_Usegl.asp?SessionID=<%=request("SessionID")%>&amp;Action=delsjok">是</a><br/>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">否</a><br/></p></card></wml>

<%
elseif Action="delsjok" then 
%>
	<card id="delsjok" title="清空开奖记录">
		<p>

<%
 sql="Delete FROM ckjhm "
 myc.execute(sql)
%>

成功删除<u>历史开奖记录</u>!<br/>------------<br/>
<a href="Admin.Asp?SessionID=<%=request("SessionID")%>">返回球赛管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
end if
end if
		myc.close
		set myc=nothing
%>
