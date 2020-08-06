<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then
response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
if Session("zh")="wap" then
response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
dim res,sqld
set res=server.createobject("ADODB.Recordset")
sqld="select * from gd where idd=" & id & " and idlt=" & idlt & " and jz='i'"
res.open sqld,myc,1,1
if not res.eof then
   response.write "<card title='错误!'><p>你被禁止进入该聊天室啦,请联系管理员</p></card></wml>"
   response.end

else

dim sqlls
sqlls="update ooo set times=now() where wap='" & SessionID & "'"
myc.execute sqlls
sqlls="update ooo set iidd=" & id & " where wap='" & SessionID & "'"
myc.execute sqlls

dim t
t=request("t") 

if t<>"" and t<>0 then
sql1="delete from roms where idd=" & id & " and DATEDIFF('s', times, now()) > cint("& bl &")*3600"
myc.execute sql1
end if

dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from rom where idd=" & id
rs.open sql,myc,1,1

dim rss,sqls
set rss=server.createobject("ADODB.Recordset")
sqls="select * from roms where idd=" & id & " order by id desc"
rss.open sqls,myc,1,1
if t="" then t="200"

dim p
p=request("p")
if p="" then p=1
dim tt
tt=right(now(),8)
Response.write "<card id='card1' title='" & rs("roomname") & "' ontimer='/bbs/room/room.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p & "&amp;tt=" & tt & "'><timer value='500'/><p>"
%>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>你有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ID=" & ID & "&amp;tt=" & tt & ""
End if

   if len(ad)>2 then
response.write ubb2(ad) & "<br/>"
   end if
	if rss.eof Then
	Response.write "欢迎进入" & rs("roomname") & "聊天室<br/>"
	Else
response.write("<a href='room.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p & "&amp;t=" & t & "&amp;tt=" & tt & "'>刷新</a>&nbsp;<a href='talk.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>发言</a>&nbsp;<a href='talkdz.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>动作</a>&nbsp;<a href='talkb.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>贴图</a><br/>")
%>
<input type="text" name="talk" maxlength="50" size='6'/>
<anchor>[发言]
<go method="post" href="talkcl.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
</go>
</anchor><br/>----------<br/>
<%
rss.Move((p-1)*pag)
dim i
i=1
do while ((not rss.eof) and i<=cInt(pag))
  dim time
   time=right(rss("times"),8)
 response.write ((p-1)*pag+i) & "."

response.write "<a href='myfy1.asp?id=" & id & "&amp;ids=" & rss("idstt") & "&amp;SessionID=" & SessionID & "'>" & ubb2(rss("name")) &"</a><u><b>对</b></u>" & ubb2(rss("about")) & ":" & ubb2(rss("text")) & "(" & time & ")<br/>"
rss.movenext
i=i+1

loop
	if p*pag<rss.recordcount Then response.write("<a href='room.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p+1 & "'>下页</a>")
	if p>1 then response.write("<a href='room.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p-1 & "'>上页</a>")

if pag<rss.recordcount then 
response.write("("& p & "/" & (int(rss.recordcount/pag+1)) &"/" & rss.recordcount & ")<br/>")
%>
第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(p+1)%>" maxlength="3"/>页
<anchor>>>
    <go href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
        <postfield name="p" value="$(gpage<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%
end if
end if
end if
rss.close
set rss=Nothing

response.write("----------<br/><a href='talk.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>发言</a>&nbsp;<a href='room.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;p=" & p & "'>刷新</a>&nbsp;")
dim rs2,sql2
set rs2=server.createobject("ADODB.Recordset")
sql2="select id from ooo where iidd=" & id & " and DATEDIFF('s', times, now()) < 15*60"
rs2.open sql2,myc,1,1
	if not rs2.eof then
dim zxs
zxs=rs2.recordcount
	end if
rs2.close
set rs2=nothing
response.write("<a href='zx.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>室友(" & zxs & ")</a><br/>")
response.write "<a href='romglzc.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>主持人列表</a><br/>"
response.write "<a href='romglhm.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>聊室黑名单</a><br/>"
%>
<a href="index.asp?SessionID=<%=SessionID%>">[聊天广场]</a><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>[我的地盘]</a><br/>
<a href='/bbs/ztlb.asp?SessionID=<%=SessionID%>'>[论坛导航]</a><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[社区首页]</a><br/>
<!--#include file="admin.asp"-->
<%
response.write("<a href='romgl.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>[进入管理]</a><br/>")
end if
%>
<%=now%>
<%  
response.write "<br/>ET:"& FormatNumber((timer()-t1)*1000,3) & "MS</p></card></wml>"
conn.close
set conn=nothing
%>