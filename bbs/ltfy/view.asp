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
</head>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
gfdsa=Session("ltname")
id=request.QueryString("id")
page=request("page")
if page="" or page<1 then page=1
%>
<card title="状纸信息">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where [id]=" & id
rs.open rsstr,conn,1,2
if rs.recordcount=0 then 
response.write("无此案件！<br/>")
else 

dim xh,jd,xh1,jd1,img
xh=rs("xh")
jd=rs("jd")
xh1=xh
jd1=jd+1
if xh1/jd1>=20 and rcc>50 then
 img="5.gif"
elseif xh1/jd1>=10 and rcc>25 then
 img="4.gif"
elseif xh1/jd1>=5 and rcc>10 then
 img="3.gif"
elseif xh1/jd1>=2 and rcc>5 then
 img="2.gif"
else
 img="1.gif"
end if

rs("rc")=rs("rc")+1
rs.update
%>

法字第<%=rs("id")%>号<br/>
<%
tjhms=rs("idid")
	sqlss="select * from usereg where CStr(id)='" & tjhms & "'"
	set rsSSs=conn.execute(sqlss)
	rtjnames=rsSSs("usename")
set rsSSs=nothing
%>
原告:<%=encodestr(rtjnames)%>ID:<%=rs("idid")%><br/>
<%
tjhm=rs("url")
	sql="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sql)
	rtjnamer=rsSS("usename")
set rsSS=nothing
%>

被告:<%=encodestr(rtjnamer)%>ID:<%=rs("url")%><br/>

案情经过:<%=encodestr(rs("zj"))%><br/>
要求赔偿:<%=encodestr(rs("pczb"))%>金币<br/>
起诉时间:<%=encodestr(rs("addtime"))%><br/>
<%'Response.write "访问数:"&encodestr(rs("rc"))&"次<br/>"%>

<!--#include file="admin.asp"-->
<a href="del.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;page=<%=page%>">删除案件</a>
<%
if rs("check")=0 then
%>
|<a href="reedit.asp?idid=<%=rs("idid")%>&amp;SessionID=<%=SessionID%>&amp;id=<%=rs("id")%>&amp;page=<%=page%>">执行判决</a><br/>
<%else
Response.write "<br/>"
 end if
 end if
end if %>
被告上诉:<%=encodestr(rs("about"))%><br/><%
if encodestr(rs("sscs"))<=2 and encodestr(rs("pcdj"))<2 and encodestr(rs("fsdj"))<1 and encodestr(rs("url"))=CStr(Session("useid")) then %>
<a href="bgss.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;page=<%=page%>">我要上诉</a><br/>
<%end if%>
法院判决:<%=encodestr(rs("fyzx"))%><br/>
<!--#include file="admin.asp"-->
<%if encodestr(rs("pcdj"))=1 then %>
<anchor>执行判决(赔偿<%=encodestr(rs("pczb"))%>金币)
<go method="post" href="gfjfcl.asp?SessionID=<%=SessionID%>">
<postfield name="gfjf" value="<%=encodestr(rs("pczb"))%>"/>
<postfield name="id" value="<%=encodestr(rs("idid"))%>"/><postfield name="idd" value="<%=id%>"/><postfield name="reids" value="<%=encodestr(rs("url"))%>"/>
</go>
</anchor><br/>
<%end if
end if%>
<%if encodestr(rs("pcdj"))=2 then%>
已经执行赔偿<%=encodestr(rs("pczb"))%>金币<br/>
<%end if%>
<!--#include file="admin.asp"-->
<%if encodestr(rs("fsdj"))=0 and rs("check")>0 then %>
<anchor>把判决发给被告<go method="post" href='fslycl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="关于<%=encodestr(rtjnames)%>ID:<%=encodestr(rs("idid"))%>对你在法院的控诉，法院审后，判决如下:<%=encodestr(rs("fyzx"))%>"/>
<postfield name='ids' value='<%=rs("url")%>'/>
<postfield name='reids' value='0'/>
<postfield name='id' value='<%=id%>'/>
</go></anchor><br/><%
end if
end if
if encodestr(rs("fsdj"))=1 then%>
已经将执行命令发给被告<br/>
<%
end if 
if encodestr(rs("sscs"))=0 then 
response.write ""
end if
if encodestr(rs("sscs"))>0 then %>
上诉次数:<%=encodestr(rs("sscs"))%>次<br/>
<%end if
if encodestr(rs("sscs"))<=2 and encodestr(rs("pcdj"))<2  and rs("check")<>0 and encodestr(rs("fsdj"))<1 and encodestr(rs("idid"))=CStr(Session("useid")) then %>
<a href="wzjs.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;page=<%=page%>">不服判决.我要上诉</a><br/>
<%end if
rs.close
set rs=nothing
%>
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