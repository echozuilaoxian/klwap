<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="SQL防注入系统管理" >
<p>
<%
URL						= Request.ServerVariables("URL")
Action					= Request("Action")
db						="/sql/#sql.mdb"		'记录数据库路径修改为你的数据库路径


dim connyy,connstryy 
Set connyy = Server.CreateObject("ADODB.Connection")
connstryy="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
connyy.Open connstryy
If Err Then
	err.Clear
	Set connyy = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If
page=Request("page")
%>
<%
	If Action="del" Then
		Call Delip()
	ElseIf Action="lock" Then
		Call lockIP()
	ElseIf Action="unlock" Then
		Call UnLockip()
	Else If Action="Logout" Then
		Call Logout()
	End If
	End If
%>
<%
Sub Delip()
dim id 
id = clng(request("id"))
connyy.execute("delete from SqlIn where id="&id)
End sub

Sub Lockip()
id = clng(request("id"))
connyy.execute("update SqlIn set Kill_ip=true where id="&id)
End sub

Sub UnLockip()
id = clng(request("id"))
connyy.execute("update SqlIn set Kill_ip=False where id="&id)
End sub
%>
<%
sql="select * from SqlIn order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,connyy,1,1
if rs.eof and rs.bof then
	response.write "-------------<br/>暂无内容"
else

'分页的实现 
listnum=2
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
<b><u>SQL防注入系统管理</u></b><br/><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small><br/>-------------<br/>

<%do while not rs.eof and j<=listnum%>
<u>第<b><%=(j+(page-1)*listnum)%></b>条记录</u><br/>

操作ＩＰ:<anchor title="submit"><b><%=rs("SqlIn_IP")%></b>
<go href="http://wap.ip138.com/ip.asp" method="post">
<postfield name="ip" value="<%=rs("SqlIn_IP")%>"></postfield>
</go>
</anchor><br/>
是否锁定:<b><%	if rs("Kill_ip")=true then 
			response.write "已锁定"
		else
			response.write "已解锁!"
		end if
	%><br/></b>
<%'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================%>
操作页面:<b><%=rs("SqlIn_WEB")%></b><br/>
操作时间:<b><%=rs("SqlIn_TIME")%></b><br/>
提交方式:<b><%=rs("SqlIn_FS")%></b><br/>
提交参数:<b><%=rs("SqlIn_CS")%></b><br/>
提交数据:<b><%=rs("SqlIn_SJ")%></b><br/>
解锁锁定:<b><%if rs("Kill_ip")=true then 
			response.write "<a href='"&name&"?adminmid="&request("adminmid")&"&amp;page="&page&"&amp;action=unlock&amp;id="&rs("id")&"'>解锁IP</a>"
		else
			response.write "<a href='"&name&"?adminmid="&request("adminmid")&"&amp;page="&page&"&amp;action=lock&amp;id="&rs("id")&"'>锁定IP</a>"
		end if
	%></b><br/>
相关操作:<b><a href='<%=URL%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page%>&amp;action=del&amp;id=<%=rs("id")%>'>删除该IP</a></b><br/>

<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>">首页</a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>">末页</a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
封锁IP：<br/>
<input type='text' name='shuoji<%=minute(now)%><%=second(now)%>' format='*M' emptyok='false' size='20' />
<br/><anchor>[提交]
<go href='/Sql/admin_Sql.asp' method='post' accept-charset='utf-8'>
<postfield name='shuoji' value='$(shuoji<%=minute(now)%><%=second(now)%>)'/>
</go>
</anchor><br/>
------------<br/>
<a href="/index.asp">返回网站首页</a>
<br/>
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