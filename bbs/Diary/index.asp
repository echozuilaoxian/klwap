<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="YxxE_Net.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim kyzc
  kyzc=request.querystring("kyzc")

gk="f"

  if kyzc="" then kyzc="main"
if kyzc="main" then
%>
<card id="main" title="心情日记" >
<p>
<img src='logo.gif' alt='load...'/><br/>

<%
response.write"<a href='/BBS/Diary/Index.Asp?kyzc=add&amp;SessionID="&SessionID&"'>书写日记</a>|<a href='/BBS/Diary/Index.Asp?kyzc=feilei&amp;SessionID="&SessionID&"'>日记分类</a><br/>"

page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1

end if
if ns="" or ns<=0 then
ns=10
end if

ky=request.querystring("ky")
if ky="" or ky>8 or ky<1 then
	ky=1
  end if

  select case ky

  case 1
  wheretmp=" where zffk='"&gk&"'"
  desc=" id desc"
  tip="最新"
  kyaa="rc"
  StrFont="最新|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 2
  wheretmp=" where cstr(ids)="&iduse&" "
  desc=" id desc"
  tip="我的"
  kyaa="rc"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|我的|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 3
  wheretmp=" where zffk='"&gk&"' and zf>0"
  desc=" zf desc"
  tip="获得鲜花的"
  kyaa="zf"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|鲜花|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 4
  wheretmp=" where zffk='"&gk&"' and tao>0"
  desc=" tao desc"
  tip="被扔蛋的"
  kyaa="tao"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|扔蛋<br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 5
  wheretmp=" where zffk='"&gk&"' and huifu>0"
  desc=" huifu desc"
  tip="有评论的"
  kyaa="huifu"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/>评论|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 6
  wheretmp=" where zffk='"&gk&"' and rc>0"
  desc=" rc desc"
  tip="被关注的"
  kyaa="rc"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|最热|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"
  case 7
  wheretmp=" where zffk='"&gk&"'"
  desc=" id asc"
  tip="本站"
  kyaa="rc"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|最早|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=8&amp;SessionID="&SessionID&"'>最冷</a><br/>"

  case 8
  wheretmp=" where zffk='"&gk&"' and rc=0"
  desc=" rc asc"
  tip="没被看过的"
  kyaa="rc"
  StrFont="<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=1&amp;SessionID="&SessionID&"'>最新</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=3&amp;SessionID="&SessionID&"'>鲜花</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=4&amp;SessionID="&SessionID&"'>扔蛋</a><br/><a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=5&amp;SessionID="&SessionID&"'>评论</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=6&amp;SessionID="&SessionID&"'>最热</a>|<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=7&amp;SessionID="&SessionID&"'>最早</a>|最冷<br/>"
  end select

if page=1 then
response.write StrFont
end if


  set rsaa=Server.CreateObject("ADODB.Recordset")
qssaa="select * from yxxe "&wheretmp&" order by "&desc&""
  rsaa.open qssaa,myc,1,2
a=rsaa.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("--------------<br/>"&tip&"日记暂无记录<br/>")
end if

if a>0 then
response.write(""&tip&"日记共"&a&"条记录<br/>")
end if

if a>0 then
rsaa.Move((page-1)*ns)
dim k
k=1
do while ((not rsaa.eof) and k<=ns)

Content=left(rsaa("biaoti"),8)
if len(rsaa("biaoti"))>8 then
Content=Content+"..."
End if

'set rsxx=Server.CreateObject("ADODB.Recordset")
'qssxx="select * from WisH where classid="&rsaa("classid")
'rsxx.open qssxx,myc,1,2
'if rsxx.eof then
'aaa="ID错误"
'else
'Contentf=left(rsxx("biaoti"),2)
'End if
'rsxx.close
'set rsxx=nothing

if rsaa("zffk")<>gk then
zfgk="(私)"
else
zfgk=""
End if

%>
<%=zfgk%><anchor><%=(k+(page-1)*ns)%>.<%=ubb(Content)%>
		<go href="/BBS/Diary/Index.Asp?kyzc=view&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsaa("id")%>" />
		<postfield name="fid" value="<%=rsaa("classid")%>" />
		<postfield name="page" value="<%=page%>" />
		</go>
		</anchor>(<%=rsaa(""&kyaa&"")%>)
<br/>
<%
			k = k + 1
rsaa.movenext 
loop

end if

if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;ky=" & ky & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;ky=" & ky & "&amp;page="&page-1&"'>上页</a>&nbsp;")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Diary/Index.Asp?SessionID=<%=SessionID%>&amp;kyzc=<%=kyzc%>&amp;ky=<%=ky%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>



                <%end if


rsaa.close
set rsaa=nothing

response.write("--------------<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/>")

Elseif kyzc="feilei"  then
%>
<card id="feilei" title="日记分类" >
<p>
<a href='/BBS/Diary/Index.Asp?kyzc=add&amp;SessionID=<%=SessionID%>'>书写日记</a><br/>
  <%


  set rsg=Server.CreateObject("ADODB.Recordset")
     qsss="select * from WisH order by id asc"
  rsg.open qsss,myc,1,1
page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

a=rsg.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("暂无记录<br/>")
end if

if a>0 then
response.write("--------------<br/>")
end if

