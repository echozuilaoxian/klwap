<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
page=cint(request.QueryString("page"))
if page="" or page<1 then page=1
Function c2u(sGBStr)
Dim i,c
if sGBStr<>"" then 
For i = 1 to Len(sGBStr)
c = Mid(sGBStr,i,1)
if c=chr(13) then 
c2u = c2u & "<br/>"
else
c2u = c2u & "&#x" & Hex(AscW(c)) & ";"
end if
Next
end if
End Function
function ssubb(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"&#xFFE5;","*")
	str=replace(str,"&#39;","'")
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
	set re=Nothing
	ssubb=str
	set re=Nothing
	ssubb=str
end function

function ubb2(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"$","$$")
	str=replace(str,"","&nbsp;")
        str=replace(str,Chr(13),"<br/>")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(i\))(.[^\[]*)(\(\/i\))"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
	re.pattern="(\(a\))(.[^\[]*)(\(\/a\))"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\(a=(.[^\]]*)\))(.[^\[]*)(\(\/a\))"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\(no\))(.[^\[]*)(\(\/no\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$2</a>")
	re.pattern="(\(no=(.[^\]]*)\))(.[^\[]*)(\(\/no\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$3</a>")
	re.pattern="(\(u\))(.[^\[]*)(\(\/u\))"
	str= re.Replace(str,"<u>$2</u>")
	set re=Nothing
	ubb2=str
end function

Kyzc=request("Kyzc")

iF Kyzc ="" Then Kyzc="main"
%>
<card title="后台管理留言">
<p>

<%IF Kyzc="main" then%>
wap后台管理留言<br/>
-----------------<br/>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] order by [ID] desc"
rs.open rsstr,conn,1,2

maxpage=int((rs.recordcount-1)/10)+1
if page>maxpage then page=maxpage

if rs.recordcount = 0 then response.write("暂无留言！<br/>")
if rs.recordcount > 0 then

rs.Move((page-1)*10)
dim j,pic
j=1
pic=rs("pic")
%>
<%
response.write("当前共有" & rs.recordcount & "条<br/>")
do while ((not rs.EOF) and j<=10)
%>

<%=((page-1)*10+j)%>.<% if rs("open") then %>(密)<% end if%><a href='wap_admin_lyindex.asp?kyzc=view&amp;ID=<%=rs("ID")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>'>
<%=ssubb(rs("name"))%>:<%=ssubb(rs("text"))%></a>(阅<%=rs("DesktopCk")%>)
<% if rs("retext")<>"" then %>[复]
<%else%>
[待]
<%end if%>
<br/>
<%
rs.MoveNext
j=j+1
loop
end if

if page*10<rs.recordcount then response.write("<a href='wap_admin_lyindex.asp?page=" & page+1 & "&amp;adminmid="&request("adminmid")&"'>下一页</a>&nbsp;")
if page>1 then response.write("<a href='wap_admin_lyindex.asp?page=" & page-1 & "&amp;adminmid="&request("adminmid")&"'>&nbsp;上一页</a>")
%>
<%if page*10<rs.recordcount or page>1 then%>
<br/>跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(page+1)%>" maxlength="3"/>页
<anchor>[GO]
    <go href="wap_admin_lyindex.asp?adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
        <postfield name="page" value="$(gpage<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%end if
rs.close
set rs=nothing


elseIF Kyzc="view" then
id=request("id")
page=request("page")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & ID
rs.open rsstr,conn,1,2

set rsn=Server.CreateObject("ADODB.Recordset")
rsstrn="select * from [gbook] where [ID]<"& ID &" order by [ID] desc"
rsn.open rsstrn,conn,1,2

set rspr=Server.CreateObject("ADODB.Recordset")
rsstrpr="select * from [gbook] where [ID]>"& ID &" order by [ID] asc"
rspr.open rsstrpr,conn,1,2

