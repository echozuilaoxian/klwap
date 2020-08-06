<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
gx="/gx/"
Function AllPath()
    Dim Domain,GFilePath
    Domain    = Request.ServerVariables("SERVER_NAME")
    GFilePath = Request.ServerVariables("PATH_INFO")
    GFilePath = lcase(left(GFilePath,instrRev(GFilePath,"/")))
    AllPath    = "http://"&Domain&GFilePath
End Function

Function ShowFileList(folderspec)
    Dim Path,objFSO,objFolder,count,objFile,nume,S
    Path = Server.MapPath(folderspec)
    Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
    If objFSO.FolderExists(Path) Then
       Set objFolder = objFSO.GetFolder(Path)
       count = 0
       For Each objFile in objFolder.Files
           count = count+1
       Next
       randomize
       nume = Int((count*rnd)+1)
       S = 0
       ShowFileList = ""
       For Each objFile in objFolder.Files
       S = S + 1
         If S = nume Then
         ShowFileList = objFile.Name
         Exit For
         End If
       Next
       Set objFolder = Nothing
    Else
    ShowFileList = "NO"
    End If
    Set objFSO = Nothing
End Function

Dim list,filename,address,str

list = trim(Request.QueryString("list"))
if list = "" then
   Response.write "本页需要正确参数引入,您缺少相关的参数！正确格式如下："&AllPath&"img.asp?list=图片存放目录"
   Response.End()
end if

filename = ShowFileList("./"&list&"/")
if filename = "NO" then
   Response.write "您指定的目录<b>"&list&"</b>不存在，请重新指定！"
   Response.End()
end if

if filename = "" then
   Response.write "您指定的目录<b>"&list&"</b>没有相关的图片文件存在，请重新指定！"
   Response.End()
end if

str = right(filename,4)
if str<>".jpg" and str<>".gif" and str<>".bmp" and str<>".png" and str<>"jepg" then
filename = "erro.gif"
end if

address = AllPath&list&"/"
address = address&filename
%>
<%Response.redirect(address)%>