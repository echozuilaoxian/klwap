<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%

Option Explicit
'On Error Resume Next
Response.Buffer = True
Server.ScriptTimeout = 600 '服务器连接超时时间
Session.CodePage = 65001

Response.ContentType = "text/vnd.wap.wml; charset=utf-8"
Response.Expires = -1
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "Cache-Control", "no-cache, must-revalidate"

Const PTW_SiteName = "聊天室"  '预定的聊天室名
Const PTW_CookieName ="PTW_Chat"
Const PTW_PageSize = 10
Const PTW_PostTime = 10
Const PTW_AdminName = "admin"    '管理员用户名
Const PTW_AdminPass = "admin"    '密码
Const PTW_HistoryLine = 300		'保存聊天记录的行数
Const PTW_OnlineTime = 600	 	'不活动时间长,600秒不活动就删除
Const PTW_RoomName = "激情聊吧, 我爱聊天, 人在他乡, 心情日记, E网情深"                                   '自带的聊天室
Const PTW_RoomId = "10, 20, 30, 40, 50"  '自带的聊天室ID
Const PTW_RoomPass = ", admin, , , "			'分隔符是", " <- 后面有一小空格
Const PTW_FiltrateText = "Fuck|我靠|草| |"    '过滤不想显示的字
Const PTW_CustomRoom = 1
Const PTW_CustomRoomClearTime = 600  '自建聊天室不活动时间长,600秒不活动就删除

Dim Conn, Sql, FilePath, PageExeTime, SiteName, strNickName   '定义变量
PageExeTime = Timer
SiteName = PTW_SiteName

Dim strAct, strType
strAct = Request.QueryString("act")     '传递变量
strType = Request.QueryString("type")
strNickName = Request.QueryString("nickname")
if strNickName="" then strNickName=Request.Form("nickname")

If strAct = "change" Or Session(PTW_CookieName & "_LoginFail") < 3 Then		'更改昵称
	Dim strChangeNickName
	strChangeNickName = Trim(Left(Html2Code(Replace(Replace(Request.Form("nickname"), "$,$", ""), "#,#", "")), 15))
	If left(strNickName,2) = "游客" Then
		strNickName=strChangeNickName
	End If
End If



If InStr(strNickName, PTW_AdminName) > 0 Then		'检测是否管理员昵称
	If strNickName = PTW_AdminName & PTW_AdminPass Then
		strNickName = PTW_AdminName
		Session(PTW_CookieName & "_AdminLogin") = PTW_AdminName & PTW_AdminPass
	Else
		Session(PTW_CookieName & "_LoginFail") = Session(PTW_CookieName & "_LoginFail") + 1
		strNickName = Empty
		Session(PTW_CookieName & "_AdminLogin") = Empty
	End If
End If


If strNickName = "" Then	'自动分配昵称
	strNickName = "游客ID:" & Right(CLng(Timer), 5)  '取时间数的右5数做为ID区别
End If
FilePath = Request.ServerVariables("Path_Info") & "?nickname=" & Server.UrlEnCode(strNickName)

Function CheckStr(str)
	Dim strContent
	strContent = Trim(str)
	If Not IsNull(strContent) Then
		strContent = Replace(strContent, "'", "")
		strContent = Replace(strContent, "insert", "")
		strContent = Replace(strContent, "delete", "")
		strContent = Replace(strContent, "update", "")
		strContent = Replace(strContent, "select", "")
		strContent = Replace(strContent, "drop", "")
		strContent = Replace(strContent, "alter", "")
		strContent = Replace(strContent, "where", "")
		strContent = Replace(strContent, "create", "")
	End If
	CheckStr = strContent
End Function
' 过滤特殊字符

'检测数字
Function CheckNum(Num, intStartNum, intEndNum)
	CheckNum = intStartNum
	If IsNumeric(Num) And Num <> Empty Then CheckNum = Clng(Num)        
	If intEndNum > -1 Then
		If CheckNum < intStartNum Then CheckNum = intStartNum
		If CheckNum > intEndNum Then CheckNum = intEndNum
	End If
End Function

'转换HTML
Function Html2Code(str)
	Dim strContent
	strContent = Trim(str)
	If Not IsNull(strContent) Then
		strContent = Replace(strContent, "&", "&amp;")
		strContent = Replace(strContent, "<", "&lt;")
		strContent = Replace(strContent, ">", "&gt;")
		strContent = Replace(strContent, Chr(34), "&quot;") '双引号
		strContent = Replace(strContent, Chr(32), "")			'空格
		strContent = Replace(strContent, Chr(10), "<br/>")
		strContent = Replace(strContent, Chr(13), "<br/>") '回车符
		strContent = Replace(strContent, Chr(39), "") '单引号
		strContent = Replace(strContent, "<br/><br/><br/>", "<br/><br/>")
	End If
	Html2Code = strContent
