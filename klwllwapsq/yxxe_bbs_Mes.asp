<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="管理消息" >
<p>
<%
'if session("Adminid")<>"1" then
'Response.write"未知错误</p></card></wml>"
'response.end
'end if

%>
<%
Action=request("Action")
ky=request("ky")
if Action="" then Action="main"
page=Request("page")
%>
<%
if Action="main" then 


txt=request("txt")
if txt<>"" then txtt="where cstr(reids)="&txt&""
sql="select * from guestbook "&txtt&" order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无记录<br/>"
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
管理消息<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<b><u><a href="yxxe_bbs_Mes.asp?Action=View&amp;ID=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">[管理]</a></u></b><%=(j+(page-1)*listnum)%>:
<%
reids=rs("reids")
if reids<>"0" then 
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&reids
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此会员"
Else
dlname=objgbrsy("usename")
end if
Else
dlname="系统消息"
end if
objgbrsy.close
Set objgbrsy= Nothing%>
<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("reids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlname)%></a>发给
<%
set objgbrsys=Server.CreateObject("ADODB.Recordset")
rspls="select * from usereg where id="&rs("ids")
objgbrsys.open rspls,conn,1,2
if objgbrsys.eof then 
dlme="无此会员"
Else
dlme=objgbrsys("usename")
end if
objgbrsys.close
Set objgbrsys= Nothing%><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("ids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlme)%></a>内容:<%=ubb(rs("niayo"))%>[<u><%=usb(rs("times"))%></u>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>&amp;txt=<%=request("txt")%>">首页</a>
      <a href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>&amp;txt=<%=request("txt")%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>&amp;txt=<%=request("txt")%>"><b>[<%=page+1%>]</b></a>
      <a href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>&amp;txt=<%=request("txt")%>">尾页</a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name='txt<%=minute(now)%><%=second(now)%>'  size='12' title='筛选' value=''/>
<br/>
<anchor>筛选
    <go href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(txt<%=minute(now)%><%=second(now)%>)"/></go></anchor>
<% if txt<>"" then %>
<a href="yxxe_bbs_Mes.asp?Action=<%=Action%>&amp;adminmid=<%=request("adminmid")%>">全部消息</a>
<%
end if %><br/>
----------<br/>
<%
elseif Action="View" then 

id=usb(request("id"))
idss=usb(request("idss"))
page=usb(request("page"))
ky=usb(request("ky"))


if ky="1" then
sql="update usereg set ftsdbz='x',lysdbz='t',fsczg='1860' where cstr(id)="&idss
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "封锁进入权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&idss&"'>查看会员资料</a><br/><a href='yxxe_bbs_mes.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回消息管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="2" then
		Response.Write "您确认要删除该会员所发出的信息吗？删除后不可恢复!<br/>"
		Response.Write "<a href='yxxe_bbs_mes.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;page="&page&"&amp;idss="&idss&"&amp;id="&id&"&amp;ky=22'>确定</a><br/><br/><a href='yxxe_bbs_mes.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;page="&page&"&amp;id="&id&"'>取消</a><br/>------------<br/><a href='yxxe_bbs_mes.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回消息管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="22" then
sql="delete from guestbook Where CStr(reids)="&idss
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "该会员所发出的消息已全部删除<br/>------------<br/><a href='yxxe_bbs_mes.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回消息管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="3" then
sql="delete from guestbook Where CStr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "成功删除消息！<br/>------------<br/><a href='yxxe_bbs_mes.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回消息管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end
end if




set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from guestbook where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该消息!<br/>")
else

reids=rs("reids")
if reids<>"0" then 
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&reids
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此会员"
Else
dlname=objgbrsy("usename")
end if
Else
dlname="系统消息"
end if
objgbrsy.close
Set objgbrsy= Nothing%>
信息编号:<%=usb(rs("id"))%><br/>
<%
set objgbrsys=Server.CreateObject("ADODB.Recordset")
rspls="select * from usereg where id="&rs("ids")
objgbrsys.open rspls,conn,1,2
if objgbrsys.eof then 
dlnames="无此会员"
Else
dlnames=objgbrsys("usename")
end if
objgbrsys.close
Set objgbrsys= Nothing%>
收信会员:<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("ids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlnames)%></a>(ID:<%=rs("ids")%>)<br/>
发信会员:<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("reids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(dlname)%></a>(ID:<%=rs("reids")%>)<br/>
发信时间:<%=usb(rs("times"))%><br/>
----------<br/>
信息内容:<%=ubb(rs("niayo"))%><br/>
----------<br/>
<a href="yxxe_bbs_mes.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;idss=<%=rs("reids")%>&amp;id=<%=rs("id")%>&amp;Page=<%=Page%>&amp;ky=1">加黑作者</a>|<a href="yxxe_bbs_mes.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;Page=<%=Page%>&amp;id=<%=rs("id")%>&amp;ky=3">删除该条</a><br/>
<a href="yxxe_bbs_mes.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;idss=<%=rs("reids")%>&amp;id=<%=rs("id")%>&amp;Page=<%=Page%>&amp;ky=2">清除作者所有消息</a><br/>
<%end if%>
----------<br/>
<a href="yxxe_bbs_mes.asp?adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">返回消息管理</a><br/>
<%end if%>




<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"月"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"日("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small><br/>
</p></card>
</wml>