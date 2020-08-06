<!--#INCLUDE virtual="/sql/sqlin.asp"-->
<%
on error resume next
dim conn
dim connstr
'db="/admin/Database/yxxe.mdb"      '数据库文件的位置
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("/admin/Database/#qqccb.mdb")
conn.Open connstr
If Err Then
		err.Clear
		Set Conn = Nothing
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
response.write "<card id='card1' title='&#x7CFB;&#x7EDF;&#x63D0;&#x793A;'><p>&#x7CFB;&#x7EDF;&#x6B63;&#x5728;&#x5347;&#x7EA7;,&#x6216;&#x8005;&#x7CFB;&#x7EDF;&#x6545;&#x969C;,&#x8BF7;&#x7A0D;&#x540E;&#x91CD;&#x8BD5;&#xFF01;<br/>&#x4F60;&#x53EF;&#x4EE5;<a href='/index.asp'>&#x8FD4;&#x56DE;&#x7F51;&#x7AD9;&#x9996;&#x9875;</a><br/>"
%>
<%
response.write "<br/></p></card></wml>"
response.end
end if
sub CloseConn()
On Error Resume Next
	Conn.close
	set Conn=nothing
end sub

function outHTM(str)
if str="" or isnull(str) then
	tohtm=str
	exit function
end if
outHTM = replace(str,"&","&amp;")
outHTM = replace(outHTM,"","&quot;")
outHTM = replace(outHTM,"<","&lt;")
outHTM = replace(outHTM,">","&gt;")
outHTM = replace(outHTM,"&nbsp;","")
outHTM = replace(outHTM,"'","&apos;")
outHTM = replace(outHTM,"$","$$")
outHTM = replace(outHTM,"&#xFFE5;","*")
outHTM = replace(outHTM,"&#39;","'")
outHTM = replace(outHTM,vbnewline,"<br/>")
outHTM = ubbcode(outHTM)
end function
%>
<%
Set rsyxxe= Server.CreateObject("ADODB.Recordset")
sqlyxxe ="SELECT * From ltSy Order By Id DESC"
rsyxxe.open sqlyxxe,conn,1,1
SystemSiteName=rsyxxe("title")
Systcpkg=rsyxxe("cpkg")
Systemdj=rsyxxe("duiji")
Systemlogo=rsyxxe("logo")
SystemUrl=rsyxxe("Url")
Systemhy=rsyxxe("wel")
Systemop=rsyxxe("op")
Systemtop=rsyxxe("top")
Systemkg=rsyxxe("ltkg")
Systemyk=rsyxxe("yk")
rsyxxe.close
set rsyxxe=nothing

%>