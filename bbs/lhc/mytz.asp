﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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

  select case ky
'================================
  case 1
  tip="特码投注"
  StrFont="特码 <a href='/BBS/LHC/mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a><br/>"
'================================
  case 2
  tip="生肖投注"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> 生肖 <a href='/BBS/LHC/Mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/Mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/Mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/Mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a><br/>"
'================================
  case 3
  tip="单双投注"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/Mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> 单双 <a href='/BBS/LHC/Mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/Mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/Mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a><br/>"
'================================
  case 4
  tip="波色投注"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/Mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/Mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> 波色 <a href='/BBS/LHC/Mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/Mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a><br/>"
'================================
  case 5
  tip="大小投注"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/Mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/Mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/Mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> 大小 <a href='/BBS/LHC/Mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a><br/>"
'================================
  case 6
  tip="五行投注"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/Mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/Mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/Mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/Mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> 五行<br/>"
'================================
  case 7
  tip="我的记录"
  StrFont="<a href='/BBS/LHC/Mytz.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码投注记录</a> <br/><a href='/BBS/LHC/Mytz.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖投注记录</a> <br/><a href='/BBS/LHC/Mytz.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双投注记录</a> <br/><a href='/BBS/LHC/Mytz.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色投注记录</a> <br/><a href='/BBS/LHC/Mytz.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小投注记录</a> <br/><a href='/BBS/LHC/Mytz.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行投注记录</a><br/>"
  end select

if ky<>"7" then
response.write StrFont

if ky="1" then
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from ctm where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
Elseif ky="2" then

  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from csx where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
Elseif ky="3" then
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from cds where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
Elseif ky="4" then
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from cps where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
Elseif ky="5" then
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from cdx where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
Elseif ky="6" then
  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from cwx where cstr(ids)='"&iduse& "' order by idss desc "
  rs.open ssql,myc,1,1
  end if

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
response.write(""&tip&"-有"&a&"条记录<br/>--------------<br/>")
end if

if a>0 then
rs.Move((page-1)*ns)
dim j
j=1
do while ((not rs.eof) and j<=ns)

tjhm=rs("ids")
%>
第<%=rs("idss")%>期<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx=<%=tjhm%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjname)%></a>买:<b><%=ubb(rs("hm"))%></b>☆<%=ubb(rs("ks"))%>港币<br/>
<%
			j = j + 1
rs.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/LHC/Mytz.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/LHC/Mytz.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/LHC/Mytz.Asp?SessionID=<%=SessionID%>&amp;ky=<%=ky%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rs.close
set rs=nothing
Else
response.write("我的投注记录<br/>")
response.write("<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx="&iduse&"&amp;SessionID="&SessionID&"'>我的中奖记录</a><br/>")
response.write StrFont
end if

%>--------------<br/>
<a href="/BBS/LHC/Tzjl.Asp?SessionID=<%=SessionID%>">网友投注记录</a><br/>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>