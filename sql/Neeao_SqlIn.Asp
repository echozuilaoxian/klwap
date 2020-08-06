<%
'Option Explicit'开启强制变量定义

'--------版权说明------------------
'SQL通用防注入程序 V3.1 β
'2.0强化版，对代码做了一点优化，加入自动封注入者Ip的功能！^_^
'3.0版，加入后台登陆查看注入记录功能，方便网站管理员查看非法记录，以及删除以前的记录，是否对入侵者Ip解除封锁！
'3.1 β版，加入对cookie部分的过滤，加入了对用js书写的asp程序的支持！
'3.1最终纪念版
'   * 对于3.1beta版中由于加入的对于js程序过滤的功能而引起的安全问题做了修正。
'   * 对于3.1beta版可能引起的跨站攻击做了修正。
'   * 将3.1beta版中的安全表单升级为安全页面，使程序的针对性更强，下面将做演示！
'   * 如无大的问题，此版本为最终纪念版，以后本人将不再对此程序做更新！
'3.2版 beta，更新了Option Explicit选项打开系统无法正常使用的bug。
'3.2版 beta 20080820,修补一处错误导致阻止ip无法使用，^_^。
'Neeao站点：http://www.neeao.com 
'Mail:neeaocn[AT]Gamil.com
'***********************************

'--------数据库连接部分--------------
Dim Neeao_Inject_Data_Name,Neeao_Inject_conn,Neeao_Inject_Data_Str
'数据库地址,安装前请修改之
Neeao_Inject_Data_Name = "#sql.mdb" 

Set Neeao_Inject_conn = Server.CreateObject("ADODB.Connection")
Neeao_Inject_Data_Str = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(Neeao_Inject_Data_Name)
'On Error Resume Next
Neeao_Inject_conn.Open Neeao_Inject_Data_Str
If Err Then
	err.Clear
	Set Neeao_Inject_conn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If


'--------定义部份------------------
Dim Neeao_Application_Value
Dim Neeao_Post,Neeao_Get,Neeao_Inject,Neeao_Inject_Keyword,Neeao_Kill_IP,Neeao_Write_Data
Dim Neeao_Alert_Url,Neeao_Alert_Info,Neeao_Kill_Info,Neeao_Alert_Type
Dim Neeao_Sec_Forms,Neeao_Sec_Form_open,Neeao_Sec_Form

If IsArray(Application("Neeao_config_info"))=False Then Call PutApplicationValue()
Neeao_Application_Value = Application("Neeao_config_info")
'获取配置信息
Neeao_Inject = Neeao_Application_Value(0)
Neeao_Kill_IP = Neeao_Application_Value(1) 
Neeao_Write_Data = Neeao_Application_Value(2)
Neeao_Alert_Url = Neeao_Application_Value(3)
Neeao_Alert_Info = Neeao_Application_Value(4)
Neeao_Kill_Info = Neeao_Application_Value(5)
Neeao_Alert_Type = Neeao_Application_Value(6)
Neeao_Sec_Forms = Neeao_Application_Value(7)
Neeao_Sec_Form_open = Neeao_Application_Value(8)

'安全页面参数
Neeao_Sec_Form = split(Neeao_Sec_Forms,"|")
Neeao_Inject_Keyword = split(Neeao_Inject,"|")

If Neeao_Kill_IP=1 Then Stop_IP

If Request.Form<>"" Then StopInjection(Request.Form)

If Request.QueryString<>"" Then StopInjection(Request.QueryString)

If Request.Cookies<>"" Then StopInjection(Request.Cookies)


Function Stop_IP()
	Dim Sqlin_IP,rsKill_IP,Kill_IPsql
	Sqlin_IP=Request.ServerVariables("REMOTE_ADDR")
	Kill_IPsql="select Sqlin_IP from SqlIn where Sqlin_IP='"&Sqlin_IP&"' and kill_ip=true"
	Set rsKill_IP=Neeao_Inject_conn.execute(Kill_IPsql)
	If Not(rsKill_IP.eof or rsKill_IP.bof) Then
		N_Alert(Neeao_Kill_Info)
	Response.End
	End If
	rsKill_IP.close	
