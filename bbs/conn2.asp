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

Function c2u(sGBStr)
Dim i,c
if sGBStr<>"" then 
For i = 1 to Len(sGBStr)
c = Mid(sGBStr,i,1)
if c=chr(13) then 
c2u = c2u & "<br/>"
else
c2u = c2u & "&#x" & Hex(AscW(c)) & ";"
end if
Next
end if
End Function

'过滤字符写入数据库Usb
function usb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str,"'","")
	str=replace(str,"execute","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
        str=replace(str,"&#xFFE5;","*")
        str=replace(str,Chr(13),"[br]")
	usb=str
end function
'过滤字符写入数据库Usb
function utf8(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str,"execute","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
        str=replace(str,"&#xFFE5;","*")
        str=replace(str,Chr(13),"[br]")
	utf8=str
end function

'标题和编辑UBB
function ubb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"%1A","")
	str=replace(str,"$","$$")
        str=replace(str,"&#xFFE5;","*")
	str=replace(str,"&nbsp;","")
        str=replace(str,Chr(13),"<br/>")
	ubb=str
end function

'登陆UBB
function dlubb(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
        str=replace(str,"&#xFFE5;","*")
	str=replace(str,"""","&quot;")
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
	str=replace(str,"'or'='or'","")
	set re=Nothing
	dlubb=str
end function

'内容UBB2
function ubb2(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"$","$$")
        str=replace(str,"&#xFFE5;","*")
	str=replace(str,"&nbsp;","")
	str=replace(str,"草","*")
	str=replace(str,"我日","**")
	str=replace(str,"法轮功","***")
	str=replace(str,"共产党","***")
	str=replace(str,"强奸","**")
	str=replace(str,"鸡巴","**")
	str=replace(str,"我靠","**")
	str=replace(str,"我操","**")
	str=replace(str,"他妈的","***")
	str=replace(str,"滚","*")
	str=replace(str,"(br)","<br/>")
	str=replace(str,"[date]",""&date&"")
	str=replace(str,"[time]",""&time&"")
	str=replace(str,"[username]",""&myni&"")
	str=replace(str,"[userid]",""&myid&"")
	str=replace(str,"(date)",""&date&"")
	str=replace(str,"(time)",""&time&"")
	str=replace(str,"[now]",""&now&"")
	str=replace(str,"(now)",""&now&"")
	str=replace(str,"(username)",""&myni&"")
	str=replace(str,"(userid)",""&myid&"")
	str=replace(str,"[br]","<br/>")
        str=replace(str,Chr(13),"<br/>")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str= re.Replace(str,"<img src=""$2"" alt=''/><br/><a href=""$2"">&#x70B9;&#x51FB;&#x514D;&#x8D39;&#x4E0B;&#x8F7D;</a>")
	re.pattern="(\[img\])(.[^\[]*)(\[\/img\])"
	str= re.Replace(str,"<img src=""$2"" alt=''/><br/><a href=""$2"">&#x70B9;&#x51FB;&#x514D;&#x8D39;&#x4E0B;&#x8F7D;</a>")
	re.pattern="(\(url\))([A-Za-z0-9\./=\?%\-&_&#x7E;`@':+!;*()#]+)(\(\/url\))"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\(url=)([A-Za-z0-9\./=\?%\-&_&#x7E;`@':+!;*()#]+)\)(.+?)(\(\/url\))"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\[url\])(.[^\[]*)(\[\/url\])"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\[url=(.[^\]]*)\])(.[^\[]*)(\[\/url\])"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\(wtai\))(.[^\[]*)(\(\/wtai\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$2</a>")
	re.pattern="(\(wtai=(.[^\]]*)\))(.[^\[]*)(\(\/wtai\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$3</a>")
		re.pattern="(\[wtai\])(.[^\[]*)(\[\/wtai\])"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$2</a>")
	re.pattern="(\[wtai=(.[^\]]*)\])(.[^\[]*)(\[\/wtai\])"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$3</a>")
	re.pattern="(\(u\))(.[^\[]*)(\(\/u\))"
	str= re.Replace(str,"<u>$2</u>")
	re.pattern="(\(b\))(.[^\[]*)(\(\/b\))"
	str= re.Replace(str,"<b>$2</b>")
	re.pattern="(\(i\))(.[^\[]*)(\(\/i\))"
	str= re.Replace(str,"<i>$2</i>")
		re.pattern="(\[u\])(.[^\[]*)(\[\/u\])"
	str= re.Replace(str,"<u>$2</u>")
	re.pattern="(\[b\])(.[^\[]*)(\[\/b\])"
	str= re.Replace(str,"<b>$2</b>")
	re.pattern="(\[i\])(.[^\[]*)(\[\/i\])"
	str= re.Replace(str,"<i>$2</i>")
        re.Pattern="(\\\\)"
	str= re.Replace(str,"<br/>")
        re.Pattern="(\\)"
	str= re.Replace(str,"<br/>")
	set re=Nothing
	ubb2=str
end function
%>