End Function

'分页
Sub ShowPage(intPageCount, intPage, strUrl)
	If intPageCount > 1 Then
		If intPage < intPageCount Then Response.Write "<a href='" & strUrl & "page=" & intPage+1 & "'>下页</a>"
		If intPage <> 1 Then Response.Write "<a href='" & strUrl &"page=" & intPage-1 & "'>上页</a>(" & intPage & "/" & intPageCount & ")<br/><input name=""page"" type=""text"" maxlength=""4"" format=""*N"" size=""5""/><anchor title=""turnform"">GO>><go href=""" & strUrl & "page=$page"" method=""get""></go></anchor><br/>"
	End If
End Sub

'释放内存
Sub FreeApplicationMemory()
	Dim thing
	For Each thing In Application.Contents
		If Left(thing,Len(PTW_CookieName)) = PTW_CookieName Then
			Application.Contents.Remove(thing)
		End If
	Next
End Sub


'检测聊天室Id是否存在
Function CheckRoomId(N)
	Dim i, intChkId
	'自带聊天室
	intChkId = Split(PTW_RoomId, ", ")
	CheckRoomId = False
	For i = 0 To UBound(intChkId)
		If CInt(N) = CInt(intChkId(i)) Then
			CheckRoomId = True
			SiteName = Split(PTW_RoomName, ", ")(i)		'聊天室名称
			strRoomPass = Trim(Split(PTW_RoomPass, ", ")(i))	'聊天室密码
			Exit Function
			Exit For
		End If
	Next
	'自建聊天室
	If PTW_CustomRoom = 1 Then
		Dim ArrContent, ArrList
		ArrContent = Split(Application(PTW_CookieName & "_CustomList"), "$,$")
		CheckRoomId = False
		For i = 0 To UBound(ArrContent)-1
			ArrList = Split(ArrContent(i), "#,#")
			intChkId = ArrList(2)
			If CInt(N) = CInt(intChkId) Then
				CheckRoomId = True
				SiteName = ArrList(0)		'聊天室名称
				strRoomPass = Trim(ArrList(1))	'聊天室密码
				Exit For
			End If
		Next
	End If
End Function

'过滤不文明词语,这个基本不用了
Function FiltrateContent(str)
'	Dim Re
'	Set Re = New Regexp
'	Re.IgnoreCase = True	'不区分大小写
'	Re.Global = True	'全局匹配
'	Re.Pattern = PTW_FiltrateText
'	str = Re.Replace(str, "*")
'	Set Re = Nothing
	Dim ArrFiltrate, i
	ArrFiltrate = Split(PTW_FiltrateText, "|")
	For i = 0 To UBound(ArrFiltrate)
		str = Replace(str, ArrFiltrate(i), "*")
	Next
	FiltrateContent = str
End Function

'分离聊天记录，防止过多聊天记录放入Application (有小问题)
Sub SplitChatHistory(strData, intRoomId)
	Dim ArrContent, iLength, strTmp, i, k
	k = 0
	ArrContent = Split(strData, "$,$")
	If UBound(ArrContent) >= PTW_HistoryLine Then
		iLength = Len(strData)
		For i = iLength-3 To 4 Step -1		'-3去除最后面的"$,$"
			strTmp = Mid(strData, i, 3)		
			If strTmp = "$,$" Then
				Exit For
			Else
				k = k + 1
			End If
		Next
		'Response.Write Left(strData, Len(strData)-k-1)
		Application.Lock()		'写入缓存,锁定进程
		Application(PTW_CookieName & "_RoomId" & intRoomId) = Left(strData, Len(strData)-k-1)
		Application.UnLock()   '解开进程
	End If
End Sub

