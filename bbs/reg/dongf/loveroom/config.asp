<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'============================================================
' Copyright 2006 TakWai. All Rights Reserved.
' Last Update: 22:38 2006-6-25
' MSN / E-Mail: haikuop@163.com.com
'============================================================

Option Explicit
'On Error Resume Next
Response.Buffer = True
Server.ScriptTimeout = 15
Session.CodePage = 65001

Response.ContentType = "text/vnd.wap.wml; charset=utf-8"
Response.Expires = -1
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "Cache-Control", "no-cache, must-revalidate"

Const PTW_SiteName = "我的房间"
Const PTW_CookieName = "PTW_Chat"
Const PTW_PageSize = 10
Const PTW_PostTime = 10
Const PTW_AdminName = "狂野之城"
Const PTW_AdminPass = "admin"
Const PTW_HistoryLine = 300		'保存聊天记录的行数
Const PTW_OnlineTime = 600	 	'不活动时间
Const PTW_RoomName = "广厦宾馆, 白天鹅宾观, 北京宾观, 芳香宾馆, 香格里拉大酒店"
Const PTW_RoomId = "10, 20, 30, 40, 50"
Const PTW_RoomPass = ", admin, , , "			'分隔符是", " <- 后面有一小空格
Const PTW_FiltrateText = "Fuck|我靠|草| |"
Const PTW_CustomRoom = 1
Const PTW_CustomRoomClearTime = 600

Dim Conn, Sql, FilePath, PageExeTime, SiteName, strNickName
PageExeTime = Timer
SiteName = PTW_SiteName

Dim strAct, strType, waps
waps=request.querystring("SessionID")
strAct = Request.QueryString("act")
strType = Request.QueryString("type")

strNickName = Request.QueryString("nickname")

If strAct = "change" Or Session(PTW_CookieName & "_LoginFail") < 3 Then		'更改昵称
	Dim strChangeNickName
	strChangeNickName = Trim(Left(Html2Code(Replace(Replace(Request.Form("nickname"), "$,$", ""), "#,#", "")), 10))
	If strNickName <> Empty Then
		strNickName = strChangeNickName
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

If Session(PTW_CookieName & "_AdminLogin") <> Empty Then strNickName = Replace(Session(PTW_CookieName & "_AdminLogin"), PTW_AdminPass, "")
If strNickName = Empty Then	'自动分配昵称
	strNickName = "房客" & Right(CLng(Timer), 3)
End If
FilePath = Request.ServerVariables("Path_Info") & "?nickname=" & Server.UrlEnCode(strNickName)

Function CheckStr(str)
	Dim strContent
	strContent = Trim(str)
	If Not IsNull(strContent) Then
		strContent = Replace(strContent, "'", "''")
		strContent = Replace(strContent, "insert", "ins&#101;rt")
		strContent = Replace(strContent, "delete", "del&#101;te")
		strContent = Replace(strContent, "update", "up&#100;ate")
		strContent = Replace(strContent, "select", "sel&#101;ct")
		strContent = Replace(strContent, "drop", "dro&#112;")
		strContent = Replace(strContent, "alter", "alt&#101;r")
		strContent = Replace(strContent, "where", "wh&#101;re")
		strContent = Replace(strContent, "create", "cr&#101;ate")
	End If
	CheckStr = strContent
End Function

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
		strContent = Replace(strContent, Chr(39), "&#39;") '单引号
		strContent = Replace(strContent, "<br/><br/><br/>", "<br/><br/>")
	End If
	Html2Code = strContent
End Function

'分页
Sub ShowPage(intPageCount, intPage, strUrl)
	If intPageCount > 1 Then
		If intPage < intPageCount Then Response.Write "<a href='" & strUrl & "&amp;SessionID=" & SessionID & "&amp;page=" & intPage+1 & "'>[下页]</a>"
		If intPage <> 1 Then Response.Write "<a href='" & strUrl &"&amp;SessionID=" & SessionID & "&amp;page=" & intPage-1 & "'>[上页]</a>"
		Response.Write "(" & intPage & "/" & intPageCount & ")<br/>"
		Response.Write "<input name=""page"" type=""text"" maxlength=""4"" format=""*N"" size=""5""/>"
		Response.Write "<anchor title=""turnform"">跳转"
		Response.Write "<go href=""" & strUrl & "&amp;SessionID=" & SessionID & "&amp;page=$page"" method=""get"">"
		Response.Write "</go></anchor><br/>"
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

Sub ShowExeTime()
	Response.Write "<br/>" & Ccur(Timer - PageExeTime)*1000 & "ms"
End Sub

'检测聊天室Id是否存在
Function CheckRoomId(N)
	Dim i, intChkId
	'常规房间
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
	'自建房间
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

'过滤不文明词语
Function FiltrateContent(str)
'	用正则怎么这么慢...
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
		Application.Lock()		'写入缓存
		Application(PTW_CookieName & "_RoomId" & intRoomId) = Left(strData, Len(strData)-k-1)
		Application.UnLock()
	End If
End Sub

'显示聊天记录，在线人数，自定义聊天室 列表
Sub ShowList(strData, intRoomId, strInput)
	If strData = Empty Then Exit Sub
	Dim ArrContent, ArrList, i, k
	ArrContent = Split(strData, "$,$")		'分离聊天记录，含有昵称，内容，时间

	Dim intPage, intMaxPage, strUrl
	intMaxPage = Abs(Int((UBound(ArrContent)) / PTW_PageSize*(-1)))
	If intMaxPage <= 0 Then intMaxPage = 1			'当UBound(ArrContent)为0时，会出现该情况???
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
		ElseIf strInput = "Custom" Then		'自建房间
			Dim intCustomOnline
			Response.Write "<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & ArrList(2) & """>" & ArrList(0)
			If ArrList(1) <> Empty Then Response.Write "(密)"
			intCustomOnline = UBound(Split(Application(PTW_CookieName & "_OnlineId" & ArrList(2)), "$,$"))
			If intCustomOnline < 0 Then intCustomOnline = 0
			Response.Write "(" & intCustomOnline & ")"
			Response.Write "</a>"
			If strNickName = PTW_AdminName Then Response.Write "<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;act=clearapp&amp;id=" & ArrList(2) & """>清</a>"
			Response.Write "(" & Hour(ArrList(3)) & ":" & Minute(ArrList(3)) & ")<br/>"
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
	'bCheck=0还没进入聊天室
	If strData = Empty And bCheck = 1 Then
		Application.Lock()		'写入缓存
		Application(PTW_CookieName & "_OnlineId" & intRoomId) = Session.SessionId & "#,#" & strNickName & "#,#" & Time & "$,$"
		Application.UnLock()
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

	If PTW_CustomRoom = 1 Then		'检测自建房间活动时间
		strTmp= Application(PTW_CookieName & "_CustomList")
		ArrContent = Split(Application(PTW_CookieName & "_CustomList"), "$,$")		'分离自建房间，含有房间名，密码，Id，时间
		For i = 0 To UBound(ArrContent)-1
			ArrList = Split(ArrContent(i), "#,#")
			If CInt(ArrList(2)) = intRoomId Then
				strTmp = Replace(strTmp, ArrList(3), Time)		'更新当前自建房间活动时间
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