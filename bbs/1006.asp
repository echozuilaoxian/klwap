<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%ForumID=request("ForumID")
SessionID=request.querystring("SessionID")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from jzbl where id="&ForumID
rs.open rspl,conn,1,2
dlname=converttowidebaiti(rs("biaoti"))
yxxes=rs("tjhm")
yxxess=rs("naiyo")
if yxxess="" then yxxess="暂无公告"
%>
<card id="main" title="<%=dlname%>-编辑帮派" >
<p>
<%if Session("useid")=yxxes then
%>
帮派名称:<input name='name<%=minute(now)%><%=second(now)%>' title='版块名称' value='<%=converttowidebaiti(rs("biaoti"))%>'/>必填<br/>
帮派图标:<input name='logo<%=minute(now)%><%=second(now)%>' title='版块图标' value='<%=converttowidebaiti(rs("itid"))%>'/>可以留空<br/>

帮派简介:<input name="txt2<%=minute(now)%><%=second(now)%>" maxlength="20" value='<%=converttowidebaiti(rs("nai"))%>'/><br/>

帮派公告:<input name='txt<%=minute(now)%><%=second(now)%>'  maxlength="500" value='<%=rs("naiyo")%>'/>可以留空<br/>

用户加入:<select name='a<%=minute(now)%><%=second(now)%>' value='<%=rs("a")%>'>
<option value='f'>允许</option>
<option value='t'>拒绝</option>
</select><br/>

对齐方式:<select name='Systemdj<%=minute(now)%><%=second(now)%>' value='<%=rs("lzdname")%>'>
<option value="left">居左对齐</option>
<option value="center">居中对齐</option>
<option value="right">居右对齐</option>
</select><br/>

<anchor>修改<go href='1007.asp?SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/><postfield name='name' value='$(name<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt2' value='$(txt2<%=minute(now)%><%=second(now)%>)'/>
<postfield name='logo' value='$(logo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='aaa' value='$(a<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemdj' value='$(Systemdj<%=minute(now)%><%=second(now)%>)'/>

<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>
<%

else
    Response.Write "逛错地方啦！！！！！！"

end if

    Response.Write "<br/>-------------<br/>"
Response.write "<a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"
  conn.close
  set rs=nothing
  set conn=nothing

%>
