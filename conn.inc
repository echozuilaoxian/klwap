<%
dim twapp_db
	twapp_db="/data/#twapp_ydzqbqsy"
		Set conn = Server.CreateObject("ADODB.Connection")
conn.open "driver={microsoft access driver (*.mdb)};uid=#twapp_ydzqbqsy;pwd=520ydzq;dbq=" & Server.MapPath(""&twapp_db&"")
 sub endConnection()
 conn.close
 set conn=nothing
 end sub
%>

<%Function c2u(sGBStr)
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
	str=replace(str,"'","")
	str=replace(str,"execute","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
	str=replace(str,"","")
        str=replace(str,"&#xFFE5;","*")
        str=replace(str,Chr(13),"[br]")
	usb=str
end function
'过滤字符写入数据库USB
function utf8(str)
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"","")
	str=replace(str,"execute","")
	str=replace(str," ","")
	str=replace(str,"Λ","")
	str=replace(str,"Ψ","")
	str=replace(str,"","")
	str=replace(str,"","")
        str=replace(str,"&#xFFE5;","*")
        str=replace(str,Chr(13),"[br]")
	utf8=str
end function
sub Error(erstr)
  conn.close
  set conn=Nothing
  Response.write erstr & chr(13)
  Response.write "<br/><anchor><prev/>返回</anchor>" & chr(13)
  Response.write "</p></card></wml>"
  Response.end
