<!--#include FILE="conn.asp"-->

<%On Error Resume Next
sq1="select * from data where id="&request("id")
Set Rs1 = Server.CreateObject("Adodb.Recordset")
rs1.open sq1,conn,1,2
path=rs1("datadir")
rs1.close
Set rs1=Nothing

Response.Buffer = true 
Response.Clear 
dim url 
Dim fso,fl,flsize 
Dim objStream,ContentType,flName,isre,url1  
url=server.MapPath("/")&"\"&path
Set fso=Server.CreateObject("Scripting.FileSystemObject") 
Set fl=fso.getfile(url) 
flsize=fl.size 
flName=fl.name 
Set fl=Nothing 
Set fso=Nothing 
%> 
<% 
Set objStream = Server.CreateObject("ADODB.Stream") 
objStream.Open 
objStream.Type = 1 
objStream.LoadFromFile url 
Select Case lcase(Right(flName, 4)) 
Case ".ota" 
ContentType = "image/vnd.nokia.ota-bitmap"
Case ".jad" 
ContentType = "text/vnd.sun.j2me.app-descriptor"
Case ".jar" 
ContentType = "application/java-archive"
Case ".rng" 
ContentType = "application/vnd.Nokie.ringing-tone"
Case ".sis" 
ContentType = "application/vnd.symbian.install"
Case ".rar" 
ContentType = "application/x-rar-compressed"
Case ".exe" 
ContentType = "application/octet-stream"
Case ".avi" 
ContentType = "video/avi" 
Case ".zip" 
ContentType = "application/zip" 
Case ".gif" 
ContentType = "image/gif" 
Case ".jpg", "jpeg" 
ContentType = "image/jpeg" 
Case ".wav" 
ContentType = "audio/wav" 
Case ".mp3" 
ContentType = "audio/mpeg3" 
Case ".mpg", "mpeg" 
ContentType = "video/mpeg" 
Case Else 
ContentType = "application/octet-stream" 
End Select 
'Response.AddHeader "Content-Disposition", "attachment; filename=" & flName 
Response.AddHeader "Content-Length", flsize 
Response.Charset = "UTF-8" 
Response.ContentType = ContentType 
Response.BinaryWrite objStream.Read 
Response.Flush 
response.Clear() 
objStream.Close 
Set objStream = Nothing 
%> 