if a>0 then
rsg.Move((page-1)*ns)
dim j
j=1
do while ((not rsg.eof) and j<=ns)
%>
<anchor><%=ubb(rsg("biaoti"))%>
		<go href="/BBS/Diary/Index.Asp?kyzc=xiang&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsg("classid")%>" />
		<postfield name="biaoti" value="<%=ubb(rsg("biaoti"))%>" />
		</go>
		</anchor>
<%
if Session("useid")="1" then
response.write("|<a href='/BBS/Diary/Index.Asp?id="&rsg("id")&"&amp;kyzc=save&amp;SessionID="&SessionID&"&amp;page="&page&"'><small>编辑</small></a>|<a href='/BBS/Diary/Index.Asp?id="&rsg("id")&"&amp;kyzc=del&amp;SessionID="&SessionID&"&amp;page="&page&"'><small>删除</small></a>")
end if%>
<br/>
<%
			j = j + 1
rsg.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Diary/Index.Asp?SessionID=<%=SessionID%>&amp;kyzc=<%=kyzc%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%

end if

rsg.close
set rsg=nothing


response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="savewz"  then

page=request("page")
idssx=request("ID")
fID=request("fID")
set rsit=Server.CreateObject("ADODB.Recordset")
  qsset="select * from yxxe where id="&idssx&" and cstr(ids)="&iduse
  rsit.open qsset,myc,1,2
if rsit.eof then 
response.write("<card id='main' title='错误了'><p>抱歉！非日记主人不能编辑<br/>")
else
%>
<card id="main" title="修改日记-<%=ubb(rsit("biaoti"))%>" >
<p>
修改日记:<%=ubb(rsit("biaoti"))%><br/>