end sub
'标题和编辑UBB
function ubb(str)
	str=trim(str)
	if IsNull(str) then exit function
	str = Replace(str, CHR(34), "&quot;")
	str = replace(str, ">", "＞")
	str = replace(str, "<", "＜")
	str = replace(str, "hk=o", "hk="&hk&"")

	str = replace(str, "＆", "&amp;")

	str = replace(str, "＂", "&quot;")

	str = Replace(str, CHR(13), "")
	str = Replace(str, CHR(10), "\")

	str = replace(str, "$", "＄")
	str = replace(str, "??", "？")

	str = replace(str, chr(01), "")
	str = replace(str, chr(02), "")
	str = replace(str, chr(03), "")
	str = replace(str, chr(04), "")
	str = replace(str, chr(05), "")
	str = replace(str, chr(06), "")
	str = replace(str, chr(07), "")
	str = replace(str, chr(08), "")
	str = replace(str, chr(09), "")
	str = replace(str, chr(11), "")
	str = replace(str, chr(12), "")
	str = replace(str, chr(14), "")
	str = replace(str, chr(15), "")
	str = replace(str, chr(16), "")
	str = replace(str, chr(17), "")
	str = replace(str, chr(18), "")
	str = replace(str, chr(19), "")
	str = replace(str, chr(20), "")
	str = replace(str, chr(21), "")
	str = replace(str, chr(22), "")
	str = replace(str, chr(23), "")
	str = replace(str, chr(24), "")
	str = replace(str, chr(25), "")
	str = replace(str, chr(26), "")
	str = replace(str, chr(27), "")
	str = replace(str, chr(28), "")
	str = replace(str, chr(29), "")
	str = replace(str, chr(30), "")
	str = replace(str, chr(31), "")

	str = replace(str, "", "")
	str = replace(str, "'", "”")
	str = replace(str, ",", "，")
	str = replace(str, "`", "")
	str = replace(str, "€", "")
	str = replace(str, "―", "-")
	str=replace(str,"&amp;","←↑→")
	str=replace(str,"&","&amp;")
	str=replace(str,"←↑→","&amp;")
	str=replace(str,"'","&apos;")
	str=replace(str,"""","&quot;")
	str=replace(str,"%1A","")
	str=replace(str,"$","$$")
        str=replace(str,"&#xFFE5;","*")
	str=replace(str,"&nbsp;","")
	str=replace(str,"","")
        str=replace(str,Chr(13),"<br/>")
	ubb=str
end function
'登陆UBB
function dlubb(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&amp;","←↑→")
	str=replace(str,"&","&amp;")
	str=replace(str,"←↑→","&amp;")
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
	str=replace(str,"&amp;","←↑→")
	str=replace(str,"&","&amp;")
	str=replace(str,"←↑→","&amp;")
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
	str=replace(str,"[br]","<br/>")
	str=replace(str,"[date]",""&date&"")
	str=replace(str,"[time]",""&time&"")
	str=replace(str,"(name)",""&myni&"")
	str=replace(str,"(myid)",""&myid&"")
        str=replace(str,"(time)",""&time()&"")
        str=replace(str,"(date)",""&date()&"")
	str = replace(str, "hk=o", "hk="&hk&"")
        str=replace(str,"(now)",""&now()&"")
        str=replace(str,"(week)",""&WeekDayName(DatePart("w",Now))&"")
        str=replace(str,Chr(13),"\\")
        str=replace(str,Chr(14),"\\")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
        str= re.Replace(str,"<img src=""$2"" alt='img'/>")
	re.pattern="(\(URL\))(.[^\(]*)(\(\/URL\))"
	str= re.Replace(str,"<img src=""$2"" alt='img'/>")
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
        re.Pattern="(\\)"
	str= re.Replace(str,"<br/>")
	if instr(1,str,"(/re)",1)>0 then	
		re.Pattern="(^.*)(\(re\))(.+?)(\(\/re\))(.*)"
           if myid=rs("fid") or ltmybz=rs("bbsid") or mycjbz="1" or myxcy="1" then
		  str=re.Replace(str,"$1$3$5")	
              else

		if isNull(myid) or myid="" or tid="" then
			strContent= re.Replace(str,"$1<br/>[隐藏内容回复后才能浏览]<br/>$5")
		elseif Not(conn.execute("select top 1 id from lthf where fid="&myid&" and tid="&tid).eof) then		
		  str=re.Replace(str,"$1$3$5")	
	
	  else
		  str= re.Replace(str,"$1<br/>[隐藏内容回复后才能浏览]<br/>$5")
	  end if
	end if
	  end if
	set re=Nothing
	ubb2=str
end function


sub InStrRevcontent
IF InStrRev(content,".") > 0 THEN
ggss = mid(content,InStrRev(content,".")+1)
end if
if ggss="gif" or ggss="jpg" or ggss="jpeg" or ggss="bmp" or ggss="png" then
response.write("<img src='"&content&"' alt=''/><br/><a href='"&content&"'>[下载图片]</a><br/>")
else
response.write("<a href='"&content&"'>[下载附件]</a><br/>")
end if
end sub

'自定义需要过滤的字串,用 "|" 分隔
KL_In = " and|update|exec|insert|select|delete| count|master|truncate|declare|drop|create|eval|xp_|sp_|cmd|command|dir|c:|d:| net|update "



if instr(Request.ServerVariables("HTTP_CONTENT_TYPE"),"multipart/form-data")=0 then
KL_Inf = split(KL_In,"|")
'--------POST部份------------------
If Request.Form<>"" Then
For Each KL_Post In Request.Form

For KL_Xh=0 To Ubound(KL_Inf)
If Instr(LCase(Request.Form(KL_Post)),KL_Inf(KL_Xh))<>0 Then
                response.redirect "/getout.asp?o=1"
End If
Next

Next
End If
'----------------------------------

'--------GET部份-------------------
If Request.QueryString<>"" Then
For Each KL_Get In Request.QueryString

For KL_Xh=0 To Ubound(KL_Inf)
If Instr(LCase(Request.QueryString(KL_Get)),KL_Inf(KL_Xh))<>0 Then
                response.redirect "/getout.asp?o=2"
End If
Next
Next
End If

End If
'---------------------------------------
Function R_url()'获取当前路径,用于返回
dim WAPurl
WAPurl=WAPurl&"http://"&request.ServerVariables("Server_NAME")&request.ServerVariables("SCRIPT_NAME") 
if(len(trim(request.ServerVariables("QUERY_STRING")))>0) then 
WAPurl=WAPurl & "?" & request.ServerVariables("QUERY_STRING")
WAPurl=replace(WAPurl,"&","@@")
end if 
R_url=WAPurl
End Function
Dim bbsrss,bbsname,downjf
set bbsrss=Server.CreateObject("ADODB.Recordset")
  bbsrss.open"select name,downjf from ltjb where id=1",conn,1,1
bbsname=bbsrss("name")
downjf=bbsrss("downjf")
bbsrss.close
set bbsrss=nothing
'---------------------------------------
%>
<%
dim zcys,zcyy
Set Rsg = Server.CreateObject("Adodb.Recordset")
Sqlg = "SELECT zcsz,zcyy FROM admin"
Rsg.Open Sqlg,conn,1,1
zcys=Rsg("zcsz")
zcyy=Rsg("zcyy")
Rsg.close
set Rsg=nothing
 %>