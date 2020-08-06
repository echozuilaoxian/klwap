<%
Server.ScriptTimeout	=500						
UserPass				= "410616"			'系统管理密码，请修改neeao为你自己的密码！
URL						= Request.ServerVariables("URL")
Action					= Request("Action")
db						="#sql.mdb"		'记录数据库路径修改为你的数据库路径


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
	Select Case Action
		Case "Del"
			Call Delip()
		Case "lock"
			Call lockIP()
		Case "unlock"
			Call UnLockip()
		Case "Logout"
			Call Logout()
		Case "config"
			Call config()
		Case "saveconfig"
			Call saveconfig()
		Case Else 
			Call Main()
	end Select
End If

Sub Login()
	%>
<title>Sql通用防注入系统3.2</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <style type="text/css">
<!--

table {
	font: 14px Tahoma, Verdana, "宋体";
}
a:link, a:visited {
	text-decoration: none;
	color: #036;
	font-family: Tahoma, Verdana, "宋体";
}
a:hover {
	text-decoration: none;
	color: #999999;
	font-family: Tahoma, Verdana, "宋体";
}
body {
	font-size: 9pt;
	color: #999999;
}
-->
  </style>
<table border="1" width="500" height="120" bgcolor="#DDDDDD" cellpadding="3" bordercolorlight="#000000" bordercolordark="#F2F2F9" cellspacing="0" align=center>
<tr>
<td width="100%" height="30%" bgcolor="#808080"><p align="center">
<font color="#FFFFFF" face="Verdana" style="font-size: 9pt"><B>SQL通用防注入系统管理登陆</B></font></td>
</tr>
<tr>
<td width="100%" height="70%"><form method="POST" action="<%=URL%>">
<center><p><font face="Verdana">
  <span style="font-size: 9pt">Password: <input type="password" name="LPass"
size="20" style="background-color:#DDDDDD; border-left: none; border-right: none; border-top: none; border-bottom: solid 1px"> 
<input type="submit" value="Login" name="B1" style="border: thin outset"></span></font></p>
      </center>
    </form>
    </td>
  </tr>
</table>
    <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>系统更新记录：
          <textarea name="textfield" cols="70" rows="20">更新记录：
2.0增强版 增加了自动封注入者Ip功能，使注入者不能再访问本站！
3.0版 在2.0增强版的基础上，加入了后台管理功能：
可以查看入侵者提交数据记录功能，解除对注入者ip封锁，以及删除注入记录功能！
v3.1beta版 对核心代码做了优化，去除了一个没用的循环，使程序执行速度更快！
 使程序执行速度更快自定义警告信息，解决对post过滤而不能正常发贴问题,
 解决js和vbs通用问题,做到了真正意义上的asp通用防注入
3.1最终纪念版
   * 对于3.1beta版中由于加入的对于js程序过滤的功能而引起的安全问题做了修正。
   * 对于3.1beta版可能引起的跨站攻击做了修正。
   * 将3.1beta版中的安全表单升级为安全页面，使程序的针对性更强，下面将做演示！
   * 如无大的问题，此版本为最终纪念版，以后本人将不再对此程序做更新！
 3.2版，更新了Option Explicit选项开启系统无法正常使用的bug。
 3.2版 beta 20080820,修补一处错误导致阻止ip无法使用，^_^。
 </textarea>
       </td>
      </tr>
    </table>     
    <hr width="500" noshade>
    <div align="center">SQL通用防注入系统 3.2 beta (c)2008-8-3<BR>
      <A href="http://www.neeao.com" target=_blank>Code By Neeao</A> <a href="Http://www.cnbct.org">Bug.Center.Team-漏洞预警中心小组</a>    </div>
    <p>
        <%
End Sub

Sub Main()
	Call header()
%>
<script language="JavaScript">
<!--
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
//-->
</script> 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr align=center bgcolor=#FFFFFF>
<%
sql="select * from SqlIn order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无内容"
else
'分页的实现 
listnum=20
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
i=0
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
 <td height=20>编号</td>
 <td><font color=red>操作ＩＰ</font></td>
 <td>是否锁定</td>
 <td>操作</td>
 <td>操作页面</td>
 <td>操作时间</td>
 <td>提交方式</td>
 <td>提交参数</td>
 <td>提交数据</td>
 
</tr>
<%do while not rs.eof and i<listnum
n=n+1%>
<form action="<%=url%>?Action=Del" method=post name=check>
<tr align=center bgcolor="#FFFFFF" height=22>
 <td><input name="ID" type="checkbox" id="ID" value=<%=rs("id")%>><%=n%></td>
 <td><%=rs("SqlIn_IP")%>
</td>