End Function



'sql通用防注入主函数
Function StopInjection(values)
	Dim Neeao_Get,Neeao_i
	For Each Neeao_Get In values

		If Neeao_Sec_Form_open = 1 Then 
			For Neeao_i=0 To UBound(Neeao_Sec_Form)
				If Instr(LCase(SelfName),Neeao_Sec_Form(Neeao_i))> 0 Then 
					Exit Function
				else
					Call Select_BadChar(values,Neeao_Get)
				End If 
			Next
			
		Else
			Call Select_BadChar(values,Neeao_Get)
		End If 
	Next
End Function 

Function Select_BadChar(values,Neeao_Get)
	Dim Neeao_Xh
	Dim Neeao_ip,Neeao_url,Neeao_sql
	Neeao_ip = Request.ServerVariables("REMOTE_ADDR")
	Neeao_url = Request.ServerVariables("URL")

	For Neeao_Xh=0 To Ubound(Neeao_Inject_Keyword)
		If Instr(LCase(values(Neeao_Get)),Neeao_Inject_Keyword(Neeao_Xh))<>0 Then
			If Neeao_Write_Data = 1 Then				
				Neeao_sql = "insert into SqlIn(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ) values('"&Neeao_ip&"','"&Neeao_url&"','"&intype(values)&"','"&Neeao_Get&"','"&N_Replace(values(Neeao_Get))&"')"
				'response.write Neeao_sql
				Neeao_Inject_conn.Execute(Neeao_sql)
				Neeao_Inject_conn.close
				Set Neeao_Inject_conn = Nothing
			
			End If			
			N_Alert(Neeao_Alert_Info)
			Response.End
		End If
	Next
End Function

'输出警告信息
Function N_Alert(Neeao_Alert_Info)
	Dim str
	'response.write "test"
	str = "<"&"Script Language=JavaScript"&">"
	Select Case Neeao_Alert_Type
		Case 1
			str = str & "window.opener=null; window.close();"
		Case 2
			str = str & "alert('"&Neeao_Alert_Info&"Http://Www.Neeao.Com\n\nBy:Neeao');window.opener=null; window.close();"
		Case 3
			str = str & "location.href='"&Neeao_Alert_Url&"';"
		Case 4
			str = str & "alert('"&Neeao_Alert_Info&"');location.href='"&Neeao_Alert_Url&"';"
	end Select
	str = str & "<"&"/Script"&">"
	response.write  str
End Function 

'判断注入类型函数
Function intype(values)
	Select Case values
		Case Request.Form
			intype = "Post"
		Case Request.QueryString
			intype = "Get"
		Case Request.Cookies
			intype = "Cookies"
	end Select
End Function

'干掉xss脚本
Function N_Replace(N_urlString)
	N_urlString = Replace(N_urlString,"'","''")
    N_urlString = Replace(N_urlString, ">", "&gt;")
    N_urlString = Replace(N_urlString, "<", "&lt;")
    N_Replace = N_urlString
End Function

Sub  PutApplicationValue()
	dim  infosql,rsinfo
	set rsinfo=Neeao_Inject_conn.execute("select N_In,Kill_IP,WriteSql,alert_url,alert_info,kill_info,N_type,Sec_Forms,Sec_Form_open	from config")
	Redim ApplicationValue(9)
	dim i
	for i=0 to 8
		ApplicationValue(i)=rsinfo(i)
	next
	set rsinfo=nothing
	Application.Lock
	set Application("Neeao_config_info")=nothing
	Application("Neeao_config_info")=ApplicationValue
	Application.unlock
end Sub

'获取本页文件名
Function SelfName()
    SelfName = Mid(Request.ServerVariables("URL"),InstrRev(Request.ServerVariables("URL"),"/")+1)
End Function

%>

    