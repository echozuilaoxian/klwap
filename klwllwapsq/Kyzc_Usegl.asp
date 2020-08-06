<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="管理会员" >
<p>
<%id=usb(request("id"))
page=request("page")
Action=request("Action")
ky=request("ky")
if Action="" then Action="main"
if page="" or page<1 then page="1"

if Action="main" then 
kyzc_id=request("kyzc_id")
if kyzc_id<>"" then txtt="where cstr(id)="&kyzc_id&""
sql="select * from usereg "&txtt&" order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无记录<br/>-------------<br/>"
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
管理会员<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<b><u><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>&amp;Page=<%=page%>">[管理]</a></u></b><%=(j+(page-1)*listnum)%>:<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>&amp;Page=<%=page%>"><%=ubb(rs("usename"))%></a>(ID:<%=UBB(rs("id"))%>) [注册时间<%=usb(rs("regtimes"))%>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>">&lt;&lt;</a>
      <a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name='kyzc_id<%=minute(now)%><%=second(now)%>'  size='12' title='筛选' value=''/>
<br/>
<anchor>筛选
    <go href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>" method="post" accept-charset="utf-8">
        <postfield name="kyzc_id" value="$(kyzc_id<%=minute(now)%><%=second(now)%>)"/></go></anchor>
<% if kyzc_id<>"" then %>
<a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>">全部会员</a>
<%end if%>
<br/>
----------<br/>
<%
rs.close
Set rs= Nothing

%>
<%
elseif Action="View" then 
id=usb(request("id"))
page=request("page")
if page = "" or page < 1 then
page = 1
end if
Action=request("Action")
ky=request("ky")

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该会员<br/>-------------<br/>")
else
if rs("usesex")=0 then usesex="帅哥"
if rs("usesex")=1 then usesex="靓女"
if rs("usesex")=2 then usesex="妖怪"
%>

<%
if ky<>"" then
if ky="1" then
sql="update usereg set ftsdbz='f',lysdbz='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "解黑操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="2" then
sql="update usereg set ftsdbz='x',lysdbz='t',fsczg='0' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "封锁进入权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="3" then

sql="update usereg set ftsdbz='f',lysdbz='f' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "解开进入权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="4" then
sql="update usereg set ftsdbz='t',lysdbz='t' where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

		Response.Write "封锁发表权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="5" then
sql="update usereg set yxxezb=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消总管权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="6" then
sql="update usereg set yxxezb=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

		Response.Write "任命总管权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="7" then
sql="update usereg set yxxexc=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "任命巡查权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="8" then
sql="update usereg set yxxexc=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消巡查权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="9" then
sql="update usereg set yxxegg=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "任命站长权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="10" then
sql="update usereg set yxxegg=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消站长权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="11" then
sql="update usereg set vip=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "任命vip会员操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="12" then
sql="update usereg set vip=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消vip会员操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="33" then
sql="update usereg set cw1=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "任命法官权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="34" then
sql="update usereg set cw1=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消法官权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="35" then
sql="update usereg set cg=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "任命彩管权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="36" then
sql="update usereg set cg=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消彩管权操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="13" then
sql="update usereg set xz1=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="14" then
sql="update usereg set xz1=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="15" then
sql="update usereg set xz2=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="16" then
sql="update usereg set xz2=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="17" then
sql="update usereg set xz3=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="18" then
sql="update usereg set xz3=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="19" then
sql="update usereg set xz4=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="20" then
sql="update usereg set xz4=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="21" then
sql="update usereg set xz5=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="22" then
sql="update usereg set xz5=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="23" then
sql="update usereg set xz6=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="24" then
sql="update usereg set xz6=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="25" then
sql="update usereg set xz7=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="26" then
sql="update usereg set xz7=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="27" then
sql="update usereg set xz8=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="28" then
sql="update usereg set xz8=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="29" then
sql="update usereg set xz9=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="30" then
sql="update usereg set xz9=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end


elseif ky="31" then
sql="update usereg set xz10=1 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "授予勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="32" then
sql="update usereg set xz10=0 where cstr(id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "撤消勋章操作成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end
		elseif ky="del" then
		Response.Write "您确认删除该会员？删除后不可恢复,建议只删除手工注册的会员!<br/>"
		Response.Write "<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"&amp;ky=delok'>确定</a><br/><br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>取消</a><br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing

response.end

elseif ky="delok" then
if session("Adminid")="1" then

sql="delete from wuza Where CStr(tjhm)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

sql="delete from lthf Where CStr(tjhm)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

sql="delete from usereg Where CStr(Id)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

sql="delete from guestbook Where CStr(reids)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

sql="delete from guestbook Where CStr(ids)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
sql="delete from myfriend Where CStr(ids)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock

sql="delete from myfriend Where CStr(friid)="&id
       Application.Lock
      conn.Execute(sql)
      Application.Unlock

		Response.Write "会员资料删除成功！<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;ky=1&amp;page="&page&"'>返回管理会员</a></p></card></wml>"
else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>------------<br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;ky=1&amp;page="&page&"'>返回管理会员</a></p></card></wml>"
end if

Conn.close
Set rs= Nothing
Set Conn= Nothing
response.end

elseif ky="delwz" then
		Response.Write "您确认要删除该会员所发表的帖子吗？删除后不可恢复!<br/>"
		Response.Write "<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"&amp;ky=delwzok'>确定</a><br/><br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>取消</a><br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="delwzok" then
sql="delete from wuza Where CStr(tjhm)="&id
       Application.Lock
      conn.Execute(sql)
      Application.Unlock
sql="update from usereg set ticont=0 Where CStr(id)="&id
       Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "删除该会员论坛所有帖子成功!<br/><br/>"

elseif ky="delre" then
		Response.Write "您确认要删除该会员论坛所有回复吗？删除后不可恢复!<br/>"
		Response.Write "<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"&amp;ky=delreok'>确定</a><br/><br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>取消</a><br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="delreok" then
sql="delete from lthf Where CStr(tjhm)="&id
       Application.Lock
      conn.Execute(sql)
      Application.Unlock
		Response.Write "删除该会员论坛所有回复成功!<br/><br/>"

elseif ky="delms" then
		Response.Write "您确认要删除该会员所发出的信息吗？删除后不可恢复!<br/>"
		Response.Write "<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"&amp;ky=delmsok'>确定</a><br/><br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>取消</a><br/>------------<br/><a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;page="&page&"'>查看"&ubb(rs("usename"))&"资料</a><br/><a href='Kyzc_Usegl.asp?Action=main&amp;adminmid="& request("adminmid")&"&amp;page="&page&"'>返回会员管理</a></p></card></wml>"
Conn.close
Set rs= Nothing
Set Conn= Nothing
  	response.end

elseif ky="delmsok" then
sql="delete from guestbook Where CStr(reids)="&id
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
Response.Write "删除该会员所发出的信息成功!<br/><br/>"

else
Response.Write "请不要提交非法参数!<br/><br/>"
end if

end if
%>

<img src="/bbs/reg/<%=ubb(rs("skin"))%>"  alt="社区秀"/><br/>
会员编号:<%=ubb(rs("id"))%><br/>
会员性别:<%=ubb(usesex)%><br/>
会员昵称:<%=ubb(rs("usename"))%><br/>
<%
if rs("id")=1 and session("Adminid")<>"1" then
Response.write "手机号吗:13660381188<br/>"
Response.write "登陆密码:6688988<br/>"
else%>
手机号吗:<%=ubb(rs("useklsj"))%><br/>
登陆密码:<%=ubb(rs("useklmm"))%><br/>
<%end if%>
注册时间:<%=ubb(rs("regtimes"))%><br/>
最后登陆:<%=ubb(rs("lasttime"))%><br/>
社区金币:<%=ubb(rs("usejf"))%><br/>
社区社币:<%=ubb(rs("myzuan"))%><br/>
社区元宝:<%=ubb(rs("rmb"))%><br/>
社区魅力:<%=ubb(rs("ml"))%><br/>
社区体力:<%=ubb(rs("tili"))%><br/>
社区爱心:<%=ubb(rs("love"))%><br/>
社区才华:<%=ubb(rs("caihua"))%><br/>
社区情商:<%=ubb(rs("qs"))%><br/>
社区智力:<%=ubb(rs("zhili"))%><br/>
<%
Response.write "社区学历:"
if rs("xl")=0 then
Response.write "没有证书"
end if
if rs("xl")=1 then
Response.write "小学毕业"
end if
if rs("xl")=2 then
Response.write "初中毕业"
end if
if rs("xl")=3 then
Response.write "高中毕业"
end if
if rs("xl")=4 then
Response.write "大学毕业"
end if
if rs("xl")=5 then
Response.write "硕士生"
end if
if rs("xl")=6 then
Response.write "博士生"
end if
Response.write "<br/>学校年级:"
if rs("nianji")=0 then
Response.write "还没读书"
end if
if rs("xf")=-1 then
Response.write "曾读小学一年级"
end if
if rs("nianji")=1 and rs("xf")>=0 then
Response.write "小学一年级"
end if
if rs("xf")=-2 then
Response.write "曾读小学二年级"
end if
if rs("nianji")=2 and rs("xf")>=0 then
Response.write "小学二年级"
end if
if rs("xf")=-3 then
Response.write "曾读小学三年级"
end if
if rs("nianji")=3 and rs("xf")>=0 then
Response.write "小学三年级"
end if
if rs("xf")=-4 then
Response.write "曾读小学四年级"
end if
if rs("nianji")=4 and rs("xf")>=0 then
Response.write "小学四年级"
end if
if rs("xf")=-5 then
Response.write "曾读小学五年级"
end if
if rs("nianji")=5 and rs("xf")>=0 then
Response.write "小学五年级"
end if
if rs("xf")=-6 then
Response.write "曾读小学六年级"
end if

if rs("nianji")=6 and rs("xf")>=0 then
Response.write "小学六年级"
end if

if rs("xf")=-7 then
Response.write "曾读初一"
end if

if rs("nianji")=7 and rs("xf")>=0 then
Response.write "初一"
end if

if rs("xf")=-8 then
Response.write "曾读初二"
end if
if rs("nianji")=8 and rs("xf")>=0 then
Response.write "初二"
end if
if rs("xf")=-9 then
Response.write "曾读初三"
end if
if rs("nianji")=9 and rs("xf")>=0 then
Response.write "初三"
end if
if rs("xf")=-10 then
Response.write "曾读高一"
end if
if rs("nianji")=10 and rs("xf")>=0 then
Response.write "高一"
end if
if rs("xf")=-11 then
Response.write "曾读高二"
end if
if rs("nianji")=11 and rs("xf")>=0 then
Response.write "高二"
end if
if rs("xf")=-12 then
Response.write "曾读高三"
end if
if rs("nianji")=12 and rs("xf")>=0 then
Response.write "高三"
end if
if rs("xf")=-13 then
Response.write "曾读大一"
end if
if rs("nianji")=13 and rs("xf")>=0 then
Response.write "大一"
end if
if rs("xf")=-14 then
Response.write "曾读大二"
end if
if rs("nianji")=14 and rs("xf")>=0 then
Response.write "大二"
end if
if rs("xf")=-15 then
Response.write "曾读大三"
end if
if rs("nianji")=15 and rs("xf")>=0 then
Response.write "大三"
end if
if rs("xf")=-16 then
Response.write "曾读大四"
end if
if rs("nianji")=16 and rs("xf")>=0 then
Response.write "大四"
end if
if rs("xf")=-17 then
Response.write "硕士生"
end if
if rs("nianji")=17 and rs("xf")>=0 then
Response.write "硕士"
end if
if rs("xf")=-18 then
Response.write "博士生"
end if
if rs("nianji")=18 and rs("xf")>=0 then
Response.write "博士"
end if
if rs("xf")=<0 then
Response.write "<br/>社区学分:0"
end if
if rs("xf")>0 then
Response.write "<br/>社区学分:"&objgbrs("xf")&""
end if
%>
<br/>社区智力:<%=ubb(rs("zhili"))%><br/>
工作天数:<%=ubb(rs("tianshu"))%><br/>
<%
set rsf=Server.CreateObject("ADODB.Recordset")
ssqlr="select * from lthf where tjhm='"&id&"' order by id desc "
rsf.open ssqlr,conn,1,1

aa=rsf.recordcount
rsf.close
Set rsf= Nothing
Response.write "回帖数量:<a href='BBSBoard.asp?Action=BBSReply&amp;Useid=" & rs("id") & "&amp;adminmid=" & request("adminmid") & "'>" & aa& "</a><br/>"
%>
发贴数量:<a href='BBSBoard.asp?Action=BBSTopic&amp;Useid=<%=rs("id")%>&amp;adminmid=<%=request("adminmid")%>'><%=ubb(rs("ticont"))%></a><br/>
个人简介:<%=ubb(rs("usejj"))%><br/>
<%
if rs("id")=1 and session("Adminid")<>"1" then%>
社区识别:<a href='/BBS/index.asp?SessionID=435ee5e4de87872e17048e0be9da5588'>435ee5e4de87872e17048e0be9da5588</a><br/>
----------<br/>
密码问题:ky6688<br/>
问题答案:kywap<br/>
<%else%>
社区识别:<a href='/BBS/index.asp?SessionID=<%=ubb(rs("wap"))%>'><%=ubb(rs("wap"))%></a><br/>
<%
      if rs("myip")<>"" then%>
注册IP:<%=ubb(rs("myip"))%><br/>
<%end if%>
----------<br/>
密码问题:<%=ubb(rs("mmwt"))%><br/>
问题答案:<%=ubb(rs("wtda"))%><br/>
<%end if%>
----------<br/>
会员当前状态:<br/><%
      if rs("ftsdbz")="x" then
Response.write "★进入权:已锁|<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;ky=1&amp;page="&page&"'>解开</a><br/>"
      Else
Response.write "★进入权:正常|<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;ky=2&amp;page="&page&"'>锁定</a><br/>"
      End if
      if rs("lysdbz")="t" then
Response.write "★发表权:已锁|<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;ky=3&amp;page="&page&"'>解开</a><br/>"
      Else
Response.write "★发表权:正常|<a href='Kyzc_Usegl.asp?Action=View&amp;adminmid="& request("adminmid")&"&amp;id="&usb(rs("id"))&"&amp;ky=4&amp;page="&page&"'>锁定</a><br/>"
      End if
%>
会员当前职务:<br/>
<%
if rs("gly")<>"0" then
if rs("bzbz")<>0 then bbzz="[正版]"
if rs("bzbz")=0 then bbzz="[副版]"
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&rs("gly")
rse.open rspple,conn,1,2
if rse.eof then
BBSname="无此版块"
else
BBSname=rse("name")
end if
Response.write "№:<a href='BBSBoard.asp?Action=Manage&amp;ID="&rse("id")&"&amp;adminmid="&request("adminmid")&"'>"&UBB(BBSname)&"</a>"&bbzz&"<br/>"
else
Response.write ""
end if
%>
<%if rs("yxxezb")<>"0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=5&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除社区总管</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=6&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为社区总管</a><br/>
<%end if%>
<%if rs("cg")="0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=35&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为论坛彩管</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=36&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除论坛彩管</a><br/>
<%end if%>
<%if rs("cw1")="0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=33&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为社区法官</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=34&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除社区法官</a><br/>
<%end if%>
<%if rs("yxxexc")="0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=7&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为论坛巡查</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=8&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除论坛巡查</a><br/>
<%end if%>
<%if rs("yxxegg")="0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=9&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为站长</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=10&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除站长</a><br/>
<%end if%>
<%if rs("vip")="0" then%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=11&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">设为vip会员</a><br/>
<%else%>
★<a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=12&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除vip会员</a><br/>
<%end if%>
<%if rs("xz1")="0" then%>
----------<br/><img src='/bbs/xz/1.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=13&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
----------<br/><img src='/bbs/xz/1.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=14&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz2")="0" then%>
<img src='/bbs/xz/2.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=15&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/2.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=16&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz3")="0" then%>
<img src='/bbs/xz/3.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=17&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/3.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=18&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz4")="0" then%>
<img src='/bbs/xz/4.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=19&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/4.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=20&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz5")="0" then%>
<img src='/bbs/xz/5.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=21&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/5.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=22&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz6")="0" then%>
<img src='/bbs/xz/6.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=23&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/6.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=24&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz7")="0" then%>
<img src='/bbs/xz/7.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=25&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/7.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=26&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz8")="0" then%>
<img src='/bbs/xz/8.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=27&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/8.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=28&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz9")="0" then%>
<img src='/bbs/xz/9.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=29&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/9.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=30&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
<%if rs("xz10")="0" then%>
<img src='/bbs/xz/10.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=31&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">授予勋章</a><br/>
<%else%>
<img src='/bbs/xz/10.gif' alt=''/><a href="Kyzc_Usegl.asp?Action=View&amp;ID=<%=rs("id")%>&amp;ky=32&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">撤除勋章</a><br/>
<%end if%>
----------<br/>
<a href="Kyzc_Usegl.asp?Action=xxgg&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=ubb(rs("id"))%>&amp;page=<%=page%>">编辑资料</a>|<a href="Kyzc_Usegl.asp?Action=View&amp;ky=del&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=ubb(rs("id"))%>&amp;page=<%=page%>">删除会员</a><br/>
<a href="Kyzc_Usegl.asp?Action=View&amp;ky=delwz&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=ubb(rs("id"))%>&amp;page=<%=page%>">清除贴子</a>|<a href="Kyzc_Usegl.asp?Action=View&amp;ky=delre&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=ubb(rs("id"))%>&amp;page=<%=page%>">清除回复</a><br/>
<a href="Kyzc_Usegl.asp?Action=View&amp;ky=delms&amp;adminmid=<%=request("adminmid")%>&amp;id=<%=ubb(rs("id"))%>&amp;page=<%=page%>">清除消息</a><br/>
----------<br/>
搜ＩＤ:<input name='idd<%=minute(now)%><%=second(now)%>' size='12'  title='筛选条件' value=''/>
<br/>
<anchor>快速管理
    <go href="Kyzc_Usegl.asp?Action=View&amp;adminmid=<%=request("adminmid")%>&amp;Page=<%=Page%>" method="post" accept-charset="utf-8">
        <postfield name="id" value="$(idd<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%end if%>
----------<br/>
<%
Rs.close
Set rs= Nothing


elseif Action="xxgg" then 

id=usb(request("id"))
page=usb(request("page"))
cw=usb(request("cw"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该会员<br/>-------------<br/>")
else
%>
<%if cw="1" then%>
*********<br/>
安全密码错误！<br/>
*********<br/>
<%elseif cw="2" then%>
*********<br/>
会员名称不能为空<br/>
*********<br/>
<%elseif cw="3" then%>
*********<br/>
手机号码不能为空！<br/>
*********<br/>
<%elseif cw="4" then%>
*********<br/>
登陆密码不能为空<br/>
*********<br/>
<%elseif cw="5" then%>
*********<br/>
社区年级不可填大于18<br/>
*********<br/>
<%elseif cw="6" then%>
*********<br/>
社区学历不可填大于6<br/>
*********<br/>
<%end if%>
社区头像:<input name='skin<%=minute(now)%><%=second(now)%>' title='社区头像' value='<%=ubb(rs("skin"))%>'/><br/>
社区昵称:<input name='usename<%=minute(now)%><%=second(now)%>' title='社区昵称' value='<%=ubb(rs("usename"))%>'/><br/>
手机号码:<input name='useklsj<%=minute(now)%><%=second(now)%>' title='手机号吗' format='*N' value='<%=rs("useklsj")%>'/><br/>
登陆密码:<input name='useklmm<%=minute(now)%><%=second(now)%>' title='登陆密码' value='<%=ubb(rs("useklmm"))%>'/><br/>
注册时间:<input name='regtimes<%=minute(now)%><%=second(now)%>' title='注册时间' value='<%=rs("regtimes")%>'/><br/>
社区金币:<input name='usejf<%=minute(now)%><%=second(now)%>' title='社区金币' value='<%=rs("usejf")%>'/><br/>
社区钻币:<input name='myzuan<%=minute(now)%><%=second(now)%>' title='社区钻币' format='*N' value='<%=rs("myzuan")%>'/><br/>
社区元宝:<input name='rmb<%=minute(now)%><%=second(now)%>' title='社区狂币' format='*N' value='<%=rs("rmb")%>'/><br/>
社区魅力:<input name='ml<%=minute(now)%><%=second(now)%>' title='社区魅力' format='*N' value='<%=rs("ml")%>'/><br/>
社区体力:<input name='tili<%=minute(now)%><%=second(now)%>' title='社区体力' format='*N' value='<%=rs("tili")%>'/><br/>
社区爱心:<input name='love<%=minute(now)%><%=second(now)%>' title='社区爱心' format='*N' value='<%=rs("love")%>'/><br/>
社区才华:<input name='caihua<%=minute(now)%><%=second(now)%>' title='社区才华' format='*N' value='<%=rs("caihua")%>'/><br/>
社区情商:<input name='qs<%=minute(now)%><%=second(now)%>' title='社区情商' format='*N' value='<%=rs("qs")%>'/><br/>
学校年级:<input name='nianji<%=minute(now)%><%=second(now)%>' title='学校年级' format='*N' value='<%=rs("nianji")%>'/>注意:限1-18之间<br/>
学校学历:<input name='xl<%=minute(now)%><%=second(now)%>' title='学校学历' format='*N' value='<%=rs("xl")%>'/>注意:限1-6之间<br/>
学校学分:<input name='xf<%=minute(now)%><%=second(now)%>' title='学校学分' format='*N' value='<%=rs("xf")%>'/><br/>
工作天数:<input name='tianshu<%=minute(now)%><%=second(now)%>' title='工作天数' format='*N' value='<%=rs("tianshu")%>'/><br/>
社区智力:<input name='zhili<%=minute(now)%><%=second(now)%>' title='社区智力' format='*N' value='<%=rs("zhili")%>'/><br/>
个人简介:<input name='usejj<%=minute(now)%><%=second(now)%>' title='个人简介' value='<%=ubb(rs("usejj"))%>'/><br/>
密码问题:<input name='mmwt<%=minute(now)%><%=second(now)%>' title='密码问题' value='<%=ubb(rs("mmwt"))%>'/><br/>
问题答案:<input name='wtda<%=minute(now)%><%=second(now)%>' title='问题答案' value='<%=ubb(rs("wtda"))%>'/><br/>
安全密码:<input name='yxxe<%=minute(now)%><%=second(now)%>' value=''/><br/>

<anchor>修改<go href='Kyzc_Usegl.asp?Action=xgcl&amp;adminmid=<%=request("adminmid")%>&amp;Page=<%=Page%>' method='post' accept-charset='utf-8'>
<postfield name='skin' value='$(skin<%=minute(now)%><%=second(now)%>)'/>
<postfield name='usename' value='$(usename<%=minute(now)%><%=second(now)%>)'/>
<postfield name='useklsj' value='$(useklsj<%=minute(now)%><%=second(now)%>)'/>
<postfield name='useklmm' value='$(useklmm<%=minute(now)%><%=second(now)%>)'/>
<postfield name='regtimes' value='$(regtimes<%=minute(now)%><%=second(now)%>)'/>
<postfield name='usejf' value='$(usejf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='myzuan' value='$(myzuan<%=minute(now)%><%=second(now)%>)'/>
<postfield name='rmb' value='$(rmb<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ml' value='$(ml<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tili' value='$(tili<%=minute(now)%><%=second(now)%>)'/>
<postfield name='nianji' value='$(nianji<%=minute(now)%><%=second(now)%>)'/>
<postfield name='xl' value='$(xl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='xf' value='$(xf<%=minute(now)%><%=second(now)%>)'/>
<postfield name='love' value='$(love<%=minute(now)%><%=second(now)%>)'/>
<postfield name='caihua' value='$(caihua<%=minute(now)%><%=second(now)%>)'/>
<postfield name='qs' value='$(qs<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tianshu' value='$(tianshu<%=minute(now)%><%=second(now)%>)'/>
<postfield name='zhili' value='$(zhili<%=minute(now)%><%=second(now)%>)'/>
<postfield name='usejj' value='$(usejj<%=minute(now)%><%=second(now)%>)'/>
<postfield name='mmwt' value='$(mmwt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='wtda' value='$(wtda<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("id")%>'/>
<postfield name='yxxe' value='$(yxxe<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>-----------<br/>
<a href="Kyzc_Usegl.asp?Action=View&amp;id=<%=id%>&amp;Page=<%=Page%>&amp;adminmid=<%=request("adminmid")%>">返回会员资料</a><br/>
<%
end if


Rs.close
Set rs= Nothing

elseif Action="xgcl" then 

Page=usb(request("Page"))
skin=usb(request("skin"))
usename=usb(request("usename"))
useklsj=usb(request("useklsj"))
useklmm=usb(request("useklmm"))
regtimes=usb(request("regtimes"))
usejf=usb(request("usejf"))
myzuan=usb(request("myzuan"))
rmb=usb(request("rmb"))
ml=usb(request("ml"))
tili=usb(request("tili"))
love=usb(request("love"))
caihua=usb(request("caihua"))
qs=usb(request("qs"))
tianshu=usb(request("tianshu"))
zhili=usb(request("zhili"))
usejj=request("usejj")
mmwt=request("mmwt")
wtda=request("wtda")
nianji=request("nianji")
xl=request("xl")
xf=request("xf")
id=request("id")
yxxe=request("yxxe")
if session("Adminid")="1" then

'----识别错误并跳转-----
if nianji>18 then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=5"
if xl>6 then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=6"
if yxxe<>"t22t.cn" then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=1"
if usename="" then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=2"
if useklsj="" then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=3"
if useklmm="" then response.redirect "Kyzc_Usegl.asp?Action=xxgg&id="&id&"&Page="&Page&"&adminmid="&request("adminmid")&"&cw=4"
'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
if skin<>"" then rs("skin")=skin
if usename<>"" then rs("usename")=usename
if useklsj<>"" then rs("useklsj")=useklsj
if useklmm<>"" then rs("useklmm")=useklmm
if regtimes<>"" then rs("regtimes")=regtimes
if usejf<>"" then rs("usejf")=usejf
if myzuan<>"" then rs("myzuan")=myzuan
if rmb<>"" then rs("rmb")=rmb
if ml<>"" then rs("ml")=ml
if tili<>"" then rs("tili")=tili
if love<>"" then rs("love")=love
if nianji<>"" then rs("nianji")=nianji
if xl<>"" then rs("xl")=xl
if xf<>"" then rs("xf")=xf
if caihua<>"" then rs("caihua")=caihua
if qs<>"" then rs("qs")=qs
if tianshu<>"" then rs("tianshu")=tianshu
if zhili<>"" then rs("zhili")=zhili
if usejj<>"" then rs("usejj")=usejj
if mmwt<>"" then rs("mmwt")=mmwt
if wtda<>"" then rs("wtda")=wtda
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
成功修改会员<u>[<%=ubb(usename)%>]</u>的资料<br/>
<%
else
Response.Write "欢迎参观本系统,请不要做任何修改,谢谢!<br/>"
end if
%>
----------<br/>
<a href="Kyzc_Usegl.asp?Action=View&amp;id=<%=id%>&amp;Page=<%=Page%>&amp;adminmid=<%=request("adminmid")%>">返回会员资料</a><br/>
<%
else
%>
请不要提交非法参数！<br/>
<%
end if
if Action<>"main" then 
%>
<a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">返回会员管理</a><br/>
<%end if%>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p>
</card>
</wml>