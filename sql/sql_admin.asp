<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
Dim useip,ipaddr
useip = Request.ServerVariables("REMOTE_ADDR")
Server.ScriptTimeout	=500						
UserPass= "410616"			'系统管理密码，请修改wapforum.cn为你自己的密码！
URL= Request.ServerVariables("URL")
Action= Request("Action")
db="/sql/#sql.mdb"		'记录数据库路径修改为你的数据库路径

dim conn,connstr 
'On Error Resume Next
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
conn.Open connstr
If Err Then
	err.Clear
	Set conn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If

If Session("AdminPassWord")<>UserPass Then
  If Request.Form("LPass")<>"" Then
    If Request.Form("LPass")=UserPass Then
      Session("AdminPassWord")=UserPass
      Call Main()
    Else
	 response.write"验证失败！"
    End If
  Else
	Call Login()
  End If
  Response.End
Else
	If Action="del" Then
		Call Delip()
	ElseIf Action="lock" Then
		Call lockIP()
	ElseIf Action="unlock" Then
		Call UnLockip()
	ElseIf Action="Logout" Then
		Call Logout()
	Else
		Call Main()
	End If
End If

Sub Login()
	%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='管理登陆' >
<p>请输入管理密码
<br/><input type='password' name='LPass' title='登陆密码' size='10' maxlength='20'/>
<br/><anchor>[-提交-]
<go href='<%=URL%>' method='post' accept-charset='utf-8'>
<postfield name='LPass' value='$(LPass)'/>
</go>
</anchor>
<br/><a href='sql_admin.asp'>[-取消-]</a>
</p>
</card>
</wml>  
<%
End Sub

Sub Delip()
dim id 
id = clng(request("id"))
conn.execute("delete from SqlIn where id="&id)
Call Main()
End sub

Sub Lockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=true where id="&id)
Call Main()
End sub

Sub UnLockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=False where id="&id)
Call Main()
End sub

Sub Logout()
	Session("AdminPassWord")="NUll"
	Response.Redirect URL
End Sub

Sub Main()
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='IP禁止管理' >
<p>
<%=useip%><br/>
<%
sql="select * from SqlIn order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂未发现数据!"
else
'分页的实现 
If Request.QueryString("Page") = "" or Request.QueryString("Page") <= 0 then	
Page = 1
Else
Page = CINT(Request.QueryString("Page"))
End If
rs.pagesize =10
total  = rs.RecordCount
rs.absolutepage=page
mypagesize = rs.pagesize%>
<%=total%>条记录，<%=page%>/<%=rs.pagecount%>页<br/>
<%	dim i 
	   	i=1  
do while not rs.eof and i<=mypagesize %>
<%=((page-1)*10+i)%>.手机号/IP地址:<br/>
<%=rs("SqlIn_IP")%>(<%=rs("SqlIn_TIME")%>) <a href='<%=URL%>?action=del&amp;id=<%=rs("id")%>'>删除</a><br/>
<%
i=i+1
rs.movenext
loop%>
<%filename=URL%>
<%if page>1 then%><a href='<%=filename%>?page=<%=page-1%>'>上页</a><%end if%>
<%if page<rs.pagecount then%>
<a href='<%=filename%>?page=<%=page+1%>'>下页</a><%end if%> 
<%end if%> 
<br/>封锁：<input type='text' name='shuoji<%=minute(now)%><%=second(now)%>' format='*M' emptyok='false' size='20' />
<br/><anchor>[-提交-]
<go href='shouji_save.asp' method='post' accept-charset='utf-8'>
<postfield name='shuoji' value='$(shuoji<%=minute(now)%><%=second(now)%>)'/>
</go>
</anchor>
<br/>------------
<br/><a href='/sql/sql_admin.asp'>后台管理</a><%end sub%></p>
</card>
</wml> 