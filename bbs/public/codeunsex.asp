<% LANGUAGE="VBSCRIPT" %>
<%
wap=request.querystring("wap")
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

Function untowide(str)
	str=replace(str,"<","[")
	str=replace(str,">","]")
    str=replace(str,"&","&amp;")
	str=replace(str,"$","")
	str=replace(str,"","")
	str=replace(str,"'","''")
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

function UBBCode(memo)
dim killword
killword=split("fuck,com,cn,net,net.cn,mobi,cc,com.cn&#x6CD5;&#x8F6E;&#x529F;,&#x4ED6;&#x5988;&#x7684;,&#x505A;&#x7231;,&#x5F3A;&#x5978;",",")
	if IsNull(memo) then exit function
	memo=encodestr(memo)
	dim re,i
	
	for i=0 to ubound(killword)
		memo=replace(memo,killword(i),string(len(killword(i)),"*"))
	next
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True

	re.Pattern = "(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	memo = re.Replace(memo,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|[&#x6536;&#x85CF;]<br/>")

    re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	memo = re.Replace(memo,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|[&#x6536;&#x85CF;]<br/>")

  re.pattern="\(url=(.{5,}?)\)(.+?)\(/url\)"
	memo = re.Replace(memo,"<a href=""$1"" >$2</a>")

	re.Pattern = "(url=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	memo = re.Replace(memo,"<a href=""$2"">$2</a>")
	
    re.Pattern="(\\)"
	memo = re.Replace(memo,"<br/>")

    re.pattern="(!)(([0-9]*))(!)"
    memo=re.Replace(memo,"<img src=""/bbs/chatroom/img/$3.gif"" alt=""&#x8868;&#x60C5;.""/>")

	set re=Nothing
	UBBCode=memo
end function

function UBBCodes(memo)
dim killword
killword=split("fuck,&#x6CD5;&#x8F6E;&#x529F;,&#x4ED6;&#x5988;&#x7684;,&#x505A;&#x7231;,&#x5F3A;&#x5978;",",")
	if IsNull(memo) then exit function
	memo=encodestr(memo)
	dim re,i
	
	for i=0 to ubound(killword)
		memo=replace(memo,killword(i),string(len(killword(i)),"*"))
	next
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
re.pattern="(\(a\))(.[^\[]*)(\(\/a\))"
	memo= re.Replace(memo,"<a href=""$2"" >$2</a>")
	re.pattern="(\(a=(.[^\]]*)\))(.[^\[]*)(\(\/a\))"
	memo= re.Replace(memo,"<a href=""$2"" >$3</a>")
	re.pattern="(\(no\))(.[^\[]*)(\(\/no\))"
	memo= re.Replace(memo,"&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x662F;&#x7535;&#x8BDD;&#x53F7;&#x7801;,&#x70B9;&#x51FB;&#x5373;&#x62E8;&#x6253;,&#x8981;&#x614E;&#x91CD;<br/><a href=""wtai://wp/mc;$2"" >$2</a>")
	re.pattern="(\(no=(.[^\]]*)\))(.[^\[]*)(\(\/no\))"
	memo= re.Replace(memo,"&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x662F;&#x7535;&#x8BDD;&#x53F7;&#x7801;,&#x70B9;&#x51FB;&#x5373;&#x62E8;&#x6253;,&#x8981;&#x614E;&#x91CD;<br/><a href=""wtai://wp/mc;$2"" >$3</a>")


	re.Pattern = "(img=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	memo = re.Replace(memo,"<img src=""$2"" alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|[&#x6536;&#x85CF;]<br/>")

    re.pattern="(\(img)\)(.{5,}?)\(/img\)"
	memo = re.Replace(memo,"<img src=""$2""  alt=""wap""/><br/><a href=""$2"">[&#x4E0B;&#x8F7D;]</a>|[&#x6536;&#x85CF;]<br/>")

 re.pattern="\(url=(.{5,}?)\)(.+?)\(/url\)"
	memo = re.Replace(memo,"<a href=""$1"" >$2</a>")

	re.Pattern = "(url=)(http://[A-Za-z0-9\./=\?%\-&_~`@':+!;*()#]+)"
	memo = re.Replace(memo,"<a href=""$2"">$2</a>")

    re.Pattern="(\\)"
	memo = re.Replace(memo,"<br/>")



    re.Pattern="(^.*)(\(my=*([0-9]*)\))(.+?)(\(\/s\))(.*)"
    if not conn.execute("select * from fgr_5fd_ffg where id='"&objgbrs("id")&"' and useid='" & Session("useid") & "'").eof or Cstr(Session("ltglzdl"))=itid or Session("Counter")="pass_numbers_55556666" then
       memo=re.Replace(memo,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x4EF7;&#x503C;$3&#x94BB;&#x5E01;<br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x8D2D;&#x4E70;<br/>$4$6")
	  else
	    memo=re.Replace(memo,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x4EF7;&#x503C;$3&#x94BB;&#x5E01;<br/><anchor>&#x6655;&#x6655;@_@&#x53C8;&#x5F97;&#x6DD8;&#x94B1;&#x4E86;<go method='post' href='buypost.asp?wap=" & wap & "'><postfield name='itid' value='" & itid & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='ids' value='" & objgbrs("tjhm") & "'/><postfield name='page' value='" & page & "'/></go></anchor><br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x8D2D;&#x4E70;<br/>$6")
    end if

 re.Pattern="(^.*)(\(so=*([0-9]*)\))(.+?)(\(\/n\))(.*)"
    if not conn.execute("select * from fgr_5fd_ffg where id='"&objgbrs("id")&"' and useid='" & Session("useid") & "'").eof or Session("Counter")="pass_numbers_55556666" then
       memo=re.Replace(memo,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x662F;&#x4F60;&#x83B7;&#x5F97;$3&#x94BB;&#x5E01;&#x7684;&#x793C;&#x91D1;&#x901A;&#x9053;<br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x9886;&#x53D6;<br/>$4$6")
	  else
	    memo=re.Replace(memo,"$1<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x4EE5;&#x4E0B;&#x6D3E;&#x793C;&#x91D1;$3&#x94BB;&#x5E01;<br/><anchor>&#x54C8;&#x54C8;@_@&#x6709;&#x798F;&#x4E86;,&#x6211;&#x70B9;&#x70B9;&#x70B9;<go method='post' href='sopost.asp?wap=" & wap & "'><postfield name='itid' value='" & itid & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='ids' value='" & objgbrs("tjhm") & "'/><postfield name='page' value='" & page & "'/></go></anchor><br/>&#x5DF2;&#x6709;" & objgbrs("clink") & "&#x4EBA;&#x9886;&#x53D6;<br/>$6")
    end if



    re.pattern="(\(gl)\)(.{5,}?)\(/g\)"
    if Cstr(objgbrs("tjhm"))=Cstr(Session("useid")) or Session("Counter")="pass_numbers_55556666" then
	    memo = re.Replace(memo,"<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x8BE5;&#x6587;&#x7AE0;&#x5185;&#x5BB9;&#x53EA;&#x6709;&#x5F53;&#x5BB6;&#x548C;&#x4F5C;&#x8005;&#x624D;&#x80FD;&#x770B;&#x5230;<br/>$2--")
	  else
	    memo = re.Replace(memo,"<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x8BE5;&#x6587;&#x7AE0;&#x5185;&#x5BB9;&#x53EA;&#x6709;&#x5F53;&#x5BB6;&#x548C;&#x4F5C;&#x8005;&#x624D;&#x80FD;&#x770B;&#x5230;<br/>")
	end if  
	
 re.pattern="(\(jb)\)(.{5,}?)\(/j\)"
    if Cstr(objgbrs("tjhm"))=Cstr(Session("useid")) or Cstr(Session("ltglzdl"))=itid or Session("Counter")="pass_numbers_55556666" then
	    memo = re.Replace(memo,"<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x8BE5;&#x6587;&#x7AE0;&#x5185;&#x5BB9;&#x53EA;&#x6709;&#x8BE5;&#x7248;&#x7248;&#x4E3B;&#x548C;&#x5F53;&#x5BB6;&#x53CA;&#x4F5C;&#x8005;&#x624D;&#x80FD;&#x770B;&#x5230;<br/>$2--")
	  else
	    memo = re.Replace(memo,"<br/>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;:&#x8BE5;&#x6587;&#x7AE0;&#x5185;&#x5BB9;&#x53EA;&#x6709;&#x8BE5;&#x7248;&#x7248;&#x4E3B;&#x548C;&#x5F53;&#x5BB6;&#x53CA;&#x4F5C;&#x8005;&#x624D;&#x80FD;&#x770B;&#x5230;><br/>")
	end if  
	
    re.pattern="(!)(([0-9]*))(!)"
    memo=re.Replace(memo,"<img src=""/bbs/chatroom/img/$3.gif"" alt=""&#x8868;&#x60C5;.""/>")


	set re=Nothing
	UBBCodes=memo
end function

function encodestr(str)
	dim i
	str=trim(str)
	if IsNull(str) then exit function
	str=replace(str,"&","&amp;")
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