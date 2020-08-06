<%
'--------数据库连接部分--------------
dim dbkillSql,killSqlconn,connkillSql
dbkillSql="/sql/ysqlp.asa" 
'On Error Resume Next
Set killSqlconn = Server.CreateObject("ADODB.Connection")
connkillSql="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(dbkillSql)
killSqlconn.Open connkillSql
If Err Then
	err.Clear
	Set killSqlconn = Nothing
	Response.Write "数据库连接出错，请检查连接字串。"
	Response.End
End If


'--------定义部份------------------
Dim Fy_Post,Fy_Get,Fy_In,Fy_Inf,Fy_Xh,Fy_db,Fy_dbstr,Kill_IP,WriteSql
'自定义需要过滤的字串,用 "|" 分隔
Fy_In = "and|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare"
Kill_IP=True
WriteSql=True			
'----------------------------------


Fy_Inf = split(Fy_In,"|")
'--------POST部份------------------
If Request.Form<>"" Then
	For Each Fy_Post In Request.Form
		For Fy_Xh=0 To Ubound(Fy_Inf)
			If Instr(LCase(Request.Form(Fy_Post)),Fy_Inf(Fy_Xh))<>0 Then
				If WriteSql=True Then
					killSqlconn.Execute("insert into SqlIn(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','POST','"&Fy_Post&"','"&replace(Request.Form(Fy_Post),"'","''")&"')")
					killSqlconn.close
					Set killSqlconn = Nothing
				End If
                                Response.Write "<wml>" 
                                Response.Write "<head>"
                                Response.Write "<meta http-equiv='Cache-Control' content='no-Cache'/>"
                                Response.Write "<meta http-equiv='Cache-Control' content='max-age=0'/>"
                                Response.Write "</head>"
                                Response.Write "<card id='main' title='警告' >"
                                Response.Write "<p>"
				Response.Write "SQL通用防注入系统提示你!"
				Response.Write "请不要在参数中包含非法字符尝试注入!"
				Response.Write "非法操作！系统做了如下记录<br/>"
				Response.Write "操作ＩＰ："&Request.ServerVariables("REMOTE_ADDR")&"<br/>"
				Response.Write "操作时间："&Now&"<br/>"
				Response.Write "操作页面："&Request.ServerVariables("URL")&"<br/>"
				Response.Write "提交方式：POST<br/>"
				Response.Write "提交参数："&Fy_Post&"<br/>"
				Response.Write "提交数据："&Request.Form(Fy_Post)
                                Response.Write "</p>"
                                Response.Write "</card>"
                                Response.Write "</wml>"
				Response.End
			End If
		Next
	Next
End If
'----------------------------------

'--------GET部份-------------------
If Request.QueryString<>"" Then
	For Each Fy_Get In Request.QueryString
		For Fy_Xh=0 To Ubound(Fy_Inf)
			If Instr(LCase(Request.QueryString(Fy_Get)),Fy_Inf(Fy_Xh))<>0 Then
				If WriteSql=True Then
					killSqlconn.Execute("insert into SqlIn(Sqlin_IP,SqlIn_Web,SqlIn_FS,SqlIn_CS,SqlIn_SJ) values('"&Request.ServerVariables("REMOTE_ADDR")&"','"&Request.ServerVariables("URL")&"','GET','"&Fy_Get&"','"&replace(Request.QueryString(Fy_Get),"'","''")&"')")
				killSqlconn.close
				Set killSqlconn = Nothing
				End If
                                Response.Write "<wml>" 
                                Response.Write "<head>"
                                Response.Write "<meta http-equiv='Cache-Control' content='no-Cache'/>"
                                Response.Write "<meta http-equiv='Cache-Control' content='max-age=0'/>"
                                Response.Write "</head>"
                                Response.Write "<card id='main' title='警告' >"
                                Response.Write "<p>"
				Response.Write "SQL通用防注入系统提示你!"
				Response.Write "请不要在参数中包含非法字符尝试注入!"
				Response.Write "非法操作！系统做了如下记录<br/>"
				Response.Write "操作ＩＰ："&Request.ServerVariables("REMOTE_ADDR")&"<br/>"
				Response.Write "操作时间："&Now&"<br/>"
				Response.Write "操作页面："&Request.ServerVariables("URL")&"<br/>"
				Response.Write "提交方式：GET<br/>"
				Response.Write "提交参数："&Fy_Get&"<br/>"
				Response.Write "提交数据："&Request.QueryString(Fy_Get)
                                Response.Write "</p>"
                                Response.Write "</card>"
                                Response.Write "</wml>"
				Response.End
			End If
		Next
	Next
End If

If Kill_IP=True Then
	Dim Sqlin_IP,rsKill_IP,Kill_IPsql
        Sqlin_IP = right(Request.ServerVariables("HTTP_X_UP_CALLING_LINE_ID"),11)
        If Sqlin_IP = "" Then Sqlin_IP = Request.ServerVariables("REMOTE_ADDR")
	Kill_IPsql="select Sqlin_IP,Kill_ip from SqlIn where Sqlin_IP='"&Sqlin_IP&"' and Kill_ip=True"
	Set rsKill_IP=killSqlconn.execute(Kill_IPsql)
	If Not(rsKill_IP.eof or rsKill_IP.bof) Then
               Response.Write "<wml>" 
               Response.Write "<head>"
               Response.Write "<meta http-equiv='Cache-Control' content='no-Cache'/>"
               Response.Write "<meta http-equiv='Cache-Control' content='max-age=0'/>"
               Response.Write "</head>"
               Response.Write "<card id='main' title='警告' >"
               Response.Write "<p>"
	       Response.Write "你的ＩＰ已经被封，请与管理员<a href='/pic/index.asp'>联系</a>!"
               Response.Write "</p>"
               Response.Write "</card>"
                Response.Write "</wml>"
	Response.End
	End If
	rsKill_IP.close
	
End If
%>