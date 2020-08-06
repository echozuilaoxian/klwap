<%
Sub EditDb
On error resume next
  If fs.FileExists(server.mappath(dbfile)) Then
	  Response.Write "创建成功"
  Else
	  Response.Write "No database found" &vbCrLf
	End If
End Sub

Sub CreateNewFolder
On error resume next
%>
<b>创建文件夹</b><br/>
当前文件夹: <%=spath%><br/>
<input name='logo<%=minute(now)%><%=second(now)%>' title='文件夹名' value='<%=ubb(rs("logo"))%>'/><br/>
<anchor>[在当前文件夹创建]<go href='<%=scriptname%>?action=newfolder&amp;path=<%=sPath%>&amp;sid=<%=sid%>' method='post' accept-charset='utf-8'>
<postfield name='folder' value='$(logo<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>
<%

End Sub

Sub EditFile
On error resume next
'文件内容查看组件测试通过
  Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
  Set ReadStream = fs.OpenTextFile(server.mappath(sFile))
  filename=request.querystring("file")
  response.write ("<br/>")  
  Response.write "查看当前文件: "
  response.write "文件名:<b>"&filename&"</b>"
  response.write "<br/>"
  Response.Write "文件内容<input name='newfilestuff"&minute(now)&second(now)&"' value='" & ubb(ReadStream.ReadAll) & "'/>"

Response.Write "<br/><anchor>[编辑文件]<go href='?action=savefile&amp;path=" & sPath & "&amp;file=" & Request.Querystring("File") & "&amp;overwrite=yes&amp;sid="&sid&"' method='post' accept-charset='utf-8'><postfield name='filestuff' value='$(newfilestuff"&minute(now)&second(now)&")'/><postfield name='reset' value='$(reset"&minute(now)&")'/></go></anchor><br/>"
End Sub


Sub UploadFiles
On error resume next
%>
<br/>当前文件夹:<b> <%=spath%></b><br/>
<input type="file" name="FILE1<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE2<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE3<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE4<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE5<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE6<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE7<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE8<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE9<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<input type="file" name="FILE10<%=minute(now)%><%=second(now)%>" size="16"/><br/>
<anchor>[往当前文件夹上传资料]<go href='upload.asp?sid=<%=sid%>' method='post' accept-charset='utf-8'>
<postfield name='FILE1' value='$(FILE1<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE2' value='$(FILE2<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE3' value='$(FILE3<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE4' value='$(FILE4<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE5' value='$(FILE5<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE6' value='$(FILE6<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE7' value='$(FILE7<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE8' value='$(FILE8<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE9' value='$(FILE9<%=minute(now)%><%=second(now)%>)'/>
<postfield name='FILE10' value='$(FILE10<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>
<%
End Sub



Sub CreateFile
On error resume next
response.write "需要完整的WML代码，否则会出错！<br/><b>创建新文件[wml]</b><br/>"
Session("lastpage") = Request.ServerVariables("HTTP_REFERER") 
Response.Write "<input name='file"&minute(now)&"' value=''/>给文件取名（.wml前的名称）<br/>"
Response.Write "文件内容<br/><input name='newfilestuff"&minute(now)&"' value=''/>"
Response.Write "<br/><anchor>[创建文件]<go href='" & scriptname & "?action=savefile&amp;path=" & sPath & "&amp;sid="&sid&"' method='post' accept-charset='utf-8'><postfield name='file' value='$(file"&minute(now)&")'/><postfield name='newfilestuff' value='$(newfilestuff"&minute(now)&")'/></go></anchor><br/>建议使用源码查看器复制代码"

End Sub