if rs.recordcount=0 then 
response.write("该条留言不存在！<br/>")
else
response.write("[<b>" )
response.write(ssubb(rs("name")) & "")
response.write("</b>]的留言<br/>" )
%>
<%
response.write("留言内容：<b>" & ssubb(rs("text")) & "</b><br/>")
response.write("查看次数：<b>" & rs("DesktopCk") & "</b><br/>")
response.write("发表时间：<b>" & rs("time") & "</b><br/>")
%>
留言者IP：<anchor title="submit"><%=rs("IswNumsIP")%>
<go href="http://wap.ip138.com/ip.asp" method="post">
<postfield name="ip" value="<%=rs("IswNumsIP")%>"></postfield>
</go>
</anchor><br/>
<%
if rs("num")<>""  then 
response.write("手机号码：<b>" & rs("num") & "</b><br/>")
end if
if rs("agent")<>""  then 
response.write("手机型号：<b>" & rs("agent") & "</b><br/>")
end if
%>
客服回复：<b><%=ubb2(rs("retext"))%></b><br/>
操作时间：<b><%=rs("retime")%></b><br/>
----------<br/>
<input name="retext" title="回复" type="text" format="*M" emptyok="true" maxlength="500" value='<%=rs("retext")%>'/><br/>
<anchor>回复
    <go href="wap_admin_lyindex.asp?kyzc=save&amp;adminmid=<%=request("adminmid")%>" method="post" accept-charset="utf-8">
        <postfield name="id" value="<%=id%>"/>
        <postfield name="page" value="<%=page%>"/>
        <postfield name="retext" value="$(retext)"/>
    </go>
</anchor><br/>
----------<br/>
<a href="wap_admin_lyindex.asp?kyzc=del&amp;id=<%=id%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">删除</a> | <a href="wap_admin_lyindex.asp?kyzc=edit&amp;id=<%=id%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">编辑</a><br/>
----------<br/>
<%if rsn.recordcount>0 then%>
<a href='wap_admin_lyindex.asp?kyzc=view&amp;id=<%=rsn("ID")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>'>下条</a>
<%end if%>
<%if rspr.recordcount>0 and rsn.recordcount>0 then%>
|
<%end if%>
<%if rspr.recordcount>0 then%>
<a href='wap_admin_lyindex.asp?kyzc=view&amp;id=<%=rspr("ID")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>'>上条</a>
<%end if%>
<%end if
if rspr.recordcount>0 or rsn.recordcount>0 then%>
<br/>
<%
end if

rs.close
set rs=nothing


elseIF Kyzc="save" then
id=request("id")
page=request("page")
retext=request("retext")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & id
rs.open rsstr,conn,1,2
rs("retext")=retext
rs("retime")=now()
rs.update
rs.close
set rs=nothing

response.write ("回复留言成功！")
%>
<a href="wap_admin_lyindex.asp?kyzc=view&amp;page=<%=page%>&amp;id=<%=id%>&amp;adminmid=<%=request("adminmid")%>">查看留言</a><br/>
<%
elseIF Kyzc="del" then

id=request.QueryString("id")
page=request.QueryString("page")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where ID=" & id
rs.open rsstr,conn,1,2
if rs.recordcount=1 then
rs.delete
rs.update
end if
rs.close
set rs=nothing
response.write ("删除留言成功！<br/>")

elseIF Kyzc="edit" then
id=request.QueryString("id")
page=request.QueryString("page")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]="& id
rs.open rsstr,conn,1,2

if rs.recordcount =1 then
%>
管理—编辑留言<br/>--------------<br/>

新留言名称：
<input name="name<%=minute(now)%><%=second(now)%>" title="名称" type="text" format="*M" emptyok="true" maxlength="10" value="<%=ssubb(rs("name"))%>"/><br/>
新留言内容：
<input name="text<%=minute(now)%><%=second(now)%>" title="内容" type="text" format="*M" emptyok="true" maxlength="500" value="<%=ssubb(rs("text"))%>"/><br/>
新留言性质：
<select title="性质" name="open<%=minute(now)%><%=second(now)%>">
<option title="公开" value="0">公开</option>
<option title="秘密" value="1">秘密</option>
</select><br/>
<anchor>提交修改
    <go href="wap_admin_lyindex.asp?kyzc=eeok&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>" method="post" accept-charset="utf-8">
        <postfield name="id" value="<%=id%>"/>
        <postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="text" value="$(text<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="open" value="$(open<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%
end if
elseIF Kyzc="eeok" then

id=request("id")
name=request("name")
text=request("text")
page=request("page")
open=request("open")

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where ID="& id
rs.open rsstr,conn,1,2

if name<>"" then rs("name")=name
if text<>"" then rs("text")=text
rs("open")=open
rs.update
rs.close
set rs=nothing
response.write ("编辑成功！")
%>
<a href="wap_admin_lyindex.asp?kyzc=view&amp;page=<%=page%>&amp;id=<%=id%>&amp;adminmid=<%=request("adminmid")%>">查看留言</a><br/>
<%
else
response.write ("请不要提交非法参数！<br/>")
end if

response.write ("----------<br/>")
IF Kyzc<>"main" then
%>
<a href="wap_admin_lyindex.asp?kyzc=main&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">返回上级面页</a><br/>

<%end if%>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="../index.asp?adminmid=<%=request("adminmid")%>">返回首页</a>
</p>
</card>
</wml>
<%
conn.close
set conn=nothing
%>