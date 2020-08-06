<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Action=request("Action")

if Action="" then Action="main"
if Action="main" then
%>
<card  title="管理栏目">
<p>一级栏目列表<br/>
<%
page=int(request("page"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
Set rs = Server.CreateObject("ADODB.Recordset")
sql ="SELECT * FROM classx where formid=0 ORDER BY kyzcpx aSC" 
rs.open sql,conn,1,1
a=rs.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("没有记录<br/>")
end if
if a>0 then
rs.Move((page-1)*ns)
dim j
j=1
do while ((not rs.eof) and j<=ns)
'========================================================================================
Response.Write"<a href='wap_Class.asp?id="&rs("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>[管理]</a>" & rs("kyzcpx") & "."&ubb(rs("classname"))&"<br />"
'========================================================================================
			j = j + 1
rs.MoveNext
loop
end if
if page<maxp then
response.write("<a href='"&name&"?page="&page+1&"&amp;adminmid="&request("adminmid")&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='"&name&"?page="&page-1&"&amp;adminmid="&request("adminmid")&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="<%=name%>?adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%
end if
rs.close
set rs=nothing
response.write "-------------<br/>"
response.write("<a href='wap_Class.asp?ID=0&amp;Action=Defrag&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages+1&"'>栏目重新排序</a><br />")
response.write("<a href='ClassAction.asp?Action=add&amp;ID=100000000000000&amp;adminmid="&request("adminmid")&"'>添加栏目</a><br />")

response.write "-------------<br/>"

Elseif Action="Defrag" then

response.write"<card id='Defrag' title='重新排序'><p>"

id=request("id")
set rspx=server.CreateObject("adodb.recordset")
sql="select * from classx where formid="&id
rspx.open sql,conn,3,3 
If Not rspx.Eof Then
j=1
do while ((not rspx.EOF) and j <=500000)
rspx("kyzcpx")=j
rspx.update
rspx.MoveNext
j=j+1
loop
Else
eer="重新排序失败!原因没有任何栏目！<br/>"
End if
rspx.close
set rspx=Nothing
%>
<%if eer="" then%>
重新排序成功！<br/>
<%else%>
<%=eer%>
<%end if%>

<%
if id=0 then
response.write "-------------<br/><a href='wap_Class.asp?ID="&id&"&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br />"
else
response.write "-------------<br/><a href='wap_Class.asp?ID="&id&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br />"
end if

Elseif Action="Manage" then
id=request("id")
page=int(request("page"))
if page="" or page<=0 then
page=1
end if

pages=int(request("pages"))
if pages="" or pages<=0 then
pages=1
end if

if ns="" or ns<=0 then
ns=10
end if
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM classx where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write"<card id='Manage' title='错误'><p>"
response.write"无此栏目<br/>"
else
classname=rss("classname")
formid=rss("formid")

response.write("<card id='Manage' title='管理栏目-"&ubb(classname)&"'><p>")

response.write("栏目编号:"&rss("id")&"<br />")
response.write("栏目名称:"&ubb(classname)&"<br />")
if len(rss("kyzctp"))>7 then
response.write("栏目图标:<img src='"&rss("kyzctp")&"' alt='加载中...' /><br />")
Else
response.write("栏目图标:无<br />")
end if
if formid<>0 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from classx where id="&formid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此栏目"
Else
classnames=objgbrsy("classname")
end if
objgbrsy.close
Set objgbrsy= Nothing
response.write("上级栏目:"&ubb(classnames)&"<a href='wap_Class.asp?ID="&rss("formid")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>管理</a><br />")
end if
response.write("排列顺序:"&rss("kyzcpx")&"<br />")

if rss("kyzcyc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("kyzclx")=0 then

if rss("kyzcqx")=1 then
response.write("进入限制:只限会员<br />")
Elseif rss("kyzcqx")=2 then
response.write("进入限制:需扣币<br />")
Else
response.write("进入限制:不限<br />")
end if

if rss("kyzcqx")=2 then
response.write("扣币数额:"&ubb2(rss("kyzcyz"))&"金币<br />")
response.write("购买人数:"&rss("clink")&"<br />")
end if
response.write("栏目点击:"&rss("kyzcrc")&"次<br />")
if rss("kyzcgn")=1 then
response.write("默认排序:点击数量<br />")
Elseif rss("kyzcgn")=2 then
response.write("默认排序:最早添加<br />")
Elseif rss("kyzcgn")=3 then
response.write("默认排序:评论数量<br />")
Elseif rss("kyzcgn")=4 then
response.write("默认排序:特定排序<br />")
Else
response.write("默认排序:更新时间<br />")
end if

if rss("kyzcdj")="left" then
response.write("对齐方式:居左<br />")
Elseif rss("kyzcdj")="center" then
response.write("对齐方式:居中<br />")
Else
response.write("对齐方式:居右<br />")
end if

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from yxxe_wz where Classid="&id&" order by id DESC" 
objgbrcs.open sscql,conn,1,1
if objgbrcs.eof then
response.write("栏目内容:无<br />")
Else
kyaa=objgbrcs.RecordCount
response.write("栏目内容:"&kyaa&"<a href='Entry.asp?Action=Class&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>查看内容</a><br />")
end if
objgbrcs.close
Set objgbrcs= Nothing

if rss("kyzcjj")<>"" then
response.write("栏目简介:"&ubb2(rss("kyzcjj"))&"<br />")
end if

Elseif rss("kyzclx")=1 then
response.write("连接地址:"&ubb2(rss("kyzcjj"))&"<br />")
Elseif rss("kyzclx")=2 then
response.write("文字栏目:"&ubb2(rss("classname"))&"<br />")
end if
response.write("创建时间:"&ubb2(rss("times"))&"<br />")
response.write("<a href='ClassAction.asp?Action=modify&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>编辑栏目</a>◆<a href='ClassAction.asp?Action=delete&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>删除栏目</a><br />")
if rss("kyzclx")=0 then
response.write("<a href='ClassAction.asp?Action=move&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>移动栏目</a>◆<a href='ClassAction.asp?Action=merge&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>合并栏目</a><br />")
response.write("<a href='ClassAction.asp?Action=icon&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>设置图标</a>◆<a href='ClassAction.asp?Action=entryadd&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>添加内容</a><br />")
end if
response.write("------------<br />")

set rsyt=Server.CreateObject("ADODB.Recordset")
sqlr="select * from classx where formid="&ID&" order by kyzcpx asc"
rsyt.open sqlr,conn,1,1
if rsyt.eof then 
response.write("暂无子栏目<br />")
   else
kkky=10
ak47=rsyt.recordcount
maxpp=(ak47-1)\kkky+1
if pages>maxpp then pages=maxpp
rsyt.Move((pages-1)*kkky)
dim jg
jg=1
do while ((not rsyt.eof) and jg<=kkky)
%>
<%if rsyt("kyzclx")="0" then
Response.Write"<a href='wap_Class.asp?id="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理]</a>" & rsyt("kyzcpx") & "."&ubb(rsyt("classname"))&"<br />"%>
<%elseif rsyt("kyzclx")="1" then
Response.Write"<a href='wap_Class.asp?id="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理]</a>[连]" & rsyt("kyzcpx") & "."&ubb(rsyt("classname"))&"<br />"%>
<%elseif rsyt("kyzclx")="2" then
Response.Write"<a href='wap_Class.asp?id="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理]</a>[文]" & rsyt("kyzcpx") & "."&ubb(rsyt("classname"))&"<br />"%>
<%end if%>
<%
			jg = jg + 1
rsyt.movenext 
loop
end if

if maxpp>1 then
response.write("----------<br/>")
end if

if pages<maxpp then
response.write("<a href='wap_Class.asp?ID=" & ID & "&amp;Action=Manage&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages+1&"'>下页</a>&nbsp;")
end if

if pages>1 and maxpp>1 then
response.write("<a href='wap_Class.asp?ID=" & ID & "&amp;Action=Manage&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages-1&"'>上页</a>")
end if

if maxpp>1 then
response.write("("&pages&"/"&maxpp&"/"&ak47&")<br/>")
%>
                    <input name="Pages<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Pages>=maxpp then response.write(Pages-1) else response.write(Pages+1)%>"/>页<anchor>跳页
		      <go href="wap_Class.asp?ID=<%=ID%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
		            <postfield name="Pages" value="$(Pages<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%
end if

rsyt.close
set rsyt=nothing

response.write("----------<br/>")
response.write("<a href='wap_Class.asp?ID=" & ID & "&amp;Action=Defrag&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages+1&"'>栏目重新排序</a><br />")
response.write("<a href='ClassAction.asp?Action=add&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>添加子栏目</a><br />")
response.write("<a href='ClassAction.asp?Action=add&amp;ID=100000000000000&amp;adminmid="&request("adminmid")&"'>添加栏目</a><br />")
response.write("----------<br/>")

if rss("kyzcd")=1 then
response.write("显示点击:显示 <a href='ClassAction.asp?Action=ShowHits&amp;ID="&id&"&amp;ky=0&amp;adminmid="&request("adminmid")&"'>隐藏</a><br />")
Else
response.write("显示点击:隐藏 <a href='ClassAction.asp?Action=ShowHits&amp;ID="&id&"&amp;ky=1&amp;adminmid="&request("adminmid")&"'>显示</a><br />")
end if

if rss("kyzcx")=1 then
response.write("显示序号:显示 <a href='ClassAction.asp?Action=ShowNumber&amp;ID="&id&"&amp;ky=0&amp;adminmid="&request("adminmid")&"'>隐藏</a><br />")
Else
response.write("显示序号:隐藏 <a href='ClassAction.asp?Action=ShowNumber&amp;ID="&id&"&amp;ky=1&amp;adminmid="&request("adminmid")&"'>显示</a><br />")
end if

end if

conn.close
set rss=nothing
set conn=nothing
%>
------------<br />
<%
Else
response.write"<card id='Manage' title='系统提示'><p>请不要提交非法参数<br/>"

end if


if formid<>0 then
response.write "<a href='wap_Class.asp?ID="&formid&"&amp;Action=Manage&amp;Pages="&pages&"&amp;adminmid="&request("adminmid")&"'>返回上级栏目</a><br/>"
end if

if Action<>"main" then
response.write "<a href='wap_Class.asp?ID="&formid&"&amp;Pages="&pages&"&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br/>"
end if

response.write "<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a>" 
response.write "<br/><a href='/index.asp?adminmid="&request("adminmid")&"'>返回网站首页</a>"%>
</p>
</card>
</wml>