选择类别:<%
sql = "SELECT * FROM wish" 
Set objgbrs = Server.CreateObject("ADODB.Recordset")
objgbrs.OPEN sql,myc,1,2
if objgbrs.eof and objgbrs.bof then
Response.Write"<option>暂无分类</option>"
else
%><select name="fenlei<%=minute(now)%><%=second(now)%>" value="<%=ubb(rsit("classid"))%>">
<%
do while not objgbrs.eof
Response.Write"<option value='"&objgbrs("classid")&"'>"&objgbrs("biaoti")&"</option>"
objgbrs.movenext
loop
end if
objgbrs.close
set objgbrs=nothing
%></select><br/>
日记标题:<input type="text" name="biaoti<%=minute(now)%><%=second(now)%>" title="输入标题" value="<%=ubb(rsit("biaoti"))%>" maxlength="50"/><br/><%
Set oa=CreateObject("adodb.stream")
oa.type=2
oa.Mode=3
oa.OPen
oa.LoadfromFile(server.mappath("Data\"&idssx&".txt"))
oa.position=0
Contents=oa.ReadText
oa.close()
Set oa=nothing
%>
日记内容:<input type="text" name="kyzc<%=minute(now)%><%=second(now)%>" title="输入内容" value="<%=ubb(Contents)%>" maxlength="10000"/><br/>
是否公开:<select name='zfgk<%=minute(now)%><%=second(now)%>' value="<%=ubb(rsit("zffk"))%>">
<option value='f'>是</option>
<option value='t'>否</option>
</select><br/>
<anchor>确认提交
		<go href="/BBS/Diary/Index.Asp?kyzc=savewzcl&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="biaoti" value="$(biaoti<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="fenlei" value="$(fenlei<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="kyzcss" value="$(kyzc<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="zffk" value="$(zfgk<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="id" value="<%=ubb(rsit("id"))%>"/>
		</go>
		</anchor><br/>
<% end if%>

--------------<br/>
<anchor>返回查看文章
		<go href="/BBS/Diary/Index.Asp?kyzc=view&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=idssx%>" />
		<postfield name="fid" value="<%=fID%>" />
		<postfield name="page" value="1" />
		</go>
		</anchor>
<%
response.write("<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")

rsit.close
set rsit=nothing

Elseif kyzc="savewzcl"  then
%>
<card id="main" title="修改日记" >
<p>
<%
fenlei=usb(request("fenlei"))
zffk=usb(request("zffk"))
kyzcss=usb(request("kyzcss"))
biaoti=usb(request("biaoti"))
idsst=request("id")
fid=request("fid")

  set rsut=Server.CreateObject("ADODB.Recordset")
     qssut="select * from yxxe where id="&idsst&" and cstr(ids)="&iduse
  rsut.open qssut,myc,1,2
if rsut.eof then 
response.write("ID错误!<br/>")
elseif kyzcss="" or biaoti=""  then 
response.write("各项不能为空.........!<br/>")
else
rsut("classid")=fenlei
rsut("zffk")=zffk
rsut("biaoti")=biaoti
rsut.update
Set oa=CreateObject("adodb.stream")
oa.type=2
oa.mode=3
oa.open
oa.writetext(kyzcss)
oa.position=0
oa.type=1
oa.position=0
oa.savetofile server.mappath(".\Data\"&idsst&".txt"),2
oa.Close
Set oa=nothing
%>
成功编辑名为<u>[<%=biaoti%>]</u>的文章<br/>
<%end if%>
--------------<br/>
<anchor>返回查看文章
		<go href="/BBS/Diary/Index.Asp?kyzc=view&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsut("id")%>" />
		<postfield name="fid" value="<%=rsut("classid")%>" />
		<postfield name="page" value="1" />
		</go>
		</anchor>
<%
response.write("<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")

'---关闭数据----
rsut.close
set rsut=nothing

Elseif kyzc="save"  then

page=request("page")
idsss=request("id")
  set rsxd=Server.CreateObject("ADODB.Recordset")
     qssxd="select * from WisH where id="&idsss
  rsxd.open qssxd,myc,1,2
if rsxd.eof then 
response.write("<card id='main' title='ID错误'><p>ID错误!<br/>")
else
%>
<card id="main" title="修改栏目-<%=ubb(rsxd("biaoti"))%>" >
<p>
修改栏目:<%=ubb(rsxd("biaoti"))%><br/>
栏目名称:<input type="text" name="biaoti<%=minute(now)%><%=second(now)%>" title="输入标题" value="<%=ubb(rsxd("biaoti"))%>" maxlength="50"/><br/>
栏目简介:<input type="text" name="kyzc<%=minute(now)%><%=second(now)%>" title="输入内容" value="<%=ubb(rsxd("kyzc"))%>" maxlength="10000"/><br/>
<anchor>确认提交
		<go href="/BBS/Diary/Index.Asp?kyzc=savecl&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="biaoti" value="$(biaoti<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="kyzcy" value="$(kyzc<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="id" value="<%=ubb(rsxd("id"))%>"/>
		</go>
		</anchor><br/>
<%
end if

response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="savecl"  then
%>
<card id="main" title="修改栏目" >
<p>
<%
kyzcy=usb(request("kyzcy"))
biaoti=usb(request("biaoti"))
ids=request("id")
  set rsxr=Server.CreateObject("ADODB.Recordset")
     qssxr="select * from WisH where id="&ids
  rsxr.open qssxr,myc,1,2
if rsxr.eof then 
response.write("ID错误!<br/>")
elseif kyzcy="" or biaoti=""  then 
response.write("各项不能为空.........!<br/>")
elseif Session("Counter")<>"pass_numbers_55556666" then
response.write("系统不能识别你的身份.........!<br/>")
else
rsxr("biaoti")=biaoti
rsxr("kyzc")=kyzcy
rsxr.update
'---关闭数据----
rsxr.close
set rsxr=nothing
%>
成功编辑名为<u>[<%=biaoti%>]</u>的栏目<br/>
<%end if%>
<%

response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="xiang"  then
page=request("page")
idsss=request("id")
  set rsx=Server.CreateObject("ADODB.Recordset")
     qssx="select * from WisH where classid="&idsss
  rsx.open qssx,myc,1,2
if rsx.eof then 
response.write("<card id='main' title='ID错误'><p>ID错误!<br/>")
else
%>
<card id="main" title="<%=ubb(rsx("biaoti"))%>" >
<p>
<%

  set rse=Server.CreateObject("ADODB.Recordset")
     qsse="select * from yxxe where classid="&idsss&" and zffk='"&gk&"' order by id desc"
  rse.open qsse,myc,1,2
page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

a=rse.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("暂无"&ubb(rsx("biaoti"))&"记录<br/>")
end if

if a>0 then
response.write(""&ubb(rsx("biaoti"))&"-共"&a&"条记录<br/>")
end if

if a>0 then
rse.Move((page-1)*ns)
dim y
y=1
do while ((not rse.eof) and y<=ns)

Content=left(rse("biaoti"),8)
if len(rse("biaoti"))>8 then
Content=Content+"..."
End if

%>
<anchor><%=(y+(page-1)*ns)%>.<%=ubb(Content)%>
		<go href="/BBS/Diary/Index.Asp?kyzc=view&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rse("id")%>" />
		<postfield name="fid" value="<%=idsss%>" />
		<postfield name="page" value="<%=page%>" />
		</go>
		</anchor>(<%=rse("rc")%>/<%=rse("huifu")%>)
<br/>
<%

			y = y + 1
rse.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;ID=" & request("id") & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/Diary/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;ID=" & request("id") & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Diary/Index.Asp?SessionID=<%=SessionID%>&amp;kyzc=<%=kyzc%>&amp;ID=<%=request("id")%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if


end if
rsx.close
set rsx=nothing

rse.close
set rse=nothing

response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")

Elseif kyzc="add"  then
%>
<card id="main" title="书写日记" >
<p>
日记类别:<%
sql = "SELECT * FROM wish" 
Set objgbrs = Server.CreateObject("ADODB.Recordset")
objgbrs.OPEN sql,myc,1,2
if objgbrs.eof and objgbrs.bof then
Response.Write"<option>暂无分类</option>"
else
Response.Write"<select name='fenlei'>"
do while not objgbrs.eof
Response.Write"<option value='"&objgbrs("classid")&"'>"&objgbrs("biaoti")&"</option>"
objgbrs.movenext
loop
end if
objgbrs.close
set objgbrs=nothing
%></select><br/>
日记标题:<input type="text" name="name<%=minute(now)%><%=second(now)%>" title="输入标题" value="" maxlength="50"/><br/>
<%'Response.Write"日记内容:<input type='text' name='wish"&minute(now) & second(now)&"' title='文章内容' maxlength='30000' cols='150' rows='20'/><br/>"%>
日记内容:<input type="text" name="wish<%=minute(now)%><%=second(now)%>" title="输入内容" value="" maxlength="10000"/><br/>
是否公开:<select name='zfgk<%=minute(now)%><%=second(now)%>' value="f">
<option value='f'>是</option>
<option value='t'>否</option>
</select><br/>
<anchor>确认提交
		<go href="/BBS/Diary/Index.Asp?kyzc=addcl&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="fenlei" value="$(fenlei)"/>
		<postfield name="wish" value="$(wish<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="zffk" value="$(zfgk<%=minute(now)%><%=second(now)%>)"/>
		</go>
		</anchor><br/>

<%
response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")



Elseif kyzc="addcl"  then
%>
<card id="main" title="我要写日记" >
<p>
<%

fenlei=usb(request("fenlei"))
wish=usb(request("wish"))
name=usb(request("name"))
zffk=usb(request("zffk"))
if wish="" or name="" then
response.write("请输入日记内容或标题<br/>")
Elseif len(wish)<10 or len(name)<2 then
response.write("内容不能少于10字 或标题不能低于2字<br/>")
Elseif Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
response.write("对不起，您的发表权已被锁，请与管理员联系!<br/>")
Else
  sql="update usereg set usejf=usejf+50,ml=ml+1,tili=tili+1 where CStr(id)='" & Session("useid") & "'"
  conn.Execute(sql)
application.lock()
set rsw=Server.CreateObject("ADODB.Recordset")
rspl="select * from [yxxe] order by id desc"
rsw.open rspl,myc,1,2
rsw.addnew
rsw("ids")=Session("useid")
rsw("classid")=fenlei
rsw("biaoti")=name
rsw("zffk")=zffk
rsw.update
rsw.close
rsp1="select id from [yxxe] order by id desc"
rsw.open rsp1,myc,1,1
nextID=rsw("id")
rsw.close()
set rsw=Nothing
application.unlock()
Set oa=CreateObject("adodb.stream")
oa.type=2
oa.mode=3
oa.open
oa.writetext(wish)
oa.position=0
oa.type=1
oa.position=0
oa.savetofile server.mappath(".\Data\"&nextID&".txt"),1
oa.Close
Set oa=nothing
response.write("成功发表日记 金币+50/体力+1/魅力+1<br/>如果是不公开的日记请在<a href='/BBS/Diary/Index.Asp?kyzc=main&amp;ky=2&amp;SessionID="&SessionID&"'>我的日记</a>里查看<br/>")
%>

<a href='/BBS/Diary/Index.Asp?id=<%=fenlei%>&amp;kyzc=xiang&amp;SessionID=<%=SessionID%>'>查看我的日记</a><br/>
<%end if%>

<%
response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="del" then
%>
<card id="main" title="删除成功" >
<p>
<%
ids=request("id")
page=request("page")

sql="delete from WisH Where CStr(Id)='" & ids & "'"
  myc.Execute(sql)

sqlss="delete from yxxe Where CStr(classid)='" & ids & "'"
  myc.Execute(sqlss)
%>
删除成功！<br/>

<%
response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="delview"  then
%>
<card id="main" title="删除成功" >
<p>
<%
ids=request("id")
fid=request("fid")
page=request("page")

  set rswt=Server.CreateObject("ADODB.Recordset")
     qsswt="select * from yxxe where id="&ids&" and classid="&fid&"" 
  rswt.open qsswt,myc,1,2

if rswt.eof then 
response.write("ID错误!<br/>")
else
sqlss="delete from yxxe Where CStr(id)='" & ids & "'"
  myc.Execute(sqlss)

sqlss="delete from hf Where CStr(ids)='" & ids & "'"
  myc.Execute(sqlss)
Set fs=CreateObject("scripting.filesystemobject")
fs.DeleteFile server.mappath("Data\"&ids&".txt"),True
Set fs=nothing
%>
删除成功！<br/>
<%

	
End IF

response.write("--------------<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")

rswt.close
set rswt=nothing

Elseif kyzc="delhf"  then
%>
<card id="main" title="删除成功" >
<p>
<%

id=request("id")
fid=request("fid")
ids=request("ids")
page=request("page")

  set rswt=Server.CreateObject("ADODB.Recordset")
     qsswt="select * from hf where id="&ids&" and ids="&id&"" 
  rswt.open qsswt,myc,1,2
if rswt.eof then 
response.write("ID错误!<br/>")
else
sqlss="delete from hf Where CStr(id)='" & ids & "'"
  myc.Execute(sqlss)

  sql="update yxxe set huifu=huifu-1 where CStr(id)='" & id & "'"
  myc.Execute(sql)

%>
删除成功！<br/>

<%
	
End IF

response.write("--------------<br/><a href='/BBS/Diary/index.asp?kyzc=receipt&amp;FID=" & FID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>返回回复列表</a>")
response.write("<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="view"  then
%>
<%
fID=request("fID")
page=request("page")
id=Request("id")
zf=Request("zf")
  dim id,page
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


  showwz=CLng(Session("showwz"))
  sql="update yxxe set rc=rc+1 Where CStr(id)='" & id & "'"
  myc.Execute(sql)

  set objgbrsc=Server.CreateObject("ADODB.Recordset")
  ssql="select * from yxxe Where CStr(id)='" & id &"' and CStr(classid)='"&FID&"'"
  objgbrsc.open ssql,myc,1,1
  if objgbrsc.eof then
      response.write "<card id='card1' title='查看日记'><p>&#x6587;&#x7AE0;ID&#x9519;&#x8BEF;&#xFF0C;&#x4F60;&#x6240;&#x67E5;&#x770B;&#x7684;&#x6587;&#x7AE0;&#x53EF;&#x80FD;&#x5DF2;&#x7ECF;&#x88AB;&#x5220;&#x9664;&#x3002;<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;</a></p></card></wml>"
      myc.close
      set objgbrsc=nothing
      set myc=nothing
      response.end
  end if

tjhm=objgbrsc("ids")
	iduse=Session("useid")

if objgbrsc("zffk")<>gk and tjhm<>iduse then
      response.write "<card id='card1' title='查看日记'><p>系统提示!私人日记 你非主人,,,,,,,<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;</a></p></card></wml>"
      myc.close
      set objgbrsc=nothing
      set myc=nothing
      response.end
  end if

%>
<card id="main" title="查看日记" >
<p>
<%

if zf<>""  then
if zf="yes"  then
  sql="update yxxe set zf=zf+1 Where CStr(id)='" & id & "'"
  myc.Execute(sql)

elseif zf="dan"  then

  sql="update yxxe set tao=tao+1 Where CStr(id)='" & id & "'"
  myc.Execute(sql)

end if

end if
   		Response.write "标题:" &converttowidebaiti(objgbrsc("biaoti"))&"<br/>"
                Response.write "作者:<a href='/bbs/reg/useinfo.asp?id=" & objgbrsc("ids") & "&amp;SessionID=" & SessionID & "'>" & ubb(redtjname) & "ID:" & objgbrsc("ids") &"</a><br/>"
   		Response.write "人气(" & objgbrsc("rc")&") <a href='/BBS/Diary/Index.Asp?kyzc=view&amp;Spage=" & Spage+1 & "&amp;FID=" & fID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "&amp;Page=" & Page & "&amp;zf=yes'>鲜花</a>(" & objgbrsc("zf")&") <a href='/BBS/Diary/Index.Asp?kyzc=view&amp;Spage=" & Spage+1 & "&amp;FID=" & fID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "&amp;Page=" & Page & "&amp;zf=dan'>扔蛋</a>(" & objgbrsc("tao")&")" 
   		Response.write "<br/>时间:" & objgbrsc("kjtime")

                Response.write "<br/>--------------<br/>"
dim spage,PageCount,moy
moy=request("moy")

if moy="123" then
pagesize=10000
else
pagesize=showwz
End IF
	Spage = Request("Spage")

	IF Not IsEmpty(Spage) Then
		IF Not IsNumeric(Spage) Then		
			Spage=1
		Else
			Spage=Cint(Spage)
		End IF
	Else
		Spage = 1
	End IF
i=request("i")
if isnull(i) or i="" then i=0

Set oa=CreateObject("adodb.stream")
oa.type=2
oa.Mode=3
oa.OPen
oa.LoadfromFile(server.mappath("Data\"&objgbrsc("id")&".txt"))
oa.position=0
Contents=oa.ReadText
oa.close()
Set oa=nothing
	StartWords = 1
Lengths=len(Contents)
tjhm=objgbrsc("ids")

                if Lengths>=pagesize and Spage=1 then
       		Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=view&amp;FID=" & fID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a><br/>"
   		End if%>
       		<%=converttowide(UBBCodes(outstr(Contents,Spage)))%><br/>--------------<br/>
<%

    		if Spage>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
       		Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=view&amp;Spage=" & Spage+1 & "&amp;FID=" & fID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "&amp;Page=" & Page & "'>&#x4E0B;&#x9875;</a>"
   		end if

    		if Spage<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else        
       			Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=view&amp;Spage=" & Spage-1 & "&amp;FID=" & fID & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "&amp;Page=" & Page & "'>&#x4E0A;&#x9875;</a>"
   		end if

		if PageCount<=1 then
		'Response.Write("--------------<br/>")
   		else%>
		(<%=Spage%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Spage>=PageCount then response.write(Spage-1) else response.write(Spage+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/BBS/Diary/Index.Asp?kyzc=view&amp;ID=<%=objgbrsc("id")%>&amp;page=<%=page%>&amp;FID=<%=FID%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="Spage" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
tooo=objgbrsc("id")
tooa=objgbrsc("ids")

    		if tooa=iduse or Session("Counter")="pass_numbers_55556666" then
Response.Write"<a href='/BBS/Diary/index.asp?kyzc=savewz&amp;FID=" & FID & "&amp;ID=" & tooo & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>编辑日记</a>|<a href='/BBS/Diary/index.asp?kyzc=delview&amp;FID=" & FID & "&amp;ID=" & tooo & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>删除日记</a><br/>"
end if


objgbrsc.close
      set objgbrsc=nothing


set objgbrsv=Server.CreateObject("ADODB.Recordset")
ssqlc="select * from hf where ids="&tooo&" order by times desc"
objgbrsv.open ssqlc,myc,1,3
aaa=objgbrsv.RecordCount
if objgbrsv.eof then

Response.write "&#x6682;&#x65E0;&#x56DE;&#x590D;"
else
Response.Write"<a href='/BBS/Diary/index.asp?kyzc=receipt&amp;FID=" & FID & "&amp;ID=" & tooo & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x770B;&#x56DE;&#x590D;:" & aaa & "&#x6761;</a><br/>"
Response.write "&#x6700;&#x65B0;&#x56DE;&#x590D;:"
bihao=0

For k=1 to 3
bihaocont=bihaocont+1
ids=objgbrsv("id")

Contentx=left(objgbrsv("name"),60)
if len(objgbrsv("name"))>60 then
Contentx=Contentx+"(url=/BBS/Diary/index.asp?kyzc=receiptxx&amp;FID="&FID&"&ID="&tooo&"&ids="&ids&"&Page="&page&"&SessionID="&SessionID&")详...(/url)"
End if

tjhsm=objgbrsv("tjhm")
	sqlllx="select * from usereg where CStr(id)='" & tjhsm & "'"
	set rsSSx=conn.execute(sqlllx)
	rtjnamex=rsSSx("usename")
set rsSSx=nothing

Response.Write "<br/>"
Response.Write objgbrsv.RecordCount-CLng(bihao+bihaocont)+1 &""&converttowidebaiti("楼:")&""
Response.write ""& converttowidebaiti(rtjnamex) & ":" & converttowide(UBBCodes(Contentx))
Response.write"(" & String(2-Len(Month(objgbrsv("times"))),"0") & Month(objgbrsv("times")) & "-" & String(2-len(Day(objgbrsv("times"))),"0") & Day(objgbrsv("times")) & "  " & String(2-Len(hour(objgbrsv("times"))),"0") & hour(objgbrsv("times"))  & ":" & String(2-Len(minute(objgbrsv("times"))),"0") & minute(objgbrsv("times")) & ")"
objgbrsv.Movenext
if objgbrsv.EOF then Exit for
 Next

end if
Application.Lock
myc.Execute(ssqlc)
Application.Unlock

objgbrsv.close
set objgbrsv=nothing

%>
<br/><input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="" size="12"/>
<anchor>&#x56DE;&#x590D;<go method="post" href='/bbs/Diary/index.asp?kyzc=receiptcl&amp;SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/>
<postfield name="FID" value="<%=FID%>"/>
<postfield name="id" value="<%=tooo%>"/>
<postfield name="Page" value="<%=Page%>"/>
</go></anchor><br/>
<%
  set rsxy=Server.CreateObject("ADODB.Recordset")
     qssxx="select * from wish where classid="&fID
  rsxy.open qssxx,myc,1,2
if rsxy.eof then
aaas="ID错误"
else
aaas=rsxy("biaoti")
End if
rsxy.close
set rsxy=nothing

response.write("--------------<br/><a href='/bbs/Diary/index.asp?kyzc=xiang&amp;SessionID=" & SessionID & "&amp;page=" & page & "&amp;id=" & fid & "'>返回"&aaas&"</a><br/>")
response.write("<a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")


Elseif kyzc="receiptcl"  then
%>
<card id="main" title="发表评论" >
<p>
<%

name=usb(request("name"))
page=request("page")
id=Request("id")
fid=Request("fid")
iduse=Session("useid")
if name="" or iduse="" then
response.write("请输入评论内容<br/>--------------<br/><a href='/BBS/Diary/Index.Asp?kyzc=receipt&amp;ID="&ID&"&amp;fID="&fID&"&amp;page="&page&"&amp;SessionID="&SessionID&"'>进入回复列表</a><br/>")
Elseif Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
response.write("对不起，您的发表权已被锁，请与管理员联系!<br/>")
Else
set rsws=Server.CreateObject("ADODB.Recordset")
rspls="select * from [hf] order by id desc"
rsws.open rspls,myc,1,2
rsws.addnew
rsws("tjhm")=Session("useid")
rsws("ids")=id
rsws("name")=name
rsws.update

rsws.close
set rsws=nothing

  sql="update yxxe set huifu=huifu+1 where CStr(id)='" & id & "'"
  myc.Execute(sql)

response.write("成功发表评论<br/>--------------<br/><a href='/BBS/Diary/Index.Asp?kyzc=view&amp;ID="&ID&"&amp;fID="&fID&"&amp;page="&page&"&amp;SessionID="&SessionID&"'>回看文章</a><br/>")
response.write("<a href='/BBS/Diary/Index.Asp?kyzc=receipt&amp;ID="&ID&"&amp;fID="&fID&"&amp;page="&page&"&amp;SessionID="&SessionID&"'>回复列表</a><br/>")
response.write("<a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")
end if


Elseif kyzc="receipt"  then

  fID=request("fID")
  pages=request("pages")
  id=request("id")
  page=request("page")
if page<1 or page="" then page=1

set objgbrsyn=Server.CreateObject("ADODB.Recordset")
rspln="select * from yxxe where id="&id
objgbrsyn.open rspln,myc,1,2
if objgbrsyn.eof then
      response.write "<card id='card1' title='查看日记'><p>&#x6587;&#x7AE0;ID&#x9519;&#x8BEF;&#xFF0C;&#x4F60;&#x6240;&#x67E5;&#x770B;&#x7684;&#x6587;&#x7AE0;&#x53EF;&#x80FD;&#x5DF2;&#x7ECF;&#x88AB;&#x5220;&#x9664;&#x3002;<br/><a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;</a></p></card></wml>"
      myc.close
      set objgbrsyn=nothing
      set myc=nothing
      response.end
Else
dlnamess=converttowidebaiti(objgbrsyn("biaoti"))
end if

objgbrsyn.close
Set objgbrsyn= Nothing
Response.Write "<card id='card1' title='" & dlnamess & "-" & converttowidebaiti("回复列表")& "'><p>"
Response.write"" & converttowidebaiti("日记标题")& ":<a href='/BBS/Diary/Index.Asp?kyzc=view&amp;fID=" & fID & "&amp;id=" & id& "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"&dlnamess&"</a><br/>"


%>

<input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="<%=converttowidebaiti(adgg)%>" size="15"/><br/>
<anchor>发表评论<go method="post" href='/bbs/Diary/index.asp?kyzc=receiptcl&amp;SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/><%
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='FID' value='" & FID & "'/>"
%></go></anchor><br/>--------------<br/>
<%
  fID=request("fID")
  pages=request("pages")
  id=request("id")
set Rss=Server.CreateObject("ADODB.Recordset")
Qsl="select * from [hf] where ids="&id&" order by id desc"
Rss.open Qsl,myc,1,2

if Rss.eof then
Response.write "暂无回复记录<br/>"
else

a=Rss.recordcount
'分页的实现 
Rss.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>Rss.PageCount then pages=Rss.PageCount
Rss.absolutepage=pages
if pages=1 then
bihao=0
else

bihao=pages*10-10
End if
For k=1 to Rss.PageSize
bihaocont=bihaocont+1
tjhm=Rss("tjhm")
ids=Rss("id")
Contentx=left(Rss("name"),60)
if len(Rss("name"))>60 then
Contentx=Contentx+"(url=/BBS/Diary/Index.Asp?kyzc=receiptxx&fID="&fID&"&id="&id&"&ids="&ids& "&page="&page&"&pages="&pages&"&SessionID="&SessionID&")详...(/url)"
End if
Response.write Rss.RecordCount-CLng(bihao+bihaocont)+1 & "" & converttowidebaiti("楼")& "."
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & Rss("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "(ID:" & Rss("tjhm") & ")</a>:"
Response.write "" & converttowide(UBBCodes(Contentx)) & ""
Response.write"(" & String(2-Len(Month(Rss("times"))),"0") & Month(Rss("times")) & "-" & String(2-len(Day(Rss("times"))),"0") & Day(Rss("times")) & " &nbsp;" & String(2-Len(hour(Rss("times"))),"0") & hour(Rss("times"))  & ":" & String(2-Len(minute(Rss("times"))),"0") & minute(Rss("times")) & ")"

if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("Counter")="pass_numbers_55556666" then
response.write " [<a href='/BBS/Diary/Index.Asp?ids="&Rss("id")&"&amp;kyzc=delhf&amp;SessionID="&SessionID&"&amp;pages="&pages&"&amp;page="&page&"&amp;id="&id&"&amp;fid="&fid&"'>删除</a>]"
End if

Response.write "<br/>"
Rss.Movenext
if Rss.EOF then Exit for
 Next
end if

if Rss.pagecount>1 then
Response.write"--------------<br/>"
end if

if Rss.pagecount-pages <> 0 then
response.write("<a href='/BBS/Diary/Index.Asp?kyzc=receipt&amp;SessionID="&SessionID&"&amp;page=" & page & "&amp;fID=" & fID & "&amp;ID=" & ID & "&amp;pages="&pages+1&"'>下页</a>&nbsp;")
end if

if pages>1 then
response.write("<a href='/BBS/Diary/Index.Asp?kyzc=receipt&amp;SessionID="&SessionID&"&amp;page=" & page & "&amp;fID=" & fID & "&amp;ID=" & ID & "&amp;pages="&pages-1&"'>上页</a>")
end if

if Rss.pagecount>1 then
response.write("("&pages&"/"&Rss.pagecount&"/"&a&")<br/>")
%>
                    <input name="Pages<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Pages>=Rss.pagecount then response.write(Pages-1) else response.write(Pages+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Diary/Index.Asp?kyzc=receipt&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>&amp;fID=<%=fID%>&amp;ID=<%=ID%>" accept-charset='utf-8'>
		            <postfield name="Pages" value="$(Pages<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
Rss.close
Set Rss= Nothing

set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from wish where id="&fID
objgbrssy.open rspls,myc,1,2
if objgbrssy.eof then
dlnamse="无此分类"
Else
dlnamse=objgbrssy("biaoti")
end if
objgbrssy.close
Set objgbrssy= Nothing

Response.write"--------------<br/>"
Response.write "<a href='/bbs/Diary/index.asp?kyzc=view&amp;fID=" & fID & "&amp;ID=" & ID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回查看原文")& "</a><br/>"
Response.write "<a href='/bbs/Diary/index.asp?kyzc=xiang&amp;ID=" & fID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")& "" & converttowidebaiti(dlnamse) & "</a><br/>"



Elseif kyzc="receiptxx"  then

  fID=request("fID")
  pages=request("pages")
if pages="" or pages<=0 then pages=1
  id=request("id")
  page=request("page")
  ids=Request("ids")

sql="update hf set rc=rc+1 Where CStr(id)='" & ids & "'"
myc.Execute(sql)

set objgbrsyx=Server.CreateObject("ADODB.Recordset")
rspl="select * from yxxe where id="&id
objgbrsyx.open rspl,myc,1,2
if objgbrsyx.eof then
dlnamess="无此帖子"
Else
dlnamesss=converttowidebaiti(objgbrsyx("biaoti"))
end if
objgbrsyx.close
Set objgbrsyx= Nothing

  set objgbrsxx=Server.CreateObject("ADODB.Recordset")
  ssqxxl="select * from hf Where CStr(id)='" & ids &"'"
  objgbrsxx.open ssqxxl,myc,1,2
  if objgbrsxx.eof then
      response.write "<card id='card1' title='回复列表'><p>ID错误</p></card></wml>"
      myc.close
      set objgbrsxx=nothing
      set myc=nothing
      response.end
  end if

Response.Write "<card id='card1' title='" & dlnamesss & "-" & converttowidebaiti("回复列表")& "'><p>"
Response.write"" & converttowidebaiti("文章")& ":<a href='/bbs/Diary/index.asp?kyzc=view&amp;fID=" & fID & "&amp;ID=" & ID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"&dlnamesss&"</a><br/>-------------<br/>"


iduse=Session("useid")
ltname=converttowidebaiti(Session("ltname"))
showwz=CLng(Session("showwz"))

moyy=request("moyy")
if moyy="123" then
pagesize=10000
else
pagesize=showwz
End IF
	pagezz = Request("pagezz")

	IF Not IsEmpty(pagezz) Then
		IF Not IsNumeric(pagezz) Then		
			pagezz=1
		Else
			pagezz=Cint(pagezz)
		End IF
	Else
		pagezz = 1
	End IF

Contentstc=objgbrsxx("name")
	StartWords = 1
Lengths=len(Contentstc)
tjhm=objgbrsxx("tjhm")
%>

       		<%
                if Lengths>=pagesize and pagezz=1 then
       		Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=receiptxx&amp;fID=" & fID & "&amp;pagezz=1&amp;ids=" & objgbrsxx("id") & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "&amp;moyy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a><br/>"
   		End if%>

       		<%=converttowide(outstrs(objgbrsxx("name"),pagezz))%><br/>--------------<br/>

       		<%
    		if pagezz>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=receiptxx&amp;fID=" & fID & "&amp;pagezz=" & pagezz+1 & "&amp;ids=" & objgbrsxx("id") & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if


    		if pagezz<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else         
Response.Write "<a href='/BBS/Diary/Index.Asp?kyzc=receiptxx&amp;fID=" & fID & "&amp;pagezz=" & pagezz-1 & "&amp;ids=" & objgbrsxx("id") & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>上页</a>"
  End if

		if PageCount<=1 then
		'Response.Write("--------------<br/>")
   		else%>
		(<%=pagezz%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if pagezz>=PageCount then response.write(pagezz-1) else response.write(pagezz+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/BBS/Diary/Index.Asp?kyzc=receiptxx&amp;IDS=<%=objgbrsxx("id")%>&amp;ID=<%=id%>&amp;page=<%=page%>&amp;pages=<%=pages%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="pagezz" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
if Session("yxxezb")<>"" or Session("Counter")="pass_numbers_55556666" then
response.write " <a href='/BBS/Diary/Index.Asp?ids="&objgbrsxx("id")&"&amp;kyzc=delhf&amp;SessionID="&SessionID&"&amp;pages="&pages&"&amp;page="&page&"&amp;fid="&fid&"&amp;id="&id&"'>删除回复</a>"
End if

tjhm=objgbrsxx("tjhm")
	sqssl="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sqssl)
	rtjname=rsSS("usename")
set rsSS=nothing

Response.write "<br/>楼主：<a href='/bbs/reg/useinfo.asp?id=" & objgbrsxx("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(rtjname) & "ID:" & objgbrsxx("tjhm") & "</a>"
Response.write "<br/>人气：" & objgbrsxx("rc") & "<br/>时间：" & objgbrsxx("times")

response.write "<br/><a href='/BBS/Diary/index.asp?kyzc=receipt&amp;FID=" & FID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "&amp;pages=" & pages & "'>回复列表</a>"
Response.write "<br/><a href='/bbs/Diary/index.asp?kyzc=view&amp;fID=" & fID & "&amp;ID=" & ID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回看原文</a>"
objgbrsxx.close
Set objgbrsxx= Nothing


set obrs=Server.CreateObject("ADODB.Recordset")
ls="select * from wish where classid="&FID
obrs.open ls,myc,1,2
if obrs.eof then
dlnamsex="无此分类"
Else
dlnamsex=obrs("biaoti")
end if
obrs.close
Set obrs= Nothing
Response.write "<br/><a href='/bbs/Diary/index.asp?ID=" & fID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamsex & "</a><br/>"

Else
      response.write "<card id='card1' title='书写日记'><p>请不要提交非法参数<br/>"
response.write("<a href='/bbs/Diary/index.asp?SessionID=" & SessionID & "'>返回日记首页</a><br/>")
end if

%>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>
<%
Function outstr(str,spage)	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(spage-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if
	outstr=str
end Function%>

<%
Function outstrs(str,pagezz)
	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(pagezz-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if
	outstrs=str
end Function%>