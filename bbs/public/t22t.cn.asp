<% LANGUAGE="VBSCRIPT" %>
<%
SessionID=request.querystring("SessionID")
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

'过滤字符写入数据库untowide
Function untowide(str)
	str=trim(str)
	if IsNull(str) then exit function
        str=replace(str,".com","")
        str=replace(str,".cn","")
        str=replace(str,".net","")
        str=replace(str,".mobi","")
        str=replace(str,".cc","")
        str=replace(str,".hk","")
        str=replace(str,".tv","")
        str=replace(str,".tw","")
        str=replace(str,".biz","")
        str=replace(str,".org","")
        str=replace(str,".tel","")
        str=replace(str,".me","")
str=replace(str,"com","")
str=replace(str,"4gmy","")
str=replace(str,"8cyf","")
        str=replace(str,"cn","")
        str=replace(str,"net","")
        str=replace(str,"mobi","")
        str=replace(str,"cc","")
        str=replace(str,"hk","")
        str=replace(str,"tv","")
        str=replace(str,"tw","")
        str=replace(str,"biz","")
        str=replace(str,"org","")
        str=replace(str,"tel","")
        str=replace(str,"me","")
        str=replace(str,Chr(13),"\")
        str=replace(str,Chr(14),"\")

untoWide=str
end function

Function lycount()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='t'"
  objgbrr.open ssql,conn,3,3
lycount=objgbrr.RecordCount
objgbrr.close
set objgbrr=nothing
End Function

Function lasttls()
 if lasttlss="" then
    sql="update SoftDown_online set lasttll=" & lasttlls & " where CStr(id)=" & iduse
  else
    sql="update SoftDown_online set lasttl=" & lasttlss
    sql=sql & ",lasttll=" & lasttlls & " where CStr(id)=" & iduse
  End if
	conn.execute(sql)
End Function

Function RecordCount()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where CStr(lasttl)=" & lasttlls 
  objgbrr.open ssql,conn,3,3
RecordCount=objgbrr.RecordCount
objgbrr.close
set objgbrr=nothing
End Function

'标题和编辑UBB
function ubb(str)
	str=trim(str)
	if IsNull(str) then exit function
         str=replace(str,".com","")
        str=replace(str,".cn","")
        str=replace(str,".net","")
        str=replace(str,".mobi","")
        str=replace(str,".cc","")
        str=replace(str,".hk","")
        str=replace(str,".tv","")
        str=replace(str,".tw","")
        str=replace(str,".biz","")
        str=replace(str,".org","")
        str=replace(str,".tel","")
        str=replace(str,".me","")
str=replace(str,"com","")
str=replace(str,"4gmy","")
str=replace(str,"8cyf","")
        str=replace(str,"cn","")
        str=replace(str,"net","")
        str=replace(str,"mobi","")
        str=replace(str,"cc","")
        str=replace(str,"hk","")
        str=replace(str,"tv","")
        str=replace(str,"tw","")
        str=replace(str,"biz","")
        str=replace(str,"org","")
        str=replace(str,"tel","")
        str=replace(str,"me","")
        str=replace(str,Chr(13),"<br/>")
        str=replace(str,Chr(14),"<br/>")

	ubb=str
end function

'登陆UBB
function dlubb(str)
	if IsNull(str) then exit function
	str=trim(str)
         str=replace(str,".com","")
        str=replace(str,".cn","")
        str=replace(str,".net","")
        str=replace(str,".mobi","")
        str=replace(str,".cc","")
        str=replace(str,".hk","")
        str=replace(str,".tv","")
        str=replace(str,".tw","")
        str=replace(str,".biz","")
        str=replace(str,".org","")
        str=replace(str,".tel","")
        str=replace(str,".me","")
str=replace(str,"com","")
str=replace(str,"4gmy","")
str=replace(str,"8cyf","")
        str=replace(str,"cn","")
        str=replace(str,"net","")
        str=replace(str,"mobi","")
        str=replace(str,"cc","")
        str=replace(str,"hk","")
        str=replace(str,"tv","")
        str=replace(str,"tw","")
        str=replace(str,"biz","")
        str=replace(str,"org","")
        str=replace(str,"tel","")
        str=replace(str,"me","")
	str=replace(str,"'or'='or'","")
	set re=Nothing
	dlubb=str
end function

'内容UBBCode
function UBBCode(str)
	if IsNull(str) then exit function
	str=trim(str)
         str=replace(str,".com","")
        str=replace(str,".cn","")
        str=replace(str,".net","")
        str=replace(str,".mobi","")
        str=replace(str,".cc","")
        str=replace(str,".hk","")
        str=replace(str,".tv","")
        str=replace(str,".tw","")
        str=replace(str,".biz","")
        str=replace(str,".org","")
        str=replace(str,".tel","")
        str=replace(str,".me","")
str=replace(str,"com","")
str=replace(str,"4gmy","")
str=replace(str,"8cyf","")
        str=replace(str,"cn","")
        str=replace(str,"net","")
        str=replace(str,"mobi","")
        str=replace(str,"cc","")
        str=replace(str,"hk","")
        str=replace(str,"tv","")
        str=replace(str,"tw","")
        str=replace(str,"biz","")
        str=replace(str,"org","")
        str=replace(str,"tel","")
        str=replace(str,"me","")
        str=replace(str,Chr(13),"<br/>")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern = "(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|<anchor>[&#x6536;&#x85CF;]<go method='post' href='/bbs/myalbum/addbook.asp?SessionID="&SessionID&"'><postfield name='xcname' value='&#x8BBA;&#x575B;&#x6536;&#x85CF;&#x56FE;&#x7247;'/><postfield name='xclink' value=""$2""/></go></anchor><br/>")
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|<anchor>[&#x6536;&#x85CF;]<go method='post' href='/bbs/myalbum/addbook.asp?SessionID="&SessionID&"'><postfield name='xcname' value='&#x8BBA;&#x575B;&#x6536;&#x85CF;&#x56FE;&#x7247;'/><postfield name='xclink' value=""$2""/></go></anchor><br/>")
	re.pattern="(!)(([0-9]*))(!)"
	str=re.Replace(str,"<img src=""/bbs/chatroom/img/$3.gif"" alt=""&#x8868;&#x60C5;.""/>")
    re.Pattern="(^.*)(\(my=*([0-9]*)\))(.+?)(\(\/s\))(.*)"
    if not conn.execute("select * from fgr_5fd_ffg where id='"&objgbrs("id")&"' and useid='" & Session("useid") & "'").eof or Cstr(Session("bzbz"))=ForumID or Cstr(Session("yxxezb"))<>"" or Cstr(Session("yxxexc"))<>"" or Session("Counter")="pass_numbers_55556666" then
       str=re.Replace(str,"$1&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x4EF7;&#x503C;$3&#x91D1;&#x5E01;<br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x8D2D;&#x4E70;<br/>$4$6")
	  else
	str=re.Replace(str,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x4EF7;&#x503C;$3&#x91D1;&#x5E01;,&#x6655;&#x6655;@_@&#x53C8;&#x5F97;&#x6DD8;&#x94B1;&#x4E86;<br/><anchor>&#x786E;&#x8BA4;&#x8D2D;&#x4E70;<go method='post' href='buypost.asp?SessionID=" & SessionID & "'><postfield name='ForumID' value='" & ForumID & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='ids' value='" & objgbrs("tjhm") & "'/><postfield name='page' value='" & page & "'/></go></anchor><br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x8D2D;&#x4E70;<br/>$6")
    end if
 re.Pattern="(^.*)(\(so=*([0-9]*)\))(.+?)(\(\/n\))(.*)"
    if not conn.execute("select * from fgr_5fd_ffg where id='"&objgbrs("id")&"' and useid='" & Session("useid") & "'").eof or Session("Counter")="pass_numbers_55556666" then
        str=re.Replace(str,"$1&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x662F;&#x4F60;&#x83B7;&#x5F97;$3&#x91D1;&#x5E01;&#x7684;&#x793C;&#x91D1;&#x901A;&#x9053;<br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x9886;&#x53D6;<br/>$4$6")
	  else
	     str=re.Replace(str,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x6D3E;&#x793C;&#x91D1;$3&#x91D1;&#x5E01;,&#x54C8;&#x54C8;@_@&#x6709;&#x798F;&#x4E86;<br/><anchor>&#x786E;&#x8BA4;&#x9886;&#x53D6;<go method='post' href='sopost.asp?SessionID=" & SessionID & "'><postfield name='ForumID' value='" & ForumID & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='ids' value='" & objgbrs("tjhm") & "'/><postfield name='page' value='" & page & "'/></go></anchor><br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x9886;&#x53D6;<br/>$6")
    end if
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
	UBBCode=str
end function

'内容UBBCodes
function UBBCodes(str)
	if IsNull(str) then exit function
	str=trim(str)
         str=replace(str,".com","")
        str=replace(str,".cn","")
        str=replace(str,".net","")
        str=replace(str,".mobi","")
        str=replace(str,".cc","")
        str=replace(str,".hk","")
        str=replace(str,".tv","")
        str=replace(str,".tw","")
        str=replace(str,".biz","")
        str=replace(str,".org","")
        str=replace(str,".tel","")
        str=replace(str,".me","")
str=replace(str,"com","")
str=replace(str,"4gmy","")
str=replace(str,"8cyf","")
        str=replace(str,"cn","")
        str=replace(str,"net","")
        str=replace(str,"mobi","")
        str=replace(str,"cc","")
        str=replace(str,"hk","")
        str=replace(str,"tv","")
        str=replace(str,"tw","")
        str=replace(str,"biz","")
        str=replace(str,"org","")
        str=replace(str,"tel","")
        str=replace(str,"me","")
        str=replace(str,Chr(13),"<br/>")
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern = "(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|<anchor>[&#x6536;&#x85CF;]<go method='post' href='/bbs/myalbum/addbook.asp?SessionID="&SessionID&"'><postfield name='xcname' value='&#x8BBA;&#x575B;&#x6536;&#x85CF;&#x56FE;&#x7247;'/><postfield name='xclink' value=""$2""/></go></anchor><br/>")
	re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	str = re.Replace(str,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|<anchor>[&#x6536;&#x85CF;]<go method='post' href='/bbs/myalbum/addbook.asp?SessionID="&SessionID&"'><postfield name='xcname' value='&#x8BBA;&#x575B;&#x6536;&#x85CF;&#x56FE;&#x7247;'/><postfield name='xclink' value=""$2""/></go></anchor><br/>")
        re.pattern="(\(imgs)\)(([0-9]*))\(/imgs\)"
	str = re.Replace(str,"<img src=""/bbs/chatroom/face/$2.gif"" alt=""&#x8868;&#x60C5;.""/>")
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

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","''") & "'"
  End function

function gftz()
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(0) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
End function
%>