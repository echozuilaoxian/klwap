<%
'======================================ACCESS数据库
'=====================================狂龙网络版权所有
dim twapp_db
	twapp_db="/data/#twapp_ydzqbqsy"
		Set conn = Server.CreateObject("ADODB.Connection")
conn.open "driver={microsoft access driver (*.mdb)};uid=#twapp_ydzqbqsy;pwd=520ydzq;dbq=" & Server.MapPath(""&twapp_db&"")

	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接错误,请检查Conn.Asp文件"
		Response.End
	End If
hk=trim(request.querystring("hk"))
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
        str=replace(str,"hk=o","hk="&hk&"")
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
        str=replace(str,Chr(13),"<br/>")
	ubb=str
end function
function ubb1(str)
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
        str=replace(str,"(date)",""&date()&"")
        str=replace(str,"(now)",""&now()&"")
        str=replace(str,"hk=o","hk="&hk&"")
        str=replace(str,"(week)",""&WeekDayName(DatePart("w",Now))&"")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
        re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
	re.pattern="(\(URL\))(.[^\(]*)(\(\/URL\))"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\(URL=(.[^\(]*)\))(.[^\(]*)(\(\/URL\))"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\[url\])(.[^\[]*)(\[\/url\])"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\[url=(.[^\]]*)\])(.[^\[]*)(\[\/url\])"
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
        str=replace(str,"[br]","<br/>")
        str=replace(str,Chr(13),"<br/>")
        str=replace(str,Chr(14),"<br/>")
        str=replace(str,"","")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
        re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
	str= re.Replace(str,"<img src=""$2"" alt=''/>")
	re.pattern="(\(URL\))(.[^\(]*)(\(\/URL\))"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\(URL=(.[^\(]*)\))(.[^\(]*)(\(\/URL\))"
	str= re.Replace(str,"<a href=""$2"" >$3</a>")
	re.pattern="(\[url\])(.[^\[]*)(\[\/url\])"
	str= re.Replace(str,"<a href=""$2"" >$2</a>")
	re.pattern="(\[url=(.[^\]]*)\])(.[^\[]*)(\[\/url\])"
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

'ip统计系统
user="2" 'request.QueryString("user")
userip = Request.ServerVariables("HTTP_X_UP_CALLING_LINE_ID")
If userip = "" Then userip = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
if userip = "" then userip = Request.ServerVariables("REMOTE_ADDR")
set rsip=conn.execute("select * from counter")
oto=rsip("oto")
if oto<>date() then
  zzday=date()-1
  application.lock
  conn.Execute"Update counter set today=0,browser=0,oto=date(),daynum=daynum+1,yesterday="&rsip("today")&""
  conn.Execute"Insert into zzday(zzday,stats,browser) values ('"&zzday&"',"&rsip("today")&","&rsip("browser")&")"
  application.unlock
  conn.Execute"delete from UserandIP"
else
  application.lock
  conn.Execute"Update counter set browser=browser+1"  
  if conn.execute("select IP from UserandIP where IP='"&userip&"'").eof then
	conn.Execute"insert into UserandIP(IP,User) values('"&userip&"','"&user&"')"
        conn.Execute"Update counter set counter=counter+1,today=today+1"      
  end if
  application.unlock
end if
       conn.Execute"Update counter set [top]="&rsip("today")&" where "&rsip("top")&"<"&rsip("today")
       rsip.close
       set rsip=nothing
Function R_url()'获取当前路径,用于返回
dim WAPurl
WAPurl=WAPurl&"http://"&request.ServerVariables("Server_NAME")&request.ServerVariables("SCRIPT_NAME") 
if(len(trim(request.ServerVariables("QUERY_STRING")))>0) then 
WAPurl=WAPurl & "?" & request.ServerVariables("QUERY_STRING")
WAPurl=replace(WAPurl,"&","@@")
end if 
R_url=WAPurl
End Function
%>

<!-- #include file="ydzq1.asp" -->