<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="民事诉讼处">
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

Server.ScriptTimeout=999
iduse=Session("useid")
gfdsa=Session("ltname")%>
您好,<%=gfdsa%>欢迎您来到城市法院,请仔细填写状纸,以方便正确判决! 每项必填,诉讼费500金币<br/>
状纸题目: 
<br/><input name="site<%=minute(now)%><%=second(now)%>" title="昵称" type="text" emptyok="true" maxlength="10" value=""/><br/>

状告何人(ID):<br/>
<input name="id<%=minute(now)%><%=second(now)%>" title="ID号" type="text" format="*N" emptyok="true" maxlength="10" value=""/><br/>

描述经过:<br/>

<input name="zj<%=minute(now)%><%=second(now)%>" title="证据" type="text" emptyok="true" maxlength="200" value=""/><br/>

赔偿金币:<br/><input name="pczb<%=minute(now)%><%=second(now)%>" title="金币数量" type="text" emptyok="true" maxlength="10" format="*N" value=""/><br/>
<anchor>[-提交-]
    <go href="save.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="site" value="$(site<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="id" value="$(id<%=minute(now)%><%=second(now)%>)"/>
<postfield name="zj" value="$(zj<%=minute(now)%><%=second(now)%>)"/>
<postfield name="pczb" value="$(pczb<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor>
<br/>
<%
Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>返回城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>

</p>
</card>
</wml>
<%
conn.close
set conn=nothing
%>