Sub SaveFile
On error resume next
  '' the save as a new file routine
  if request.form("NewFileName")<>"" then
  NewFileName=request.form("NewFileName")
  spath=request("path")
    if spath="/" then slashvalue="" else slashvalue="/" end if
  filestuff=request.form("filestuff")
  NewPathFileName= spath&slashvalue&newfilename''creating the right path and filename
    Set fso = CreateObject("Scripting.FileSystemObject")
	Set textStreamObject = fso.CreateTextFile(server.mappath(NewPathFileName),true,false)
	textStreamObject.write filestuff
  Response.write "建立文件成功1"
  else
  If Request.Querystring("overwrite") = "yes" Then
    set fs=Server.CreateObject("Scripting.FileSystemObject")
	Set WriteFile = fs.CreateTextFile(server.mappath(sFile), true)
	WriteFile.Write Request.Form("filestuff")''filestuff''Session("filestuff")
    WriteFile.Close
  Response.write "编辑文件成功"
	
  Else
	Session("lastpage") = Request.ServerVariables("HTTP_Referer")
    If fs.FileExists(server.mappath(sFile)) Then
      Session("sFile") = sFile
	  spath=request.querystring("path")
      Session("newfilestuff") = Request.Form("newfilestuff")
      Response.Write "<br/>Filename already exists:  <b>" & sFile & "</b> "
      Response.Write "<a href=""" & scriptname & "?action=savenewfile&amp;overwrite=yes"">Replace existing file?</a>"
      ' We don't want to lose the information that the typed in the previous form if they decide NOT to overwrite the existing file,
	  ' so we provide a javascript link back that works exactly the same as the browser's back button.
Response.Write "<a href=""javascript:history.back()"">Back to the previous page</a>"
      Response.Write ""
    Else 
      Set WriteFile = fs.CreateTextFile(server.mappath(sFile), false)
      WriteFile.Write Request.Form("newfilestuff")
      WriteFile.Close
  Response.write "建立文件成功"
    End If
  End If
  end if
End Sub

Sub CreateFolder
On error resume next
 
 Session("lastpage") = request.querystring("path")
 If fs.FolderExists(server.mappath(sFolder)) Then 
   response.write "A folder with the name <b>" & sFolder & "</b> already exists<br/>"  
 Else
   fs.CreateFolder(server.mappath(sFolder))
response.redirect("fileman?action=viewfolder&amp;path="&session("lastpage")&"&amp;sid="&sid&"")


 End If
End Sub

Sub DeleteFile
On error resume next
	response.write"<br/>"
  If Request.Querystring("commit") <> "yes" Then
    Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
    Session("sFile") = sFile
    Response.Write "你即将删除的文件是:  " & sFile & ". " 
    If sFileType = "jpg" OR sFileType = "gif" Then
      Response.Write "<img src=""http://" & Request.ServerVariables("HTTP_HOST") & sfile & """/>"
    End If
    Response.Write "<br/><b>注意：删除后将不可恢复！</b><br/>"
    Response.Write "<a href=""" & scriptname & "?action=deletefile&amp;sid="&sid&"&amp;path=" & sPath & "&amp;file=" & sFile & "&amp;commit=yes"">确认</a>"
    Response.Write "|<a href='fileman.asp?action=viewfolder&amp;path="&request.querystring("path")&"&amp;sid="&sid&"'>停止</a>"
  Else
    fs.DeleteFile(server.mappath(Session("sFile")))
    Response.Redirect("" & Session("lastpage") & "")
    Response.Write "删除成功"
  End If
End Sub

Sub DeleteFolder
On error resume next
	response.write"<br/>"
  If Request.Querystring("commit") <> "yes" Then 
    Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
    Session("sFolder") = sFolder
    Response.Write "文件夹: " & sFolder & ". " 
    Response.Write "<br/><b>删除后不可以恢复!</b>"
    Response.Write "<br/><a href=""" & scriptname & "?action=deletefolder&amp;path=" & sPath & "&amp;sid="&sid&"&amp;folder=" & sFolder &  "&amp;commit=yes"">确认</a>|"
    Response.Write "停止"
  Else
    Response.Write sPath & "<br/>"
    Response.Write sFile & "<br/>"
    Response.Write "删除成功!"
    fs.DeleteFolder(server.mappath(Session("sFolder")))
    Response.Redirect("" & Session("lastpage") & "")
  End If
End Sub

Sub RenameFolder

On error resume next
	response.write"<br/>"
	Response.write "<b>重命名文件夹</b><br/>"
  If Request.querystring("commit") <> "yes" Then 
    Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
    Response.Write "原文件夹名: <b>" & request.querystring("folder") & "</b><br/>" 
