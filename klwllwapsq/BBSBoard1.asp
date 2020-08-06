<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
id=request("id")
page=request.QueryString("page")
Action=request("Action")
if Action="" then Action="main"
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>

<%
if Action="main" then
%>
<card title="社区排版管理">
<p>
<%
set rsaa=Server.CreateObject("ADODB.Recordset")
trna="select * from [wuza] order by [ID] desc"
rsaa.open trna,conn,1,2
yxxea=rsaa.recordcount

set rsab=Server.CreateObject("ADODB.Recordset")
trnb="select * from [sclt1] order by [ID] desc"
rsab.open trnb,conn,1,2
yxxeb=rsab.recordcount

set rsac=Server.CreateObject("ADODB.Recordset")
trnc="select * from [sclt1] where formid=0  order by [ID] desc"
rsac.open trnc,conn,1,2
yxxec=rsac.recordcount


response.write"帖子数量:"&yxxea&"<br/>"
response.write"首页栏目数量:"&yxxeb&"<br/>"
response.write"社区一级栏目数量:"&yxxec&"<br/>-------------<br/>"




set rs=Server.CreateObject("ADODB.Recordset")
rsppl="select * from sclt1 where lx<>500 and did=0 and formid=0 order by pid asc"
rs.open rsppl,conn,1,2
%>
一级栏目<br/>
<%
if rs.eof then 
response.write("暂无内容<br/>")
else
rs.Move(0)
dim j
j=1
do while ((not rs.EOF) and j <=500000)

if rs("lx")="0" then mmlx="一级栏目"
%>
<a href="BBSBoard1.asp?Action=Manage&amp;ID=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>">[管理]</a><%=rs("pid")%>.<%=UBB(rs("name"))%><br/>
<%
rs.MoveNext
j=j+1
loop
end if
rs.close
set rs=nothing
%>
----------<br/>
<a href="BBSBoard1.asp?Action=Add&amp;adminmid=<%=request("adminmid")%>">创建栏目</a><br/>
<a href="BBSBoard1.asp?Action=Defrag&amp;id=0&amp;adminmid=<%=request("adminmid")%>">栏目重新排序</a><br/>----------<br/>

<%
Elseif Action="Defrag" then
response.write"<card id='Defrag' title='栏目重新排序'><p>"
id=request("id")

set rspx=server.CreateObject("adodb.recordset")
sql="select * from sclt1 where formid="&id
rspx.open sql,conn,3,3 
If Not rspx.Eof Then
j=1
do while ((not rspx.EOF) and j <=500)
rspx("pid")=j
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
response.write "-------------<br/><a href='BBSBoard1.asp?Action=main&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br />"
else
response.write "-------------<br/><a href='BBSBoard1.asp?Action=Manage&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br />"
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
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write"<card id='Manage' title='系统提示'><p>"
response.write"系统提示！无此栏目<br/>----------<br/>"
else
name=UBB(rss("name"))
formid=rss("formid")

response.write("<card id='Manage' title='管理栏目-"&name&"'><p>")

response.write("版块栏目:"&rss("id")&"<br />")

if formid<>0 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&formid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此栏目"
Else
classnames=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
response.write("上级栏目:"&ubb(classnames)&"("&formid&")<a href='BBSBoard1.asp?Action=Manage&amp;ID="&formid&"&amp;adminmid="&request("adminmid")&"'>管理</a><br />")
Else
response.write("上级栏目:顶级栏目<br />")
end if


