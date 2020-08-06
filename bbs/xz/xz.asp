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
<card id="main" title="勋章商城" >
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
iduse=Session("useid")
set rs13=Server.CreateObject("ADODB.Recordset")
strsQL="select * from usereg where cstr(id)='"&iduse& "'"
rs13.open strsQL,Conn,1,2
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if
%>
购买成功后请不要重复购买<br/>否则会重复扣费，切记！！！<br/>
1.
<img src="/bbs/xz/img/1.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!111!" />
		<postfield name="m" value="18000" />
		
		</go>
		</anchor><br/>

	2.
<img src="/bbs/xz/img/2.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!222!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
3.
<img src="/bbs/xz/img/3.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!333!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
4.
<img src="/bbs/xz/img/4.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!444!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
5.
<img src="/bbs/xz/img/5.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!555!" />
		<postfield name="m" value="18000" />
		
		</go>
		</anchor><br/>

	6.
<img src="/bbs/xz/img/6.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!666!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
7.
<img src="/bbs/xz/img/7.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!777!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
8.
<img src="/bbs/xz/img/8.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!888!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
9.
<img src="/bbs/xz/img/9.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!999!" />
		<postfield name="m" value="18000" />
		
		</go>
		</anchor><br/>

	10.
<img src="/bbs/xz/img/10.gif" alt=""/><br/>
18000金币<br/>
<anchor>购买
		<go href="/BBS/xz/xzcl.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs13("zamw")%>!1000!" />
		<postfield name="m" value="18000" />
		</go>
		</anchor><br/>
                <%
 rs13.Close
	Set rs13=Nothing

%>
----------<br/>

<a href="/BBS/Gift/Gift.Asp?SessionID=<%=SessionID%>">返回社区超市</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>