%>
新文件夹名:<br/>
<input name='name<%=minute(now)%><%=second(now)%>' title='名称' value='<%=ubb(rs("name"))%>'/><br/>
<anchor>[确定更改]<go href='fileman.asp?sid=<%=sid%>&amp;action=RenameFolder&amp;path=<%=spath%>&amp;folder=<%=request.querystring("folder")%>&amp;commit=yes' method='post' accept-charset='utf-8'>
<postfield name='NewFolderName' value='$(name<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>
<%
  Else
	NewFolderName=request.form("NewFolderName")
	sFolder=request.form("folder")
	if spath="/" then slashvalue="" else slashvalue="/" end if
    Set fso = CreateObject("Scripting.FileSystemObject")
	Set folderObject = fso.GetFolder(Server.MapPath(spath&slashvalue&sFolder))
	FolderObject.Name=NewFolderName
	 Set folderObject = Nothing
	 Set fso = Nothing
	  Response.Redirect("" & Session("lastpage") & "") 
    Response.Write "重命名成功<br/>" 
   End If
  
End Sub

Sub RenameFile
On error resume next
  response.write"<br/>"
  If Request("commit") <> "yes" Then 
    Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
    Response.Write "您确认重命名: <b>" & request.querystring("file") & "</b><br/>" 
%>
新名称<input name='logo<%=minute(now)%><%=second(now)%>' title='名称' value='<%=ubb(rs("logo"))%>'/><br/>
<anchor>[确定重命名]<go href='fileman.asp?action=RenameFile&amp;path=<%=spath%>&amp;folder=<%=request.querystring("folder")%>&amp;commit=yes&amp;sid=<%=sid%>' method='post' accept-charset='utf-8'>
<postfield name='NewFileName' value='$(logo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='filename' value='<%=request.querystring("file") %>'/>
</go></anchor><br/>
  <%
  Else
  	NewFileName=request.form("NewFileName")
	Sfile=request.form("filename")
sssjhhhw=Lcase(fs.GetExtensionName(NewFileName))
if sssjhhhw="asp" or sssjhhhw="asa" or sssjhhhw="php" or sssjhhhw="spx" or sssjhhhw="jsp" then
NewFileName=NewFileName&".非法文件"
end if    
	if spath="/" then slashvalue="" else slashvalue="/"
    Set fso = CreateObject("Scripting.FileSystemObject")
	Set FileObject = fso.GetFile(Server.MapPath(spath&slashvalue&sfile))
	FileObject.Name = NewFileName
	Set FilObject = Nothing
	Set fso = Nothing
Response.Write "重命名成功<br/>" 
  End If
  
End Sub

Sub FileTypeUnsupported
On error resume next
  Session("lastpage") = Request.ServerVariables("HTTP_REFERER")
  filename=request.querystring("file")
  response.write ("<br/>")  
  Response.write "查看文件: "
  response.write ""&filename&""
  response.write "<br/>"
  If sFileType = "jpg" OR sFileType = "gif" OR sFileType = "GIF" OR sFileType = "JPG" Then
    Response.Write "<img src='http://" & Request.ServerVariables("HTTP_HOST") & sfile & "' alt='图片'/>"
  else
    Response.Write "<br/>未知文件格式<br/><br/>"
  End If
  Response.Write ""
End Sub

Sub Size(itemsize)
  Select case Len(itemsize)
  Case "1", "2", "3" 
    Response.Write itemsize & " bytes"
  Case "4", "5", "6"
    Response.Write Round(itemsize/1000) & " Kb"
  Case "7", "8", "9"
    Response.Write Round(itemsize/1000000) & " Mb"
  End Select
End Sub

Sub ShowList

  %>