if rss("LX")=0 then
response.write("文本名称:"&name&"<br />")
response.write("文本内容:"&ubb(rss("shuo"))&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("brr")<>0 then
response.write("是否换行:换行<br />")
Else
response.write("是否换行:不换行<br />----------<br/>")
end if


Elseif rss("LX")=2 then
response.write("连接名称:"&name&"<br />")
response.write("连接地址:"&ubb(rss("shuo"))&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if

if rss("brr")<>0 then
response.write("是否换行:换行<br />")
Else
response.write("是否换行:不换行<br />----------<br/>")
end if

Else
response.write("版块名称:"&name&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if

if rss("brr")<>0 then
response.write("是否换行:换行<br />")
Else
response.write("是否换行:不换行<br />")
end if

if rss("qx")=1 then
response.write("进入限制:只限会员<br />")
Elseif rss("qx")=2 then
response.write("进入限制:只限斑竹<br />")
Elseif rss("qx")=3 then
response.write("进入限制:需要积分<br />")
response.write("工作天数:<b>"&rss("gongzuo")&"</b><br/>")
response.write("要求魅力:<b>"&rss("ml")&"</b><br/>")
response.write("要求体力:<b>"&rss("titi")&"</b><br/>")
response.write("要求金币:<b>"&rss("jin")&"</b><br/>")
Elseif rss("qx")=4 then
response.write("进入限制:帮派会员<br />")
Else
response.write("进入限制:没有限制<br />")
end if

response.write("栏目点击:"&rss("rc")&"<br />")
response.write("创建时间:"&rss("times")&"<br />----------<br/>")

response.write("下级栏目<br />")
set rsyt=Server.CreateObject("ADODB.Recordset")
sqlr="select * from sclt1 where formid="&ID&" order by pid asc"
rsyt.open sqlr,conn,1,1
if rsyt.eof then 
'response.write("暂无下级版块<br />----------<br/>")
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
<%if rsyt("lx")="1" then
Response.Write"<a href='BBSBoard1.asp1?ID="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理]</a>" & rsyt("pid") & "."&ubb(rsyt("name"))&"<br />"%>
<%elseif rsyt("lx")="0" then
Response.Write"<a href='BBSBoard1.asp1?ID="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理][文]</a>" & rsyt("pid") & "."&ubb(rsyt("name"))&"<br />"%>
<%elseif rsyt("lx")="2" then
Response.Write"<a href='BBSBoard1.asp1?ID="&rsyt("ID")&"&amp;Action=Manage&amp;Pages="&Pages&"&amp;adminmid="&request("adminmid")&"'>[管理][连]</a>" & rsyt("pid") & "."&ubb(rsyt("name"))&"<br />"%>
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
response.write("<a href='BBSBoard1.asp?ID=" & ID & "&amp;Action=Manage&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages+1&"'>下页</a>&nbsp;")
end if

if pages>1 and maxpp>1 then
response.write("<a href='BBSBoard1.asp?ID=" & ID & "&amp;Action=Manage&amp;adminmid="&request("adminmid")&"&amp;Pages="&pages-1&"'>上页</a>")
end if

if maxpp>1 then
response.write("("&pages&"/"&maxpp&"/"&ak47&")<br/>")
%>
                    <input name="Pages<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Pages>=maxpp then response.write(Pages-1) else response.write(Pages+1)%>"/>页<anchor>跳页
		      <go href="BBSBoard1.asp?ID=<%=ID%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
		            <postfield name="Pages" value="$(Pages<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
<%end if%>
<a href="BBSBoard1.asp?Action=Defrag&amp;id=<%=ID%>&amp;adminmid=<%=request("adminmid")%>">版块重新排序</a><br/>----------<br/>
                <%
rsyt.close
set rsyt=nothing

end if

if rss("LX")<>1 then
response.write("<a href='BBSBoard1.asp?Action=modify&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>编辑项目</a><br /><a href='BBSBoard1.asp?Action=del&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>删除项目</a><br />")
response.write("<a href='BBSBoard1.asp?Action=Move&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>移动项目</a><br />")
else
response.write("<a href='BBSBoard1.asp?Action=modify&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>编辑栏目</a>◆<a href='BBSBoard1.asp?Action=del&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>删除栏目</a><br />")
response.write("<a href='BBSBoard1.asp?Action=BBSMaster&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>版主管理</a>◆<a href='BBSBoard1.asp?Action=BBSLog&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>版主记录</a><br />")
response.write("<a href='BBSBoard1.asp?Action=BBSTopic&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>帖子管理</a>◆<a href='BBSBoard1.asp?Action=BBSReply&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>回复管理</a><br />")
response.write("<a href='BBSBoard1.asp?Action=Move&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>移动栏目</a>◆<a href='BBSBoard1.asp?Action=Merge&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>合并栏目</a><br />")
response.write("----------<br/>")

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1
kyaa=objgbrcs.RecordCount
objgbrcs.close
Set objgbrcs= Nothing

acc="t"
set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' and jh='"& acc &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1
kyab=objgbrcs.RecordCount
objgbrcs.close
Set objgbrcs= Nothing

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' and tj='"& acc &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1
kyac=objgbrcs.RecordCount
objgbrcs.close
Set objgbrcs= Nothing

response.write("贴子数量:"&kyaa&"◆精贴数量:"&kyab&"<br/>荐贴数量:"&kyac&"◆<a href='BBSBoard1.asp?Action=Manage&amp;ID="&id&"&amp;adminmid="&request("adminmid")&"'>更新帖子</a><br/>")
end if

response.write("----------<br/>")

end if







if formid<>0 then
Response.Write"<a href='BBSBoard1.asp?ID="&formid&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回上级栏目</a><br />"
else
Response.Write"<a href='BBSBoard1.asp?ID="&formid&"&amp;Action=main&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br />"
end if

rss.close
set rss=nothing




Elseif Action="modify" then
id=request("id")
response.write("<card id='modify' title='编辑栏目'><p>")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
dlname="错误！无此栏目"
Else
if rs("lx")="0" then
%>
文本名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='文本名称' value='<%=rs("name")%>'/><br/>
文本内容:<input name='txt<%=minute(now)%><%=second(now)%>' title='文本内容' value='<%=rs("shuo")%>'/><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='<%=rs("brr")%>'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='<%=rs("pid")%>' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='<%=rs("yc")%>'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>修改<go href='BBSBoard1.asp?Action=modifyok&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='lx' value='0'/>
<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>
<%
Elseif  rs("lx")="2" then
%>
连接名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='连接名称' value='<%=rs("name")%>'/><br/>
连接地址:<input name='txt<%=minute(now)%><%=second(now)%>' title='连接地址' value='<%=rs("shuo")%>'/><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='<%=rs("brr")%>'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='<%=rs("pid")%>' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='<%=rs("yc")%>'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>修改<go href='BBSBoard1.asp?Action=modifyok&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='lx' value='2'/>
<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>

<%
Else%>
版块名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='连接名称' value='<%=rs("name")%>'/><br/>
进入权限:<select name="jrqx<%=minute(now)%><%=second(now)%>" value="<%=rs("qx")%>">
<option value='0'>没有限制</option>
<option value='1'>只限会员</option>
<option value='2'>只限版主</option>
<option value='3'>需要积分</option>
<option value='4'>帮派会员</option>
</select><br/>
工作天数:<input name='gz<%=minute(now)%><%=second(now)%>' title='需要天数' format='*N' maxlength='10' value='<%=rs("gongzuo")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要魅力:<input name='ml<%=minute(now)%><%=second(now)%>' title='需要魅力' format='*N' maxlength='10' value='<%=rs("ml")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要体力:<input name='tl<%=minute(now)%><%=second(now)%>' title='需要体力' format='*N' maxlength='10' value='<%=rs("titi")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要金币:<input name='jb<%=minute(now)%><%=second(now)%>' title='需要金币' format='*N' maxlength='10' value='<%=rs("jin")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
论坛性质:<input name='jiazu<%=minute(now)%><%=second(now)%>' title='论坛性质' format='*N' maxlength='10' value='<%=rs("jiazu")%>' size='10' emptyok='false'/><b>0为公共论坛-帮派论坛请填写帮派ID</b><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='<%=rs("brr")%>'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='<%=rs("pid")%>' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='<%=rs("yc")%>'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>修改<go href='BBSBoard1.asp?Action=modifyok&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jrqx' value='$(jrqx<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ml' value='$(ml<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tl' value='$(tl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jb' value='$(jb<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jiazu' value='$(jiazu<%=minute(now)%><%=second(now)%>)'/>
<postfield name='gz' value='$(gz<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='lx' value='1'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>
<%
end if%>
<%
Response.Write"<br/>-----------<br/><a href='BBSBoard1.asp?ID="&rs("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br/>"
end if
rs.close
set rs=nothing


Elseif Action="modifyok" then
response.write("<card id='modify' title='编辑栏目'><p>")

id=request("id")
nam=usb(request("nam"))

idi=usb(request("idi"))

txt=usb(request("txt"))

jrqx=usb(request("jrqx"))

gz=usb(request("gz"))
ml=usb(request("ml"))
tl=usb(request("tl"))
jb=usb(request("jb"))
jiazu=usb(request("jiazu"))

yc=request("yc")
brr=request("brr")
lx=request("lx")
idi=request("idi")

if lx=1 then 
if nam="" then 
%>
		出错了:版快名称不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if

if lx=0 then 
if nam="" or txt="" then 
%>
		出错了:文本名称,内容不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if

if lx=2 then 
if nam="" or txt="" then 
%>
		出错了:连接名称,连接地址不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
dlname="错误！无此版块"
Else
if nam<>"" then rs("name")=nam
if txt<>"" then rs("shuo")=txt
if did<>"" then rs("did")=did
if idi<>"" then rs("pid")=idi
if jrqx<>"" then rs("qx")=jrqx
if gz<>"" then rs("gongzuo")=gz
if ml<>"" then rs("ml")=ml
if tl<>"" then rs("titi")=tl
if jb<>"" then rs("jin")=jb
if jiazu<>"" then rs("jiazu")=jiazu   
if brr<>"" then rs("brr")=brr
if yc<>"" then rs("yc")=yc
rs.update
'---关闭数据----


%>
		栏目成功编辑！<br/>
<%
Response.Write"-----------<br/><a href='BBSBoard1.asp?ID="&rs("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br/>"
rs.close
set rs=nothing


end if


Elseif Action="del" then
id=request("id")
response.write("<card id='del' title='删除栏目'><p>")

Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write"错误！无此栏目<br/>"
else

name=UBB(rss("name"))
formid=rss("formid")
response.write("栏目编号:"&rss("id")&"<br />")

if formid<>0 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&formid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此栏目"
Else
classnames=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
response.write("上级栏目:"&ubb(classnames)&"("&formid&")<a href='BBSBoard1.asp?Action=Manage&amp;ID="&formid&"&amp;adminmid="&request("adminmid")&"'>管理</a><br />")
end if
if rss("lx")=0 then 
response.write("文本名称:"&name&"<br />")
response.write("文本内容:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("brr")<>0 then
response.write("是否换行:是<br />")
Else
response.write("是否换行:否<br />")
end if
Elseif rss("lx")=2 then 
response.write("连接名称:"&name&"<br />")
response.write("连接地址:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("brr")<>0 then
response.write("是否换行:是<br />")
Else
response.write("是否换行:否<br />")
end if

Else
response.write("栏目名称:"&name&"<br />")
response.write("栏目说明:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if

if rss("brr")<>0 then
response.write("是否换行:是<br />")
Else
response.write("是否换行:否<br />")
end if

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1

if objgbrcs.eof then
response.write("贴子数量:无<br />")
Else
kyaa=objgbrcs.RecordCount
response.write("贴子数量:"&kyaa&"<br />")
end if
objgbrcs.close
Set objgbrcs= Nothing

if rss("qx")=1 then
response.write("进入限制:只限会员<br />")
Elseif rss("qx")=2 then
response.write("进入限制:只限斑竹<br />")
Elseif rss("qx")=3 then
response.write("进入限制:需要积分<br />")
response.write("工作天数:<b>"&rss("gongzuo")&"</b><br/>")
response.write("要求魅力:<b>"&rss("ml")&"</b><br/>")
response.write("要求体力:<b>"&rss("titi")&"</b><br/>")
response.write("要求金币:<b>"&rss("jin")&"</b><br/>")
Elseif rss("qx")=4 then
response.write("进入限制:帮派会员<br />")
Else
response.write("进入限制:没有限制<br />")
end if
response.write("版块点击:"&rss("rc")&"<br />")
response.write("创建时间:"&rss("times")&"<br />")

end if
response.write("----------<br/>")
response.write("您确认要删除当前栏目？<br />")
response.write("<a href='BBSBoard1.asp?Action=delok&amp;ID="&rss("id")&"&amp;adminmid="&request("adminmid")&"'>确认删除</a><br />")
response.write("<a href='BBSBoard1.asp?Action=Manage&amp;ID="&rss("id")&"&amp;adminmid="&request("adminmid")&"'>暂不删除</a><br />")
Response.Write"-----------<br/><a href='BBSBoard1.asp?ID="&rss("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回"&name&"</a><br/>"
Response.Write"<a href='BBSBoard1.asp?Action=main&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br/>"

end if
rss.close
Set rss= Nothing

Elseif Action="delok" then

id=request("id")
Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write("<card id='delok' title='错误提示'><p>")
response.write"错误！无此栏目<br/>-----------<br/>"
else
  sql="Delete FROM wuza WHERE itid="&id
  conn.execute(sql)

  sql="Delete FROM sclt1 WHERE id="&id
  conn.execute(sql)

response.write("<card id='delok' title='删除版快'><p>")
response.write"栏目删除成功！<br/>"
Response.Write"-----------<br/>"
Response.Write"<a href='BBSBoard1.asp?Action=main&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br/>"
end if
rss.close
Set rss= Nothing




Elseif Action="Move" then
id=request("id")
Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write("<card id='Move' title='错误提示'><p>")
response.write"错误！无此栏目<br/>-----------<br/>"
else
name=UBB(rss("name"))
formid=rss("formid")
response.write("<card id='Move' title='移动栏目'><p>")
response.write("栏目编号:"&rss("id")&"<br />")

if formid<>0 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&formid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此栏目"
Else
classnames=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
response.write("上级栏目:"&ubb(classnames)&"("&formid&")<a href='BBSBoard1.asp?Action=Manage&amp;ID="&formid&"&amp;adminmid="&request("adminmid")&"'>管理</a><br />")
Else
response.write("上级栏目:顶级栏目<br />")
end if

if rss("lx")=0 then 
response.write("文本名称:"&name&"<br />")
response.write("文本内容:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("brr")<>0 then
response.write("是否换行:是<br />")
Else
response.write("是否换行:否<br />")
end if
Elseif rss("lx")=2 then 
response.write("连接名称:"&name&"<br />")
response.write("连接地址:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if
if rss("brr")<>0 then
response.write("是否换行:是<br />")
Else
response.write("是否换行:否<br />")
end if

Else
response.write("栏目名称:"&name&"<br />")
response.write("栏目说明:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if

if rss("brr")<>0 then
response.write("是否换行:换行<br />")
Else
response.write("是否换行:不换行<br />")
end if

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1
if objgbrcs.eof then
response.write("贴子数量:无<br />")
Else
kyaa=objgbrcs.RecordCount
response.write("贴子数量:"&kyaa&"<br />")
end if
objgbrcs.close
Set objgbrcs= Nothing
response.write("栏目点击:"&rss("rc")&"<br />")
response.write("创建时间:"&rss("times")&"<br />")

end if
response.write("----------<br/>")
%>
栏目移动后，将成为目标栏目的一个子栏目
移动栏目，操作需要慎重。<br/>
目标栏目:<%
response.write "<select name='kyzc_id'><option>栏目列表</option>"
Response.write "<option value='0'>顶级栏目</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt1 order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>+|" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%>
<br/>
<anchor>转移
<go method="post" href='BBSBoard1.asp?Action=Moveok&amp;adminmid=<%=request("adminmid")%>'>
<postfield name="kyzc_id" value="$(kyzc_id)"/>
<%
Response.write "<postfield name='ID' value='" &ID & "'/>"
%>
</go>
</anchor><%
Response.write "<br/>-----------<br/><a href='BBSBoard1.asp?ID="&rss("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br/>"

end if
rss.close
set rss=nothing

Elseif Action="Moveok" then
id=request("id")
kyzc_id=request("kyzc_id")

Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write("<card id='Move' title='错误提示'><p>")
response.write"错误！无此栏目<br/>-----------<br/>"
else
Set rsss = Server.CreateObject("ADODB.Recordset")
sqlss = "SELECT * FROM sclt1 where id="&kyzc_id
rsss.open sqlss,conn,1,1
if rsss.eof then
response.write("<card id='Move' title='错误提示'><p>")
response.write"错误！无此目标栏目<br/>-----------<br/>"
else

if id=kyzc_id then
response.write("<card id='Move' title='错误提示'><p>")
response.write"非法操作<br/>-----------<br/>"
else

 sql="update sclt11 set formid='"&kyzc_id&"' Where CStr(Id)='" & id & "'"
 conn.execute(sql)

response.write("<card id='Move' title='移动栏目'><p>")
response.write"成功移动栏目<br/>"
Response.write "-----------<br/><a href='BBSBoard1.asp?ID="&rss("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br/>"
end if
end if
end if

Elseif Action="Merge" then
id=request("id")

Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write("<card id='Move' title='错误提示'><p>")
response.write"错误！无此栏目<br/>-----------<br/>"
else
name=UBB(rss("name"))
formid=rss("formid")

if rss("lx")=0 or rss("lx")=2 then 
response.write("<card id='Move' title='错误提示'><p>")
response.write"文本栏目与连接栏目不可以合并！<br/>-----------<br/>"
else

response.write("<card id='Move' title='合并栏目'><p>")
response.write("栏目编号:"&rss("id")&"<br />")

if formid<>0 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&formid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此栏目"
Else
classnames=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
response.write("上级栏目:"&ubb(classnames)&"("&formid&")<a href='BBSBoard1.asp?Action=Manage&amp;ID="&formid&"&amp;adminmid="&request("adminmid")&"'>管理</a><br />")
Else
response.write("上级栏目:顶级栏目<br />")
end if

response.write("栏目名称:"&name&"<br />")
response.write("栏目说明:"&ubb(rss("shuo"))&"<br />")
response.write("排列顺序:"&rss("pid")&"<br />")
if rss("yc")<>0 then
response.write("公开方式:隐藏<br />")
Else
response.write("公开方式:公开<br />")
end if

if rss("brr")<>0 then
response.write("是否换行:换行<br />")
Else
response.write("是否换行:不换行<br />")
end if

set objgbrcs=Server.CreateObject("ADODB.Recordset")
sscql="select * from wuza where itid='"& id &"' order by id DESC" 
objgbrcs.open sscql,conn,1,1
if objgbrcs.eof then
response.write("贴子数量:无<br />")
Else
kyaa=objgbrcs.RecordCount
response.write("贴子数量:"&kyaa&"<br />")
end if
objgbrcs.close
Set objgbrcs= Nothing
response.write("栏目点击:"&rss("rc")&"<br />")
response.write("创建时间:"&rss("times")&"<br />")
response.write("----------<br/>")
%>
栏目合并后，将成为并入目标栏目，无法还原
合并栏目，操作需要慎重。<br/>
目标栏目:<%
response.write "<select name='kyzc_id'><option>栏目列表</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt1 order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>+|" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%>
<br/>
<anchor>合并
<go method="post" href='BBSBoard1.asp?Action=Mergeok&amp;adminmid=<%=request("adminmid")%>'>
<postfield name="kyzc_id" value="$(kyzc_id)"/>
<%
Response.write "<postfield name='ID' value='" &ID & "'/>"
%>
</go>
</anchor><%
Response.write "<br/>-----------<br/><a href='BBSBoard1.asp?ID="&rss("ID")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回管理栏目</a><br/>"

end if

end if


rss.close
set rss=nothing

Elseif Action="Mergeok" then
id=request("id")
kyzc_id=request("kyzc_id")

Set rss = Server.CreateObject("ADODB.Recordset")
sqls = "SELECT * FROM sclt1 where id="&id
rss.open sqls,conn,1,1
if rss.eof then
response.write("<card id='Mergeok' title='错误提示'><p>")
response.write"错误！无此栏目<br/>-----------<br/>"
else

Set rsss = Server.CreateObject("ADODB.Recordset")
sqlss = "SELECT * FROM sclt1 where id="&kyzc_id
rsss.open sqlss,conn,1,1
if rsss.eof then
response.write("<card id='Mergeok' title='错误提示'><p>")
response.write"错误！无此目标栏目<br/>-----------<br/>"
else

if id=kyzc_id then
response.write("<card id='Move' title='错误提示'><p>")
response.write"非法操作<br/>-----------<br/>"
else

 sql="update wuza set itid='"&kyzc_id&"' Where CStr(itid)='" & id & "'"
 conn.execute(sql)

 sql="Delete FROM sclt1 Where CStr(Id)='" & id & "'"
 conn.execute(sql)

response.write("<card id='Mergeok' title='合并栏目'><p>")
response.write"成功合并栏目<br/>"
Response.write "-----------<br/><a href='BBSBoard1.asp?ID="&kyzc_id&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>返回目标栏目</a><br/>"
end if
end if
end if



Elseif Action="Add" then

kyzc=request("kyzc")
response.write("<card id='modify' title='添加栏目'><p>")

if kyzc="wb" then
%>
添加文本栏目<br/>-----------<br/>
上级栏目:<select name="ForumID<%=minute(now)%><%=second(now)%>"><option>栏目列表</option>
<%
Response.write "<option value='0'>顶级栏目</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt1 order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>+|" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%>
<br/>
文本名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='文本名称' value=''/><br/>
文本内容:<input name='txt<%=minute(now)%><%=second(now)%>' title='文本内容' value=''/><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='1'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='0'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>添加<go href='BBSBoard1.asp?Action=Addsave&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ForumID' value='$(ForumID<%=minute(now)%><%=second(now)%>)'/>
<postfield name='kyzc' value='<%=kyzc%>'/>
<postfield name='lx' value='0'/>
</go></anchor>
<%
Response.Write"<br/>-----------<br/><a href='BBSBoard1.asp?Action=Add&amp;adminmid="&request("adminmid")&"'>重新选择类型</a><br/>"
%>
<%
Elseif kyzc="link" then
%>
添加连接栏目<br/>-----------<br/>
上级栏目:<select name="ForumID<%=minute(now)%><%=second(now)%>"><option>栏目列表</option>
<%
Response.write "<option value='0'>顶级栏目</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt1 order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>+|" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%>
<br/>
连接名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='连接名称' value=''/><br/>
连接地址:<input name='txt<%=minute(now)%><%=second(now)%>' title='连接地址' value=''/><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='1'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='0'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>添加<go href='BBSBoard1.asp?Action=Addsave&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ForumID' value='$(ForumID<%=minute(now)%><%=second(now)%>)'/>
<postfield name='kyzc' value='<%=kyzc%>'/>
<postfield name='lx' value='2'/>
</go></anchor>
<%
Response.Write"<br/>-----------<br/><a href='BBSBoard1.asp?Action=Add&amp;adminmid="&request("adminmid")&"'>重新选择类型</a><br/>"
%>
<%
Elseif kyzc="bk" then
%>
上级栏目:<select name="ForumID<%=minute(now)%><%=second(now)%>"><option>栏目列表</option>
<%
Response.write "<option value='0'>顶级栏目</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt1 order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>+|" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%>
<br/>
版块名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='连接名称' value=''/><br/>
进入权限:<select name="jrqx<%=minute(now)%><%=second(now)%>" value="0">
<option value='0'>没有限制</option>
<option value='1'>只限会员</option>
<option value='2'>只限版主</option>
<option value='3'>需要积分</option>
<option value='4'>帮派会员</option>
</select><br/>
工作天数:<input name='gz<%=minute(now)%><%=second(now)%>' title='需要天数' format='*N' maxlength='10' value='0' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要魅力:<input name='ml<%=minute(now)%><%=second(now)%>' title='需要魅力' format='*N' maxlength='10' value='0' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要体力:<input name='tl<%=minute(now)%><%=second(now)%>' title='需要体力' format='*N' maxlength='10' value='0' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要金币:<input name='jb<%=minute(now)%><%=second(now)%>' title='需要金币' format='*N' maxlength='10' value='0' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
论坛性质:<input name='jiazu<%=minute(now)%><%=second(now)%>' title='论坛性质' format='*N' maxlength='10' value='0' size='10' emptyok='false'/><b>0为公共论坛-帮派论坛请填写帮派ID</b><br/>
是否换行:<select name='brr<%=minute(now)%><%=second(now)%>' value='1'>
<option value='1'>是</option>
<option value='0'>否</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='1' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='0'>
<option value='0'>公开</option>
<option value='1'>隐藏</option>
</select><br/>
<anchor>添加<go href='BBSBoard1.asp?Action=Addsave&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jrqx' value='$(jrqx<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ml' value='$(ml<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tl' value='$(tl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jb' value='$(jb<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jiazu' value='$(jiazu<%=minute(now)%><%=second(now)%>)'/>
<postfield name='gz' value='$(gz<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ForumID' value='$(ForumID<%=minute(now)%><%=second(now)%>)'/>
<postfield name='kyzc' value='<%=kyzc%>'/>
<postfield name='lx' value='1'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>
<%
Response.Write"<br/>-----------<br/><a href='BBSBoard1.asp?Action=Add&amp;adminmid="&request("adminmid")&"'>重新选择类型</a><br/>"
%>
<%
Else
%>
请选择添加项目类型<br/>-----------<br/>

<a href='BBSBoard1.asp?Action=Add&amp;adminmid=<%=request("adminmid")%>&amp;kyzc=link'>超级连接</a>:直接连接至某个地址<br/>
<a href='BBSBoard1.asp?Action=Add&amp;adminmid=<%=request("adminmid")%>&amp;kyzc=wb'>文本内容</a>:文本内容<br/>
<%
Response.Write"-----------<br/><a href='BBSBoard1.asp?Action=main&amp;adminmid="&request("adminmid")&"'>返回栏目管理</a><br/>"

end if

Elseif Action="Addsave" then
response.write("<card id='modify' title='添加版块'><p>")
kyzc=request("kyzc")
nam=usb(request("nam"))
idi=usb(request("idi"))
txt=usb(request("txt"))
jrqx=usb(request("jrqx"))
gz=usb(request("gz"))
ml=usb(request("ml"))
tl=usb(request("tl"))
jb=usb(request("jb"))
jiazu=usb(request("jiazu"))
ForumID=request("ForumID")
yc=request("yc")
brr=request("brr")
if brr="" then brr="0"
lx=request("lx")
if lx="" then lx="0"
if gz="" then gz="0"
if ml="" then ml="0"
if tl="" then tl="0"
if jb="" then jb="0"
if ftsj="" then ftsj="1"
if hfsj="" then hfsj="1"

'----识别错误并跳转-----

if lx=1 then 
if nam="" then 
%>
		出错了:栏目名称不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if


if lx=0 then 
if nam="" or txt="" then 
%>
		出错了:文本名称,内容不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if


if lx=2 then 
if nam="" or txt="" then 
%>
		出错了:连接名称,连接地址不能为空!<br/><br/>
请返回修改！
		</p>
	        </card>
</wml>
<%
  	response.end
end if
end if

'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 order by pid asc"
rs.open rspl,conn,1,2
rs.addnew
if nam<>"" then rs("name")=nam
if idi<>"" then rs("pid")=idi
if txt<>"" then rs("shuo")=txt
if ForumID<>"" then rs("formid")=ForumID
if jrqx<>"" then rs("qx")=jrqx
if gz<>"" then rs("gongzuo")=gz
if ml<>"" then rs("ml")=ml
if tl<>"" then rs("titi")=tl
if jb<>"" then rs("jin")=jb
if jiazu<>"" then rs("jiazu")=jiazu
if lx<>"" then rs("lx")=lx
if brr<>"" then rs("brr")=brr
if yc<>"" then rs("yc")=yc
rs.update
'---关闭数据----

Response.write "成功增加名为<a href='BBSBoard1.asp?ID="&rs("id")&"&amp;Action=Manage&amp;adminmid="&request("adminmid")&"'>"&nam&"</a>的栏目<br/>-----------<br/><a href='BBSBoard1.asp?Action=Add&amp;adminmid="&request("adminmid")&"&amp;Kyzc="&Kyzc&"'>返回继续添加</a><br/>"
rs.close
set rs=nothing
%>
<%
Elseif Action="BBSTopic" then
%>
<card id="main" title="管理帖子" >
<p>
<%
page=Request("page")
id=Request("id")
useid=Request("useid")
%>
<%
if id<>"" then
		sscql="select * from wuza where itid='"& id &"' order by id DESC" 
		set rs=server.createobject("adodb.recordset")
		rs.open sscql,conn,1,1
else
		if useid<>"" then 
		useids="where cstr(tjhm)="&useid&""
		end if
	sql="select * from wuza "&useids&" order by id desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
end if


if rs.eof and rs.bof then
	response.write "暂无贴子 <br/>-----------<br/>"
else
'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
管理帖子<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&rs("itid")
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此栏目"
Else
dlname=objgbrsy("name")
isdd=objgbrsy("id")
end if
objgbrsy.close
Set objgbrsy= Nothing%>
<%=(j+(page-1)*listnum)%>.[<a href="BBSBoard1.asp?ID=<%=isdd%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlname)%></a>]<a href="BBSBoard.asp?ID=<%=rs("id")%>&amp;Action=BBSTopicxx&amp;Cpage=<%=page%>&amp;adminmid=<%=request("adminmid")%>&amp;Uid=<%=id%>&amp;useid=<%=useid%>"><%=ubb(rs("biaoti"))%></a>[回<%=usb(rs("hfcont"))%>/阅<%=usb(rs("rc"))%>]<br/><%
'Response.write"(" & String(2-Len(Month(rs("retimes"))),"0") & Month(rs("retimes")) & "-" & String(2-len(Day(rs("retimes"))),"0") & Day(rs("retimes")) & " &nbsp;" & String(2-Len(hour(rs("retimes"))),"0") & hour(rs("retimes"))  & ":" & String(2-Len(minute(rs("retimes"))),"0") & minute(rs("retimes")) & ")<br/>"
%>
<%rs.movenext 
j=j+1 
loop%>

<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="BBSBoard1.asp?Action=BBSTopic&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>&amp;useid=<%=useid%>">首页</a>
      <a href="BBSBoard1.asp?Action=BBSTopic&amp;Page=<%=page-1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>&amp;useid=<%=useid%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="BBSBoard1.asp?Action=BBSTopic&amp;Page=<%=page+1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>&amp;useid=<%=useid%>"><b>[<%=page+1%>]</b></a>
      <a href="BBSBoard1.asp?Action=BBSTopic&amp;page=<%=rs.pagecount%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>&amp;useid=<%=useid%>">尾页</a>
	  <%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name="useid" title="筛选" size="12" value=""/><br/>
<anchor>筛选
    <go href="BBSBoard1.asp?Action=BBSTopic&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>" method="post" accept-charset="utf-8">
        <postfield name="useid" value="$(useid)"/>
	</go>
</anchor>
<% if useid <> ""  then %>
&nbsp;&nbsp;<a href="BBSBoard.asp?Action=BBSTopic&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=id%>">返回</a>
<%end if%>
<br/>
------------<br/>
<% if id <> ""  then %>
<a href="BBSBoard1.asp?ID=<%=id%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>">返回管理栏目</a><br/>
<%end if%>

<%

rs.close
Set rs= Nothing

Elseif Action="BBSTopicxx" then
%>
<card id="main" title="管理帖子" >
<p>
<%
id=request("id")
cz=request("cz")
useid=request("useid")
uid=request("uid")
usid=request("usid")
Cpage=request("Cpage")
if cpage = "" or cpage < 1 then
cpage = 1
end if

page=request("page")
if page="" then page="1"

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该帖子!")
else

if cz="1" then
sql="update wuza set jh='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="2" then

sql="update wuza set jh='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="3" then

sql="update wuza set bntjyy1='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="4" then

sql="update wuza set bntjyy1='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="5" then

sql="update wuza set times='2100-10-10 12:12:12' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="6" then

zdtime=now()
sql="update wuza set times='"& zdtime & "' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="7" then

sql="update wuza set times='2000-10-10 12:12:12' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="8" then

zdtime=now()
sql="update wuza set times='"& zdtime & "' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="9" then

sql="update wuza set tj='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="10" then

sql="update wuza set tj='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="11" then

sql="update wuza set hd='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="12" then

sql="update wuza set hd='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="13" then

sql="update wuza set bntj='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="14" then

sql="update wuza set bntj='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="15" then

sql="update wuza set a='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="16" then

sql="update wuza set a='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

elseif cz="dels" then%>
帖子删除后不可恢复!您确定要删除吗?<br/>
<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=delok">确定</a><br/><a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>">取消</a>
		</p>
	        </card>
</wml>
<%
  	response.end

elseif cz="delok" then%>
<%

sql="delete from wuza Where CStr(id)='" & id & "'"
  conn.Execute(sql)
sql="update from usereg set usejf=usejf-100,ml=ml-5,titi=titi-5,ticont=ticont-1 Where CStr(id)='" & USid & "'"
  conn.Execute(sql)
sql="delete from lthf Where CStr(id)='" & id & "'"
  conn.Execute(sql)

%>
<%

elseif cz="delsy" then%>
帖子删除后不可恢复!您确定要删除ID<%=USid%>的所有帖子吗?<br/>
<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=delsyok">确定</a><br/><a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>">取消</a>
		</p>
	        </card>
</wml>
<%

  	response.end
elseif cz="delsyok" then

sql="delete from wuza Where CStr(tjhm)='" & USid & "'"
  conn.Execute(sql)
sql="update from usereg set ticont=0 Where CStr(id)='" & USid & "'"
  conn.Execute(sql)


elseif cz="88" then

%>
加黑作者！<br/>
您确定要将ID<%=USid%>列入黑名单吗?列入黑名单后不可以进入社区!<br/>

<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=6688">确定</a><br/><a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>">取消</a>
		</p>
	        </card>
</wml>
<%

response.end
elseif cz="6688" then
sql="update usereg set ftsdbz='t',lysdbz='t' where cstr(id)="&USid
  conn.Execute(sql)
end if


if rs("jh")="t" then yxxe_net1="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=1&amp;USid="&rs("tjhm")&"'>去精</a>"
if rs("jh")="f" then yxxe_net1="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=2&amp;USid="&rs("tjhm")&"'>加精</a>"

if rs("bntjyy1")="t" then yxxe_net2="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=3&amp;USid="&rs("tjhm")&"'>解除</a>"
if rs("bntjyy1")="f" then yxxe_net2="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=4&amp;USid="&rs("tjhm")&"'>锁定</a>"

if rs("times")<>"2100-10-10 12:12:12" then yxxe_net3="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=5&amp;USid="&rs("tjhm")&"'>置顶</a>"
if rs("times")="2100-10-10 12:12:12" then yxxe_net3="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=6&amp;USid="&rs("tjhm")&"'>解除</a>"

if rs("times")<>"2000-10-10 12:12:12" then yxxe_net4="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=7&amp;USid="&rs("tjhm")&"'>固底</a>"
if rs("times")="2000-10-10 12:12:12" then yxxe_net4="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=8&amp;USid="&rs("tjhm")&"'>解除</a>"

if rs("tj")="f" then yxxe_net5="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=9&amp;USid="&rs("tjhm")&"'>推荐</a>"
if rs("tj")="t" then yxxe_net5="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=10&amp;USid="&rs("tjhm")&"'>解除</a>"

if rs("hd")="f" then yxxe_net6="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=11&amp;USid="&rs("tjhm")&"'>活动</a>"
if rs("hd")="t" then yxxe_net6="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=12&amp;USid="&rs("tjhm")&"'>解除</a>"

if rs("bntj")="f" then yxxe_net7="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=13&amp;USid="&rs("tjhm")&"'>名帖</a>"
if rs("bntj")="t" then yxxe_net7="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=14&amp;USid="&rs("tjhm")&"'>解除</a>"

if rs("a")="f" then yxxe_net8="<b>否</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=15&amp;USid="&rs("tjhm")&"'>强帖</a>"
if rs("a")="t" then yxxe_net8="<b>是</b>|<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;Page=" & Page & "&amp;CPage=" & CPage & "&amp;adminmid=" & request("adminmid") & "&amp;id="&id&"&amp;Uid="&Uid&"&amp;Useid="&Useid&"&amp;cz=16&amp;USid="&rs("tjhm")&"'>解除</a>"


dim PageCount,moy
moy=request("moy")

    set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("/bbs/forum_content/File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
    aaacc=f.ReadAll
    loop
    f.close
    set f=nothing
    set fso=nothing

	page = Request("page")
	IF Not IsEmpty(page) Then
		IF Not IsNumeric(page) Then		
			page=1
		Else
			page=Cint(page)
		End IF
	Else
		page = 1
	End IF

if moy="123" then
pagesize=80000
else
pagesize=500
End IF

Contents=aaacc
	StartWords = 1
Lengths=len(Contents)

%>
<b>主题:</b><u><%=ubb(rs("biaoti"))%></u><br/>--------------<br/>

<%=converttowide(UBBCodes(outstr(aaacc,page)))%><br/>--------------<br/>
<%
    		if page>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		else
		Response.Write "<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;ID="&id&"&amp;CPage=" & cpage & "&amp;Useid=" & Useid & "&amp;Uid=" & Uid & "&amp;Page=" & page+1 & "&amp;adminmid="&request("adminmid")&"'>下页</a>"
		end if

    		if page<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else    
       		Response.Write "<a href='BBSBoard1.asp?Action=BBSTopicxx&amp;ID="&id&"&amp;CPage=" & cpage & "&amp;Useid=" & Useid & "&amp;Uid=" & Uid & "&amp;Page=" & page-1 & "&amp;adminmid="&request("adminmid")&"'>上页</a>"
   		end if

		if PageCount<=1 then
		'Response.Write("--------------<br/>")
   		else%>
		(<%=page%>/<%=PageCount%>/<%=Lengths%>)<br/>
	         <%end if%>

		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if page>=PageCount then response.write(page-1) else response.write(page+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		<go href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
		<postfield name="Page" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		</go>
		</anchor><br/>--------------<br/>
                <%end if%>

贴子编号:<%=usb(rs("id"))%><br/>
<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&rs("itid")
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
idddd=objgbrsy("id")
end if
objgbrsy.close
Set objgbrsy= Nothing

set objgbrsys=Server.CreateObject("ADODB.Recordset")
rspls="select * from usereg where id="&rs("tjhm")
objgbrsys.open rspls,conn,1,2
if objgbrsys.eof then 
dlme="无此会员"
Else
dlme=objgbrsys("usename")
end if
objgbrsys.close

%>
所属版面:<a href="BBSBoard1.asp?ID=<%=idddd%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>"><%=uBB(dlname)%></a><br/>
贴子作者:<a href="kyzc_Usegl.asp?Action=View&amp;id=<%=rs("tjhm")%>&amp;adminmid=<%=request("adminmid")%>"><%=uBb(dlme)%></a>(<%=uBb(rs("tjhm"))%>)<br/>
创建时间:<%=usb(rs("retimes"))%><br/>
回复数量:<a href="BBSBoard1.asp?Action=BBSReply&amp;WzID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>"><%=rs("hfcont")%></a><br/>
点击数量:<%=usb(rs("rc"))%><br/>

----------<br/>
是否置顶:<%=yxxe_net3%><br/>
是否精华:<%=yxxe_net1%><br/>
是否锁定:<%=yxxe_net2%><br/>
是否固顶:<%=yxxe_net4%><br/>
是否推荐:<%=yxxe_net5%><br/>
是否活动:<%=yxxe_net6%><br/>
是否名帖:<%=yxxe_net7%><br/>
是否强帖:<%=yxxe_net8%><br/>
----------<br/>

<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=88">加黑作者</a>◆<a href="BBSBoard1.asp?Action=BBSReply&amp;WzID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>">回复管理</a><br/>
<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=dels">删除贴子</a>◆<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;ID=<%=ID%>&amp;CPage=<%=CPage%>&amp;Useid=<%=Useid%>&amp;Uid=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>&amp;USid=<%=rs("tjhm")%>&amp;Cz=delsy">清空帖子</a>
<%

end if

rs.close
set rs=nothing

%>
<br/>----------<br/>
<a href="BBSBoard1.asp?Action=BBSTopic&amp;Page=<%=CPage%>&amp;Useid=<%=Useid%>&amp;ID=<%=Uid%>&amp;adminmid=<%=request("adminmid")%>">返回帖子管理</a><br/>


<%
Elseif Action="BBSReply" then
%>
<card id="main" title="管理回复" >
<p>
<%
page=Request("page")
cpage=Request("cpage")
wzid=Request("wzid")
useid=Request("useid")
kyzcc=Request("kyzcc")
idy=Request("idy")
tjhm=Request("tjhm")
ids=Request("ids")
if cpage = "" or cpage < 1 then
cpage = 1
end if

if kyzcc="delok" then
if ids<>"" and tjhm<>"" and idy<>"" then
ids=Request("ids")
sql="delete from lthf Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="update from usereg set usejf=usejf-10,ml=ml-1,titi=titi-1 Where CStr(id)='" & tjhm & "'"
  conn.Execute(sql)
sql="update from wuza set rc=rc-1 Where CStr(id)='" & idy & "'"
  conn.Execute(sql)
response.write "成功删除回复！ <br/>---------<br/>"
else
response.write "*删除回复ID错误！ <br/>---------<br/>"
end if
end if

if wzid<>"" then
		sscql="select * from lthf where id='"& wzid &"' order by ids DESC" 
		set rs=server.createobject("adodb.recordset")
		rs.open sscql,conn,1,1
else
		if useid<>"" then 
		useids="where cstr(tjhm)="&useid&""
		end if
	sql="select * from lthf "&useids&" order by ids desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
end if


if rs.eof and rs.bof then
	response.write "暂无回复 <br/>-----------<br/>"
else
'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
管理回复<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&rs("id")
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="没有该帖"
else
dlname=objgbrsy("biaoti")
end if
objgbrsy.close
Set objgbrsy= Nothing%>
<%
set okrss=Server.CreateObject("ADODB.Recordset")
rsplg="select * from usereg where id="&rs("tjhm")
okrss.open rsplg,conn,1,2
if okrss.eof then 
usename="没有该会员"
else
usename=okrss("usename")
end if
okrss.close
Set okrss= Nothing%>
<%=(j+(page-1)*listnum)%>.<a href="kyzc_Usegl.asp?Action=View&amp;id=<%=rs("tjhm")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(usename)%></a>回复<a href="BBSBoard.asp?ID=<%=rs("id")%>&amp;Action=BBSTopicxx&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlname)%></a>内容:<%=ubb(rs("name"))%><a href="BBSBoard.asp?IDy=<%=rs("id")%>&amp;IDs=<%=rs("ids")%>&amp;tjhm=<%=rs("tjhm")%>&amp;WzID=<%=WzID%>&amp;useid=<%=useid%>&amp;Page=<%=Page%>&amp;CPage=<%=CPage%>&amp;Action=BBSReply&amp;adminmid=<%=request("adminmid")%>&amp;kyzcc=delok">删除</a><%
Response.write"(" & String(2-Len(Month(rs("times"))),"0") & Month(rs("times")) & "-" & String(2-len(Day(rs("times"))),"0") & Day(rs("times")) & " &nbsp;" & String(2-Len(hour(rs("times"))),"0") & hour(rs("times"))  & ":" & String(2-Len(minute(rs("times"))),"0") & minute(rs("times")) & ")<br/>"
%>
<%rs.movenext 
j=j+1 
loop%>

<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="BBSBoard1.asp?Action=BBSReply&amp;adminmid=<%=request("adminmid")%>&amp;WzID=<%=WzID%>&amp;Cpage=<%=Cpage%>&amp;useid=<%=useid%>">首页</a>
      <a href="BBSBoard1.asp?Action=BBSReply&amp;Page=<%=page-1%>&amp;adminmid=<%=request("adminmid")%>&amp;Cpage=<%=Cpage%>&amp;WzID=<%=WzID%>&amp;useid=<%=useid%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="BBSBoard1.asp?Action=BBSReply&amp;Page=<%=page+1%>&amp;adminmid=<%=request("adminmid")%>&amp;Cpage=<%=Cpage%>&amp;WzID=<%=WzID%>&amp;useid=<%=useid%>"><b>[<%=page+1%>]</b></a>
      <a href="BBSBoard1.asp?Action=BBSReply&amp;page=<%=rs.pagecount%>&amp;adminmid=<%=request("adminmid")%>&amp;Cpage=<%=Cpage%>&amp;WzID=<%=WzID%>&amp;useid=<%=useid%>">尾页</a>
	  <%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name="useid" title="筛选" size="12" value=""/><br/>
<anchor>筛选
    <go href="BBSBoard1.asp?Action=BBSReply&amp;adminmid=<%=request("adminmid")%>&amp;Cpage=<%=Cpage%>&amp;WzID=<%=WzID%>" method="post" accept-charset="utf-8">
        <postfield name="useid" value="$(useid)"/>
	</go>
</anchor>
<% if useid <> "" or wzid<>"" then %>
&nbsp;&nbsp;<a href="BBSBoard1.asp?Action=BBSReply&amp;adminmid=<%=request("adminmid")%>">全部回复</a>
<%end if%>
<br/>
------------<br/>
<% if wzid<>"" then %>
<a href="BBSBoard1.asp?Action=BBSTopicxx&amp;Useid=<%=Useid%>&amp;Cpage=<%=Cpage%>&amp;ID=<%=wzid%>&amp;adminmid=<%=request("adminmid")%>">返回管理帖子</a><br/>

<%
end if
end if

Elseif Action="BBSLog" then
%>
<card id="main" title="管理日志" >
<p>
<%
page=Request("page")
id=Request("id")

useid=Request("useid")
pid=Request("pid")
kyzcc=Request("kyzcc")
if cpage = "" or cpage < 1 then
cpage = 1
end if

if kyzcc="delok" then
if pid<>""  then
sql="delete from czrj Where CStr(id)='" & pid & "'"
  conn.Execute(sql)
response.write "成功删除日志！ <br/>---------<br/>"
else
response.write "*删除日志ID错误！ <br/>---------<br/>"
end if
end if


if id<>"" then
		sscql="select * from czrj where ltid="& id &" order by id DESC" 
		set rs=server.createobject("adodb.recordset")
		rs.open sscql,conn,1,1
else
		if useid<>"" then 
		useids="where cstr(ids)="&useid&""
		end if
	sql="select * from czrj "&useids&" order by id desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
end if


if rs.eof and rs.bof then
	response.write "暂无日志 <br/>-----------<br/>"
else
'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
管理日志<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt1 where id="&rs("ltid")
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此栏目"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing%>
<%
set okrss=Server.CreateObject("ADODB.Recordset")
rsplg="select * from usereg where id="&rs("ids")
okrss.open rsplg,conn,1,2
if okrss.eof then 
usename="没有该会员"
else
usename=okrss("usename")
end if
okrss.close
Set okrss= Nothing%>

<%=(j+(page-1)*listnum)%>.<a href="kyzc_Usegl.asp?Action=View&amp;id=<%=rs("ids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(usename)%></a>在<a href="BBSBoard.asp?ID=<%=rs("ltid")%>&amp;Action=Manage&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlname)%></a>将帖子<a href="BBSBoard.asp?Action=BBSTopicxx&amp;ID=<%=rs("wzid")%>&amp;adminmid=<%=request("adminmid")%>">[<%=ubb(rs("tzmc"))%>]</a>:<%=ubb(rs("czxx"))%><a href="BBSBoard.asp?PID=<%=rs("id")%>&amp;ID=<%=ID%>&amp;Page=<%=Page%>&amp;Action=BBSLog&amp;useid=<%=useid%>&amp;adminmid=<%=request("adminmid")%>&amp;kyzcc=delok">删除</a><%
Response.write"(" & String(2-Len(Month(rs("tm"))),"0") & Month(rs("tm")) & "-" & String(2-len(Day(rs("tm"))),"0") & Day(rs("tm")) & " &nbsp;" & String(2-Len(hour(rs("tm"))),"0") & hour(rs("tm"))  & ":" & String(2-Len(minute(rs("tm"))),"0") & minute(rs("tm")) & ")<br/>"
%>
<%rs.movenext 
j=j+1 
loop%>

<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="BBSBoard1.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>">首页</a>
      <a href="BBSBoard1.asp?Action=BBSLog&amp;Page=<%=page-1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="BBSBoard1.asp?Action=BBSLog&amp;Page=<%=page+1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>"><b>[<%=page+1%>]</b></a>
      <a href="BBSBoard1.asp?Action=BBSLog&amp;page=<%=rs.pagecount%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>">尾页</a>
	  <%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name="useid" title="筛选" size="12" value=""/><br/>
<anchor>筛选
    <go href="BBSBoard1.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>" method="post" accept-charset="utf-8">
        <postfield name="useid" value="$(useid)"/>
	</go>
</anchor>
<% if useid <> "" or wzid<>"" then %>
&nbsp;&nbsp;<a href="BBSBoard1.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>">全部回复</a>
<%end if%>
<br/>
------------<br/>
<% if id<>"" then %>
<a href="BBSBoard1.asp?Action=Manage&amp;ID=<%=id%>&amp;adminmid=<%=request("adminmid")%>">返回管理栏目</a><br/>
<%
end if
end if




Else
response.write("<card id='modify' title='系统提示'><p>")

response.write("请勿提交非法参数！<br/>------------<br/>")
end if

%>

<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p></card></wml>

<%
Conn.close
set Conn=nothing

Function outstr(str,page)	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(page-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if

	outstr=str
end Function%>