<%
dim Rsipcc,Sqlqqcc,ipcc,ip,ipp,ipzr,ipzrr
set Rsipcc=server.createobject("adodb.recordset")
                Sqlqqcc="select [ipzr] from [zrsz]"
                Rsipcc.open sqlqqcc,conn,1,1
                ipcc=Rsipcc("ipzr")    '设置注入次数
Rsipcc.close
set Rsipcc=nothing
Dim Fy_Post,Fy_Get,Fy_In,Fy_Inf,Fy_Xh,Fy_db,Fy_dbstr
Fy_In = "|and|exec|insert|select|delete|update|count|%|chr|mid|master|truncate|char|declare|or|'"
Fy_Inf = split(Fy_In,"|")
If Request.Form<>"" Then
For Each Fy_Post In Request.Form  'POST提交
For Fy_Xh=1 To Ubound(Fy_Inf)
If Instr(LCase(Request.Form(Fy_Post)),Fy_Inf(Fy_Xh))<>0 Then
                ip=Request.ServerVariables("REMOTE_ADDR")
                set ipzr=server.createobject("adodb.recordset")
                Sqlqq="select * from [zrip]"
                ipzr.open sqlqq,conn,1,3
                if not (ipzr.bof and ipzr.eof) then
                if ip=ipzr("ip") and ipzr("ipnum")>=ipcc then  '设置限制并跳转
                response.redirect "/getout.asp"
                end if
                if ip=ipzr("ip") and ipzr("ipnum")<ipcc then         
                sql="update zrip set ipnum=ipnum+1"             '注入一次加1
                conn.Execute(sql)
                End If
                else
                ipzr.addnew
                ipzr("ip")=ip
                ipzr("time")=now()
                ipzr.update()
End If
ipzr.close
set ipzr=nothing
                response.redirect "/getout.asp?o=1"
response.end
End If
Next
Next
End If
If Request.QueryString<>"" Then
For Each Fy_Get In Request.QueryString        'GET提交
For Fy_Xh=1 To Ubound(Fy_Inf)
If Instr(LCase(Request.QueryString(Fy_Get)),Fy_Inf(Fy_Xh))<>0 Then
                ipp=Request.ServerVariables("REMOTE_ADDR")
                set ipzrr=server.createobject("adodb.recordset")
                Sqlqqq="select * from [zrip]"
                ipzrr.open sqlqqq,conn,1,3
                if not (ipzr.bof and ipzrr.eof) then
                if ip=ipzrr("ip") and ipzrr("ipnum")>=ipcc then  '设置限制并跳转
                response.redirect "/getout.asp"
                end if
                if ip=ipzrr("ip") and ipzrr("ipnum")<ipcc then   
                sql="update zrip set ipnum=ipnum+1"
                conn.Execute(sql)
                End If
                else
                ipzrr.addnew
                ipzrr("ip")=ipp
                ipzrr("time")=now()
                ipzrr.update()
End If
ipzrr.close
set ipzrr=nothing
response.redirect "/getout.asp?o=2"
response.end
End If
Next
Next
End If
%>