<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="../conn.asp" -->
<!-- #include file="../admin.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="文件采集" >
<p>
<%Dim surl,lid
surl=request("url")
lid=request("lid")
if surl<>"" then
Server.ScriptTimeOut=9999999
function getHTTPPage(url) 
on error resume next 
dim http 
set Http=server.createobject("MSXML2.XMLHTTP")
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=Http.responseBody 
set http=nothing 
if err.number<>0 then err.Clear 
end function 

Function BytesToBstr(body,Cset) 
dim objstream 
set objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function 

function saveimage(from,tofile) 
dim geturl,objStream,imgs 
geturl=trim(from) 
imgs=gethttppage(geturl)'
Set objStream = Server.CreateObject("ADODB.Stream")
objStream.Type =1 
objStream.Open 
objstream.write imgs
objstream.SaveToFile server.mappath(tofile),2
objstream.Close()
set objstream=nothing 
end function 
RANDOMIZE
sjs=INT((99-00+1)*RND+00)
name=year(date)&month(date)&day(date)&hour(time())&minute(time())&second(time())&sjs
pictype=Right(surl,3)
if pictype<>"asp" and pictype<>"asa" and pictype<>"php" and pictype<>"spx" and pictype<>"jsp" then
fname=name&"."&pictype
else
fname=name&"非法文件"
end if
tofile="/Upfile/"&fname
saveimage surl,tofile 
End If
if fname<>"" and surl<>"" then
response.write "远程地址:"
response.write surl
response.write "<br/>"
response.write "本地地址:"
response.write ""&tofile&""
response.write "<br/>"
dim ggss
IF InStrRev(tofile,".") > 0 THEN
ggss = mid(tofile,InStrRev(tofile,".")+1)
end if
response.write "文件格式:"
response.write ""&ggss&""
response.write "<br/>"
Set fso=CreateObject("Scripting.FileSystemObject") 
Set f=fso.GetFile(server.mappath(""&tofile&"")) 
filesize=f.size 
response.write "文件大小:"
response.write ""&int(filesize/1024)&"KB"

Else 
response.write "无此文件<br/>"
End If
if lid<>0 then
%>
<br/>文件名称:<input name="name" type="text"/><br/>
文件来源:<input name="laiy" type="text"/><br/>
文件大小:<input name="size<%=minute(now)%><%=second(now)%>" value="<%=int(filesize/1024)%>"/><br/>
文件说明:<input name="title" type="text"/><br/>
文件地址:<input name="tofile<%=minute(now)%><%=second(now)%>" value="<%=tofile%>"/><br/>
<anchor>确认提交
    <go href="getclsave.asp?sid=<%=sid%>" method="post" accept-charset="utf-8">
        <postfield name="name" value="$(name)"/>
         <postfield name="laiy" value="$(laiy)"/>
        <postfield name="title" value="$(title)"/>
        <postfield name='fileurl' value='<%=tofile%>'/>
        <postfield name='ggss' value='<%=ggss%>'/>
        <postfield name='size' value='<%=int(filesize/1024)%>'/>
         <postfield name="lid" value="$(lid)"/>
    </go>
</anchor><br/>
<%else%>
<br/>文件大小:<input name="size<%=minute(now)%><%=second(now)%>" value="<%=int(filesize/1024)%>"/><br/>
文件地址:<input name="tofile<%=minute(now)%><%=second(now)%>" value="<%=tofile%>"/><br/>
<%
end if
conn.close
set conn=nothing
%>
----------<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