文件管理组件<br/>
  <%
  
    ' Use the GetFolder method of the filesystemobject to get the contents of the directory specified in sPath  
  Set fileobject = fs.GetFolder(server.mappath(sPath))
	' Use the SubFolders property to get the folders contained in the directory specified in sPath
  Set foldercollection = fileobject.SubFolders 
    ' Start the code to alternate line colors - just to make the display a little less visually confusing.
  lineid=0
  bgcolor = ""

  ' Loop through the folders contained in the foldercollection and display their information on the page
  For Each folder in foldercollection 
    ' Apply our alternating line coloring
    If lineid = 0 Then
      bgcolor = bgcolor_off
      lineid = 1
    Else
      bgcolor = bgcolor_on
      lineid = 0
    End if		

		Response.Write "" &vbCrLf
		If Right(sPath,1)="/" Then
	    Response.Write "<a href=""" & scriptname & "?action=viewfolder&amp;sid="&sid&"&amp;path=" & sPath & folder.name & """>" & folder.name & "</a>"

		Else
		  Response.Write "<a href=""" & scriptname & "?action=viewfolder&amp;sid="&sid&"&amp;path=" & sPath &"/" &folder.name & """>" & folder.name & "</a>"

		End If  

	  Response.Write " " 

Call Size(folder.size)
if ssss<>"" then Response.Write "" & folder.datelastmodified & ""
	  Response.Write "<a href=""" & scriptname & "?action=RenameFolder&amp;path=" & sPath & "/" & folder.name & "&amp;sid="&sid&"&amp;folder=" & folder.name & """>改名</a> <a href=""" & scriptname & "?action=deletefolder&amp;sid="&sid&"&amp;path=" & sPath & "&amp;folder=" & folder.name & """>删除</a><br/>"
  Next 
  Set foldercollection=nothing

  ' Use the Files property to get the files contained in the directory specified in sPath
  Set filecollection = fileobject.Files
  
	 'Loop through the files contained in the filescollection and dislay their information on the page
	For Each file in filecollection 
     'Apply our alternating line coloring
    If lineid = 0 Then
      bgcolor = bgcolor_off
      lineid = 1
    Else
      bgcolor = bgcolor_on
      lineid = 0
    End if	
%>
  <%
	if fs.GetExtensionName(file.name)="gif" then image="图片"
	if fs.GetExtensionName(file.name)="pdf" then image="PDF"
	if fs.GetExtensionName(file.name)="css" then image="CSS"
	if fs.GetExtensionName(file.name)="doc" then image="DOC"
	if fs.GetExtensionName(file.name)="xls" then image="未知"
	if fs.GetExtensionName(file.name)="exe" then image="可执行文件"
	if fs.GetExtensionName(file.name)="zip" then image="压缩"
	if fs.GetExtensionName(file.name)="jpg" then image="图片"
	if fs.GetExtensionName(file.name)="jpeg" then image="图片"
	if fs.GetExtensionName(file.name)="htm" then image="HTM"
	if fs.GetExtensionName(file.name)="html" then image="HTML"
	if fs.GetExtensionName(file.name)="wml" then image="WML"
	if fs.GetExtensionName(file.name)="swf" then image="FSAHL"
	if fs.GetExtensionName(file.name)="asp" then image="ASP"
	if fs.GetExtensionName(file.name)="txt" then image="TXT"
	if fs.GetExtensionName(file.name)="inc" then image="INC"
	if fs.GetExtensionName(file.name)="js" then image="JS"
	if fs.GetExtensionName(file.name)="mdb" then image="MDB"
	
if image="" then image= "未知"
Response.Write ""&image&" <a href=""" & scriptname & "?action=editfile&amp;sid="&sid&"&amp;path=" & sPath & "&amp;file=" & file.name & "&amp;filetype=" & Lcase(fs.GetExtensionName(file.name)) & """>" & file.name & "</a> "
Call Size(file.size)
if ssss<>"" then
Response.Write "" & file.datelastmodified & ""
end if
Response.Write "<br/><a href=""" & scriptname & "?action=RenameFile&amp;sid="&sid&"&amp;path=" & sPath & "&amp;file=" & file.name & "&amp;filetype=" & Lcase(fs.GetExtensionName(file.name)) & """>改名</a>|"
Response.Write "<a href=""" & scriptname & "?action=deletefile&amp;sid="&sid&"&amp;path=" & sPath & "&amp;file=" & file.name & "&amp;filetype=" & Lcase(fs.GetExtensionName(file.name)) & """>删除</a>|<a href='" & sPath & "/" & file.name & "'>访问</a><br/>"
  Next
  ' We are done displaying information about files and folders in this directory, so close the table.
End Sub
Sub DisplayErrors
  Response.Write "错误编号：" & errornum & "<br/>"
	Response.Write "" & errorcode & ""
End Sub

%>


