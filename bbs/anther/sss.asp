<%
function sqlstr2(data)
   sqlstr2="'" & Replace(data,"'","'") & "'"
end function

function usb2(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"master","")
	str=replace(str,"truncate","")
	str=replace(str,"declare","")
	str=replace(str,"insert","")
	str=replace(str,"select","")
  str=replace(str,"delete","")
  str=replace(str,"update","")
  str=replace(str,"eval","")
  str=replace(str,"exec","")
  str=replace(str,"and","")
  str=replace(str,"or","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
  str=replace(str,Chr(10),"")
  str=replace(str,Chr(13),"")
	usb2=str
end function

dim cccc
cccc=clng(request("cccc"))

if cccc<>1 then
dim my668_pou,my668_var,my668_ss
my668_pou=request.ServerVariables("SCRIPT_NAME")
my668_var=replace(request.ServerVariables("QUERY_STRING"),"&","&amp;")
my668_ss=my668_pou&"?cccc=1&amp;"&my668_var
%>
请输入查看密码：<br/>
<input name="my668_pass" format="*m" maxlength="20"/><br/><br/>
<anchor>确认提交密码
    <go href="<%=my668_ss%>" method="post" accccept-charset="utf-8">
        <postfield name="my668_pass" value="$(my668_pass)"/>
    </go>
</anchor>
<br/>--------<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>
<%
response.write "</p></card></wml>"
response.end
else
dim my668_pass2
my668_pass2=left(trim(usb2(request("my668_pass"))),20)

	if cccc=1 then
		if my668_pass2="" then
    response.write "密码不能为空!<br/>"
    response.write "<anchor><prev/>重新输入</anchor><br/>--------<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>"
    response.end
		else
		dim ssss,rs2,sql2
		set ssss=server.Createobject("ADODB.Connection")
		ssss.ConnectionString="DBQ="&server.mappath("#my668_net")&";DRIVER={Microsoft Access Driver (*.mdb)};"
		ssss.open
		set rs2=Server.CreateObject("ADODB.Recordset")
		sql2="select [id] from [my668_net] where [pass]=" & sqlstr2(my668_pass2) & " and [id]=22"
		rs2.open sql2,ssss,1,1
			if rs2.eof then
			response.write "密码错误!<br/>"
			response.write "<anchor><prev/>重新输入</anchor>"
			response.write "<br/>--------<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
			response.end
			end if
		rs2.close
		set rs2=nothing
		ssss.close
		set ssss=nothing
		end if
	else
	response.write "系统错误!<br/>"
	response.write "<anchor><prev/>重新输入</anchor><br/>--------<br/><a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a>"
	response.write "</p></card></wml>"
	response.end
	end if
end if
%>