<% dim twapp_db
	twapp_db="/data/#twapp_ydzqbqsy"
		Set conn = Server.CreateObject("ADODB.Connection")
conn.open "driver={microsoft access driver (*.mdb)};uid=#twapp_ydzqbqsy;pwd=520ydzq;dbq=" & Server.MapPath(""&twapp_db&"")
%>
<%
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

'过滤字符写入数据库USB
function usb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
        str=replace(str,Chr(13),"\\")
	usb=str
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
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
        str=replace(str,Chr(13),"\\")
	ubb=str
end function

'分类UBB1
function ubb1(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"$","$$")
	str=replace(str,"&nbsp;","")
        str=replace(str,Chr(13),"\\")
	ubb1=str
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
	str=replace(str,"&nbsp;","")
        str=replace(str,Chr(13),"<br/>")
        str=replace(str,"(time)",""&time()&"")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str= re.Replace(str,"<img src=""$2"" alt=''/><br/><a href=""$2"">&#x70B9;&#x51FB;&#x514D;&#x8D39;&#x4E0B;&#x8F7D;</a><br/>")
	re.pattern="(\(url\))([A-Za-z0-9\./=\?%\-&_&#x7E;`@':+!;*()#]+)(\(\/url\))"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\(url=)([A-Za-z0-9\./=\?%\-&_&#x7E;`@':+!;*()#]+)\)(.+?)(\(\/url\))"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\(c\))(.[^\[]*)(\(\/c\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$2</a>")
	re.pattern="(\(c=(.[^\]]*)\))(.[^\[]*)(\(\/c\))"
	str= re.Replace(str,"<a href=""wtai://wp/mc;$2"" >$3</a>")
	re.pattern="(\(u\))(.[^\[]*)(\(\/u\))"
	str= re.Replace(str,"<u>$2</u>")
	re.pattern="(\(b\))(.[^\[]*)(\(\/b\))"
	str= re.Replace(str,"<b>$2</b>")
	re.pattern="(\(i\))(.[^\[]*)(\(\/i\))"
	str= re.Replace(str,"<i>$2</i>")
        re.Pattern="(\\\\)"
	str= re.Replace(str,"<br/>")
	set re=Nothing
	ubb2=str
end function
'dim hack
'hack= Request.ServerVariables("SERVER_NAME")
'IF InStrRev(hack,"go.ppqy.cn") <= 0 and InStrRev(hack,"go.ppqy.cn") <= 0 THEN
'response.redirect "http://cugn.6ftp.com"
'end if
%>