<%
on error resume next
dim conn
dim connstr
'db="../admin/Database/yxxe.mdb"      '数据库文件的位置
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
<a href='http://ad.kclick.cn/600.wap'>&#x624B;&#x673A;&#x514D;&#x8D39;&#x6740;&#x6BD2;&#x8F6F;&#x4EF6;</a><br/>
<a href='http://ad.kclick.cn/3224.wap'>&#x638C;&#x8BAF;&#x901A;3&#x5468;&#x5E74;&#x6CE8;&#x518C;&#x9001;&#x5927;&#x793C;</a><br/>
<anchor title="&#x97F3;&#x4E50;&#x6CE1;&#x6CE1;">&#x9AD8;&#x97F3;&#x8D28;MP3&#x64AD;&#x653E;&#x5668;<go sendreferer="true" href="http://ad.kclick.cn/599.wap"/></anchor><br/>
<anchor title="&#x72D0;&#x754C;WAP&#x7F51;&#x6E38;">&#x72D0;&#x754C;&#x7F51;&#x6E38;&#x6700;&#x591A;&#x73A9;&#x5BB6;<go sendreferer="true" href="http://ad.kclick.cn/1576.wap"/></anchor><br/>
<anchor title="&#x624B;&#x673A;&#x7EA6;&#x4F1A;">&#x4E0E;&#x5404;&#x8272;&#x7F8E;&#x5973;&#x6FC0;&#x60C5;&#x7EA6;&#x4F1A;<go sendreferer="true" href="http://ad.kclick.cn/1574.wap"/></anchor><br/>
<anchor title="V8&#x4E66;&#x5BA2;">&#x6FC0;&#x60C5;&#x7384;&#x5E7B;&#x7F8E;&#x56FE;&#x5C0F;&#x8BF4;<go sendreferer="true" href="http://ad.kclick.cn/1575.wap"/></anchor><br/>
<a href='http://ad.kclick.cn/1955.wap'>&#x65B0;&#x624B;&#x673A;&#x8054;&#x7F51;&#x6597;&#x5730;&#x4E3B;</a><br/>
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