'显示聊天记录，在线人数，自定义聊天室 列表
Sub ShowList(strData, intRoomId, strInput)
	If strData = Empty Then Exit Sub
	Dim ArrContent, ArrList, i, k
	ArrContent = Split(strData, "$,$")		'分离聊天记录，含有昵称，内容，时间

	Dim intPage, intMaxPage, strUrl
	intMaxPage = Abs(Int((UBound(ArrContent)) / PTW_PageSize*(-1)))
	If intMaxPage <= 0 Then intMaxPage = 1			
	intPage = CheckNum(Request.QueryString("page"), 1, intMaxPage)
	'Response.Write strData
	For i = 0 To PTW_PageSize - 1		'列出聊天信息
		k = (intPage-1) * PTW_PageSize + i
		ArrList = Split(ArrContent(k), "#,#")
		'Response.Write ArrContent(k)
		If strInput = "History" Then		'聊天记录
			Response.Write "[" & ArrList(0) & "]:" & ArrList(1) & ArrList(2) & "<br/>"
		ElseIf strInput = "Online" Then		'在线人数
			Response.Write ArrList(1) & "(" & ArrList(2) & ")<br/>"
		ElseIf strInput = "Custom" Then		'自建聊室
			Dim intCustomOnline
			Response.Write "<a href=""" & FilePath & "&amp;roomid=" & ArrList(2) & """>" & ArrList(0)
			If ArrList(1) <> Empty Then Response.Write "(密)"
			intCustomOnline = UBound(Split(Application(PTW_CookieName & "_OnlineId" & ArrList(2)), "$,$"))
			If intCustomOnline < 0 Then intCustomOnline = 0
			Response.Write "(" & intCustomOnline & ")</a><br/>"

			If strNickName = PTW_AdminName Then Response.Write "<a href=""" & FilePath & "&amp;act=clearapp&amp;id=" & ArrList(2) & """>清</a>(" & Hour(ArrList(3)) & ":" & Minute(ArrList(3)) & ")<br/>"
		End If
		If UBound(ArrContent)-1 = k Then Exit For
	Next

	If strInput = "History" Then
		strUrl = FilePath & "&amp;roomid=" & intRoomId & "&amp;"
	ElseIf strInput = "Online" Then
		strUrl = FilePath & "&amp;roomid=" & intRoomId & "&amp;act=online&amp;"
	ElseIf strInput = "Custom" Then
		strUrl = FilePath & "&amp;act=custom&amp;"
	End If
	Call ShowPage(intMaxPage, intPage, strUrl)
End Sub

'检测聊天室在线人数
Sub CheckRoomOnline(strData, intRoomId, bCheck)
	'bCheck=0没人进入该聊天室
	If strData = Empty And bCheck = 1 Then
		Application.Lock()		'写入缓存,锁定进程
		Application(PTW_CookieName & "_OnlineId" & intRoomId) = Session.SessionId & "#,#" & strNickName & "#,#" & Time & "$,$"
		Application.UnLock() '解开进程
	ElseIf strData <> Empty Then
		Dim ArrContent, strTmp, ArrList, i, bName
		strTmp = strData
		bName = False
		ArrContent = Split(strData, "$,$")		'分离在线记录，含有昵称，时间
		For i = 0 To UBound(ArrContent)-1
			ArrList = Split(ArrContent(i), "#,#")
			If ArrList(0) = Session.SessionId And bCheck = 1 Then		'更新当前浏览者信息
				strTmp = Replace(strTmp, ArrList(1), strNickName)		'更新昵称
				strTmp = Replace(strTmp, ArrList(2), Time)		'更新时间
				bName = True
			Else		'检测其他浏览者
				If DateDiff("s", ArrList(2), Time) > PTW_OnlineTime Then		'超时
					strTmp = Replace(strTmp, ArrList(0) & "#,#" & ArrList(1) & "#,#" & ArrList(2) & "$,$", "")		'清除
				End If
			End If
		Next
		If bName = False And bCheck = 1 Then	'没有当前浏览者信息则添加
			strTmp = Session.SessionId & "#,#" & strNickName & "#,#" & Time & "$,$" & strTmp
		End If
		Application.Lock()		'写入缓存
		Application(PTW_CookieName & "_OnlineId" & intRoomId) = strTmp
		Application.UnLock()
	End If

	If PTW_CustomRoom = 1 Then		'检测自建聊天室活动时间
		strTmp= Application(PTW_CookieName & "_CustomList")
		ArrContent = Split(Application(PTW_CookieName & "_CustomList"), "$,$")		'分离自建聊天室，含有聊天室名，密码，Id，时间
		For i = 0 To UBound(ArrContent)-1
			ArrList = Split(ArrContent(i), "#,#")
			If CInt(ArrList(2)) = intRoomId Then
				strTmp = Replace(strTmp, ArrList(3), Time)		'更新当前聊天室活动时间
			Else
				If DateDiff("s", ArrList(3), Time) > PTW_CustomRoomClearTime Then		'超时
					strTmp = Replace(strTmp, ArrList(0) & "#,#" & ArrList(1) & "#,#" & ArrList(2) & "#,#" & ArrList(3) & "$,$", "")		'清除
				End If
			End If
		Next
		Application.Lock()		'写入缓存
		Application(PTW_CookieName & "_CustomList") = strTmp
		Application.UnLock()
	End If
End Sub

'FreeApplicationMemory
%>