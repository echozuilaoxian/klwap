<!-- #include file="../../conn.asp" -->
<%
'==========================================================
'===========================================================
'//关闭rs
Sub rsClose()
	rs.close
	set rs=nothing
End Sub
'//关闭rss
Sub rssClose()
	rss.close
	set rss=nothing
End Sub

'//关闭conn
Sub connClose()
	conn.Close
	set conn=nothing
End Sub

'//全部关闭
Sub allClose()
	rs.close
	set rs=nothing
	conn.Close
	set conn=nothing
End	Sub

'//全部关闭
Sub alllClose()
	rss.close
	set rss=nothing
	conn.Close
	set conn=nothing
End	Sub

Sub Lasts()
Response.write "<a href='index.asp'>返回友链首页</a><br/>"
Response.write "<a href='/'>返回网站首页</a>"
Response.write "</p></card></wml>"
End Sub

Sub Lastsh()
Response.write "<a href='Admin_index.asp'>返回友链后台</a>"
Response.write "</p></card></wml>"
End Sub


'//过滤字符
function usb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
	str=replace(str,"file:","file：")
	str=replace(str,"files:","files：")
	str=replace(str,"script:","script：")
	str=replace(str,"js:","js：")
        str=replace(str,Chr(10),"\\")
        str=replace(str,Chr(13),"\\")
        str=replace(str,vbnewline,"\\")
        str=replace(str,VbCrLf,"\\")
	str=replace(str,"&","&amp;")
	usb=str
end function
%>