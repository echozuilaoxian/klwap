<!--#INCLUDE virtual="/sql/sqlin.asp"-->
<%
on error resume next
dim conn
dim connstr
'db="../admin/Database/yxxe.mdb"      'Êı¾İ¿âÎÄ¼şµÄÎ»ÖÃ
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
response.write "<card id='card1' title='&#x7CFB;&#x7EDF;&#x63D0;&#x793A;'><p>&#x7CFB;&#x7EDF;&#x6B63;&#x5728;&#x5347;&#x7EA7;,&#x6216;&#x8005;&#x7CFB;&#x7EDF;&#x6545;&#x969C;,&#x8BF7;&#x7A0D;&#x540E;&#x91CD;&#x8BD5;&#xFF01;<br/>&#x4F60;&#x53EF;&#x4EE5;<a href='/index.asp'>&#x8FD4;&#x56DE;&#x7F51;&#x7AD9;&#x9996;&#x9875;</a><br/><br/>"
%>

<%

response.end
end if
sub CloseConn()
On Error Resume Next
	Conn.close
	set Conn=nothing
end sub


Set rsyxxe= Server.CreateObject("ADODB.Recordset")
sqlyxxe ="SELECT * From System Order By SystemId DESC"
rsyxxe.open sqlyxxe,conn,1,1
SystemSiteName=rsyxxe("SystemSiteName")
Systemdj=rsyxxe("Systemdj")
Systemlogo=rsyxxe("Systemlogo")
SystemUrl=rsyxxe("SystemUrl")
SystemMail=rsyxxe("SystemMail")
Systemhy=rsyxxe("Systemhy")
SystemPin=rsyxxe("SystemPin")
Systemkg=rsyxxe("Systemkg")
Systemip=rsyxxe("Systemip")
rsyxxe.close
set rsyxxe=nothing

Function converttowide(str)
Dim strlen,position,convertstr
if isnull(str) then
Converttowide=str
else
position=1
strlen=Len(str)
for j=1 to strlen
  if Len("&#x" + Hex(AscW(Mid(str,position,1))) + ";")<8 then
      url=Cstr(Mid(str,position,1))
    Else
      url="&#x" + Hex(AscW(Mid(str,position,1))) + ";"
  End if
convertstr=convertstr + url
position=position + 1
Next
ConverttoWide=convertstr
end if
end function

Function converttowidebaiti(str)
Dim strlen,position,convertstr
if isnull(str) then
Converttowide=str
else
position=1
strlen=Len(str)
for j=1 to strlen
convertstr=convertstr + "&#x" + Hex(AscW(Mid(str,position,1))) + ";"
position=position + 1
Next
converttowidebaiti=convertstr
end if
end function

'str=replace(str,"&","&amp;")
'¹ıÂË×Ö·ûĞ´ÈëÊı¾İ¿âUsb
Function usb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str,"","")
	str=replace(str,"","")
	str=replace(str,"","")
	str=replace(str,"execute","")
	str=replace(str," ","")
	str=replace(str,"¦«","")
	str=replace(str,"¦·","")
	str=replace(str,"","")
        str=replace(str,Chr(13),"[br]")
        str=replace(str,Chr(14),"(br)")
usb=str
end function
'±êÌâºÍ±à¼­UBB
function ubb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
        str=replace(str,Chr(13),"<br/>")
        str=replace(str,Chr(14),"<br/>")
	ubb=str
end function

'µÇÂ½UBB
function dlubb(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
	str=replace(str,"'or'='or'","")
	set re=Nothing
	dlubb=str
end function

'ÄÚÈİUBB2
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
	str=replace(str,"²İ","*")
	str=replace(str,"ÎÒÈÕ","**")
	str=replace(str,"·¨ÂÖ¹¦","***")
	str=replace(str,"¹²²úµ³","***")
	str=replace(str,"Ç¿¼é","**")
	str=replace(str,"¼¦°Í","**")
	str=replace(str,"ÎÒ¿¿","**")
	str=replace(str,"ÎÒ²Ù","**")
	str=replace(str,"ËûÂèµÄ","***")
	str=replace(str,"¹ö","*")
	str=replace(str,"(br)","<br/>")
	str=replace(str,"[date]",""&date&"")
	str=replace(str,"[time]",""&time&"")
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
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
	re.pattern="(\[img\])(.[^\[]*)(\[\/img\])"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
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

'ÄÚÈİUBBCodes
function UBBCodes(str)
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
	str=replace(str,"²İ","*")
	str=replace(str,"ÎÒÈÕ","**")
	str=replace(str,"·¨ÂÖ¹¦","***")
	str=replace(str,"¹²²úµ³","***")
	str=replace(str,"Ç¿¼é","**")
	str=replace(str,"¼¦°Í","**")
	str=replace(str,"ÎÒ¿¿","**")
	str=replace(str,"ÎÒ²Ù","**")
	str=replace(str,"ËûÂèµÄ","***")
	str=replace(str,"¹ö","*")
	str=replace(str,"(br)","<br/>")
	str=replace(str,"[date]",""&date&"")
	str=replace(str,"[time]",""&time&"")
	str=replace(str,"[name]",""&ltname&"")
	str=replace(str,"[id]",""&iduse&"")
	str=replace(str,"(name)",""&ltname&"")
	str=replace(str,"(id)",""&iduse&"")
	str=replace(str,"(date)",""&date&"")
	str=replace(str,"(time)",""&time&"")
	str=replace(str,"[now]",""&now&"")
	str=replace(str,"(now)",""&now&"")
	str=replace(str,"[br]","<br/>")
	str=replace(str,"(br)","<br/>")
	str=replace(str,"\","<br/>")
        str=replace(str,Chr(13),"<br/>")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern = "(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/>")
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/>")
	re.pattern="(!)(([0-9]*))(!)"
	str=re.Replace(str,"<img src=""/bbs/chatroom/img/$3.gif"" alt=""&#x8868;&#x60C5;.""/>")
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
	UBBCodes=str
end function

function encodestr(str)
	dim i
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"&","&#38;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"%1A","")
	str=replace(str,"$","$$")
        str=replace(str,"&#xFFE5;","*")
	str=replace(str,"&nbsp;","")
	str=replace(str,"'","""")
	encodestr=replace(str," "," ")
end function

%>
<!--#include file="ubbcode1.asp" -->