<td><%	if rs("Kill_ip")=true then 
			response.write "<font color='red'>已锁定</font>"
		else
			response.write "<font color='green'>已解锁</font>"
		end if
	%></td>
 <td>
 <%	if rs("Kill_ip")=true then 
			response.write "<a href="&URL&"?action=unlock&id="&rs("id")&">解锁IP</a>"
		else
			response.write "<a href="&URL&"?action=lock&id="&rs("id")&">锁定IP</a>"
		end if
	%>
 
 </td>
 <td><%=rs("SqlIn_WEB")%></td>
 <td><%=rs("SqlIn_TIME")%></td>
 <td><%=rs("SqlIn_FS")%></td>
 <td><%=rs("SqlIn_CS")%></td>
 <td><%=N_Replace(rs("SqlIn_SJ"))%></td>
</tr>
<%rs.movenext 
i=i+1 
j=j-1
loop%>
<tr bgcolor="#FFFFFF">
<%filename=URL%>
<td colspan=9 align=right><%=Rs.recordcount%> 条记录&nbsp;&nbsp;<%=listnum%> 条记录/页&nbsp;&nbsp;共 <%=rs.pagecount%> 页 
      <% if page=1 then %>
      <%else%>
      <a href=<%=filename%>><strong>|<<</strong></a>
      <a href=<%=filename%>?page=<%=page-1%>><strong><<</strong></a>
      <a href=<%=filename%>?page=<%=page-1%>><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
	  <% if rs.pagecount-page <> 0 then %>
      <a href=<%=filename%>?page=<%=page+1%>><b>[<%=page+1%>]</b></a>
      <a href=<%=filename%>?page=<%=page+1%>><strong>>></strong></a>
      <a href=<%=filename%>?page=<%=rs.pagecount%>><strong>>>|</strong></a>
	  <%end if%>
	  <input name="chkall" type="checkbox" id="chkall" value="select" onclick="CheckAll(this.form)" style="border:0">全选
	  <input type=submit name=action value="删除" style="font-size: 9pt;  color: #000000; background-color: #EAEAF4; solid #EAEAF4" >
	  </td>
<%end if%>
</form>
</tr> 
</table>
<%
	Call footer()
end Sub

sub config()
	Call header()
	Set rsinfo=conn.execute("select * from config")
	N_In		= rsinfo("N_In")
	Kill_IP		= rsinfo("Kill_IP")			
	WriteSql	= rsinfo("WriteSql")		
	alert_url	= rsinfo("alert_url")
	alert_info	= rsinfo("alert_info")
	kill_info	= rsinfo("kill_info")
	N_type		= rsinfo("N_type")
	Sec_Forms	= rsinfo("Sec_Forms")
	Sec_Form_open = rsinfo("Sec_Form_open")
	rsinfo.close
	Set rsinfo=Nothing 

%>

<table width="730" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" align="center">系统设置<br></td>
  </tr>
  <tr>
    <td><table width="100%" bordercolor="#000000" style="border-collapse:collapse; "  border="1" cellspacing="5" cellpadding="0">
	<form name="form" method="post" action="<%=url%>?action=saveconfig">
		<tr>
        <td  align="left">需要过滤的关键字：</td>
        <td>&nbsp; <input name="N_In" type="text" value="<%=N_In%>" id="r_str" style=" " size="50">
        用&quot;|&quot;分开</td>
      </tr>
      <tr>
        <td>是否记录入侵者信息：</td>
        <td>&nbsp; <select name="WriteSql" id="r_kill">
          <option value="1" <%if WriteSql=1 Then response.write "selected"%>>是</option>
          <option value="0" <%if WriteSql=0 Then response.write "selected"%>>否</option>
        </select></td>
      </tr>
      <tr>
        <td>是否启用锁定IP：</td>
        <td>&nbsp; <select name="Kill_IP" id="r_kill">
          <option value="1" <%if Kill_IP=1 Then response.write "selected"%>>是</option>
          <option value="0" <%if Kill_IP=0 Then response.write "selected"%>>否</option>
        </select></td>
      </tr>
      <tr>
        <td>是否启用安全页面：</td>
        <td>&nbsp; <select name="Sec_Form_open" id="r_kill">
          <option value="1" <%if Sec_Form_open=1 Then response.write "selected"%>>是</option>
          <option value="0" <%if Sec_Form_open=0 Then response.write "selected"%>>否</option>
        </select>
		慎用这个功能，除非你对确认此页面无需过滤，并确定对安全没影响！
		</td>
      </tr>
	  <tr>
        <td>您认为安全的页面：</td>
        <td>&nbsp; <input name="Sec_Forms" type="text" value="<%=Sec_Forms%>" id="r_str" style=" " size="50">
        用&quot;|&quot;分开</td>
      </tr>
      <tr>
        <td>出错后的处理方式：</td>
        <td>&nbsp; <select name="N_type" id="r_kill">
          <option value="1" <%if N_type=1 Then response.write "selected"%>>直接关闭网页</option>
          <option value="2" <%if N_type=2 Then response.write "selected"%>>警告后关闭</option>
		  <option value="3" <%if N_type=3 Then response.write "selected"%>>跳转到指定页面</option>
		  <option value="4" <%if N_type=4 Then response.write "selected"%>>警告后跳转</option>
        </select></td>
      </tr>
	<tr>
        <td>出错后跳转Url：</td>
        <td>&nbsp; <input name="alert_url" type="text" value="<%=alert_url%>" id="r_str" style=" " size="30">注意，这里的都是半角符号，就是英文的！
		</td>
      </tr>
      <tr>
        <td>警告提示信息：</td>
        <td>&nbsp; <textarea name="alert_info" cols="45" rows="4" id="r_err2" style=";  "><%=alert_info%></textarea>\n\n换行，
		</td>
      </tr>
	  <tr>
        <td>阻止访问提示信息：</td>
        <td>&nbsp; <textarea name="kill_info" cols="45" rows="4" id="r_err2" style=";  "><%=kill_info%></textarea>\n\n换行
		</td>
      </tr>
      <tr>
        <td colspan="2"><div align="center">
          <input name="enter_3" type="submit" id="enter_3" value="提交">
        </div></td>
        </tr>
	  </form>
    </table></td>
  </tr>
