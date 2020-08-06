<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="我的投注记录" >
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" or ky>7 or ky<1 then
	ky=7
  end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if

set rss=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rss.open rsQL,myc,1,2
if rss.recordcount<1 then
rss.addnew
rss("ids")=iduse
rss.update
end if
        rss.Close
	Set rss=Nothing
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from ctm where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1

page=int(request("page"))
n=int(request("n"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

a=rs.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp


if a=0 then
response.write("--------------<br/>暂无投注记录<br/>")
end if

if a>0 then
response.write(""&tip&"有"&a&"条记录<br/>--------------<br/>")
end if

if a>0 then
rs.Move((page-1)*ns)
dim j
j=1
do while ((not rs.eof) and j<=ns)

tjhm=rs("ids")
id=rs("idss")
set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where id=" & id & ""
  objgbrc1.open ssql6,myc

 if rs("hm")=1 then
cl= objgbrc1("ds")
else
cl= objgbrc1("dx")
end if 

objgbrc1.close
set objgbrc1=nothing%>
第<%=rs("idss")%>场:<a href='TOP.Asp?kyzc=yxxe&amp;idsx=<%=tjhm%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjname)%></a>买:<b><%=cl%></b>☆<b><u><%=ubb(rs("ks"))%></u></b>球币<br/>
<%
			j = j + 1
rs.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='Mytz.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='Mytz.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="LHC/Mytz.Asp?SessionID=<%=SessionID%>&amp;ky=<%=ky%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rs.close
set rs=nothing
%>--------------<br/>
<a href="Tzjl.Asp?SessionID=<%=SessionID%>">网友投注记录</a><br/>
<a href="Index.Asp?SessionID=<%=SessionID%>">返回球赛博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>