</table>
<%
	Call footer()
end Sub

Sub header()

%>

<title>Sql通用防注入系统3.2-By Neeao (Bug.Center.Team-漏洞预警中心小组)</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--

table {
	font: 14px Tahoma, Verdana, "宋体";
}
a:link, a:visited {
	text-decoration: none;
	color: #036;
	font-family: Tahoma, Verdana, "宋体";
}
a:hover {
	text-decoration: none;
	color: #F90;
	font-family: Tahoma, Verdana, "宋体";
}
body {
	font-size: 9pt;

}
-->
</style>
  <table width="98%" border="0" align="center" cellspacing="0" bgcolor="#CCCCCC">
    <tr>
		<td width="70%" bgcolor="#FFFFFF"><div align="center"><FONT color=#000000>SQL通用防注入系统</FONT></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="?Action=config">系统设置</a></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="<%=URL%>">查看信息</a></div></td>
      <td width="10%" bgcolor="#FFFFFF"><div align="center"><a href="?Action=Logout">退出登陆</a></div></td>
      
    </tr>
</table><br/>
<%

End Sub 
	sub footer()

%>
    <div align="center">Sql通用防注入系统3.2 2008-8-3<BR>
      <A href="http://www.neeao.com" target=_blank>Code By Neeao</A> <a href="Http://www.cnbct.org">Bug.Center.Team-漏洞预警中心小组</a>    </div>

<%
end Sub
Sub Delip()
dim id 
id = request.form("id")
conn.execute("delete from SqlIn where id in ( " & id & ")")
Response.Redirect URL
End sub

Sub Lockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=true where id="&id)
Response.Redirect URL
End sub

Sub UnLockip()
id = clng(request("id"))
conn.execute("update SqlIn set Kill_ip=False where id="&id)
Response.Redirect URL
End sub

Sub Logout()
	Session("AdminPassWord")="NUll"
	Response.Redirect URL
End Sub

Sub saveconfig
	N_In		=replace(request.form("N_In"),"'","''")
	Kill_IP		=request.form("Kill_IP")			
	WriteSql	=request.form("WriteSql")		
	alert_url	=request.form("alert_url")
	alert_info	=request.form("alert_info")
	kill_info	=request.form("kill_info")
	N_type		=request.form("N_type")
	Sec_Forms	=request.form("Sec_Forms")
	Sec_Form_open=request.form("Sec_Form_open")

	sql="update config set N_In='"&N_In&"',Kill_IP="&Kill_IP&",WriteSql="&WriteSql&",alert_url='"&alert_url&"',alert_info='"&alert_info&"',kill_info='"&kill_info&"',N_type="&N_type&",Sec_Forms='"&Sec_Forms&"',Sec_Form_open="&Sec_Form_open&""
	'response.write sql
	conn.execute(sql)
	Application.Lock
	set Application("Neeao_config_info")=nothing
	Application.unlock
	Call main()
End Sub 

Function N_Replace(N_urlString)
	N_urlString = Replace(N_urlString,"'","''")
    N_urlString = Replace(N_urlString, ">", "&gt;")
    N_urlString = Replace(N_urlString, "<", "&lt;")
    N_Replace = N_urlString
End Function
%>