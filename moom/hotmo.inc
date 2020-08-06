<%
Dim intRoomId, bRoomId, strRoomPass , i, strName, intId, strPass, intOnline
intRoomId = CheckNum(Request.QueryString("roomid"), 0, -1)
bRoomId  = CheckRoomId(intRoomId)

If strType = "set" Then	'设置自动刷新
	If Session(PTW_CookieName & "_ChatReLoad") = Empty Then
		Session(PTW_CookieName & "_ChatReLoad") = "yes"
	Else
		Session(PTW_CookieName & "_ChatReLoad") = ""
	End If
End If

'聊天室列表
Sub RoomList()
	If strAct = "clearapp" Then			'清理缓存
		If strNickName = PTW_AdminName Then
			Application.Contents.Remove(PTW_CookieName & "_RoomId" & Request.QueryString("id"))
			Application.Contents.Remove(PTW_CookieName & "_OnlineId" & Request.QueryString("id"))
			Response.Write "清理缓存成功<br/>"
		End If
	End If

	Response.Write "Hello," & strNickName & "<br/><br/>"

Response.Write "==主题聊室==<br/>"
	'自带聊天室列表
	strName = Split(PTW_RoomName, ", ")
	intId = Split(PTW_RoomId, ", ")
	strPass = Split(PTW_RoomPass, ", ")
	For i = 0 To UBound(strName)
		Call CheckRoomOnline(Application(PTW_CookieName & "_OnlineId" & intId(i)), intId(i), 0)	'检测聊天室在线人数
		Response.Write "<a href=""" & FilePath & "&amp;roomid=" & intId(i) & """>" & strName(i)
		If Trim(strPass(i)) <> Empty Then Response.Write "(密)"
		intOnline = UBound(Split(Application(PTW_CookieName & "_OnlineId" & intId(i)), "$,$"))
		If intOnline < 0 Then intOnline = 0
		Response.Write "(" & intOnline & ")</a><br/>"

		If strNickName = PTW_AdminName Then Response.Write "<a href=""" & FilePath & "&amp;act=clearapp&amp;id=" & intId(i) & """>清</a><br/>"
	Next


	If PTW_CustomRoom = 1 Then
		Response.Write "<br/>==自建聊室==<br/>"
CustomRoomList     '自建聊天室列表
	End If


Response.Write "<br/>修改用户名(只能是字母和数字)<br/><input name=""nickname"" type=""text"" maxlength=""10"" size=""10"" emptyok=""false"" value=""助手(xh6666.cn)"" /><anchor title=""change"">确定<go href=""index.Asp?ts="&time()&""" method=""get""><postfield name=""nickname"" value=""$(nickname)ID:" & Right(CLng(Timer), 5)&""" /></go></anchor><br/>"
End Sub
	
'自建聊天室列表
Sub CustomRoomList()	

	SiteName = "开设聊天室"
	If strType= "yes" Then		'新建聊天室
		Dim strCustomRoom, strCustomPass, bCheckCustom
		bCheckCustom = True
		strCustomRoom = Trim(Left(Html2Code(Replace(Replace(Request.Form("roomname"), "$,$", ""), "#,#", "")), 10))
		strCustomPass = Trim(Left(Html2Code(Replace(Replace(Request.Form("roompass"), "$,$", ""), "#,#", "")), 10))
		If strCustomRoom <> Empty Then
			'检测自建聊天室名
			
			If bCheckCustom = True Then
				Randomize
				Dim intRndId
				intRndId = "188" & Int(rnd*50)
				Application.Lock()
				Application(PTW_CookieName & "_CustomList") = strCustomRoom & "#,#" & strCustomPass & "#,#" &  intRndId & "#,#" & Time & "$,$" & Application(PTW_CookieName & "_CustomList")
				Application.UnLock()
				If strCustomPass <> Empty Then	Session(PTW_CookieName & "_Login") = strCustomPass
				Response.Redirect FilePath & "&roomid=" & intRndId
			End If
		End If
	End If



	Call ShowList(FiltrateContent(Application(PTW_CookieName & "_CustomList")), 0, "Custom")		'显示自建聊天室



	Response.Write "<br/>功能==<br/>房名<input name=""roomname"" type=""text"" maxlength=""10"" size=""10"" emptyok=""false""/>*<br/>密码<input name=""roompass"" type=""text"" maxlength=""10"" size=""10"" /><br/><anchor title=""change"">确定开设<go href=""" & FilePath & "&amp;act=custom&amp;type=yes"" method=""post""><postfield name=""roomname"" value=""$roomname"" /><postfield name=""roompass"" value=""$roompass"" /></go></anchor>"
End Sub

'聊天室记录
Sub ChatList()
	If strType = "check" Then		'检测密码
		If Session(PTW_CookieName & "_LoginFail") >= 3 Then
			Response.Write "禁止进入<br/>"
			Exit Sub
		End If
		Dim strInputPass
		strInputPass = Trim(Request.Form("pass"))
		If strInputPass = strRoomPass Then
			Session(PTW_CookieName & "_Login") = strRoomPass
		Else
			Response.Write "密码错误<br/>"
			Session(PTW_CookieName & "_LoginFail") = Session(PTW_CookieName & "_LoginFail") + 1
		End If
	End If

	If strRoomPass <> Empty And Session(PTW_CookieName & "_Login") <> strRoomPass Then		'含有密码保护的房间
		Response.Write "输入密码<br/><input name=""pass"" type=""text"" maxlength=""30"" size=""10"" emptyok=""false"" value="" "" /><anchor title=""Write"">进入<go href=""" & FilePath & "&amp;type=check&amp;roomid=" & intRoomId &""" method=""post""><postfield name=""pass"" value=""$pass"" /></go></anchor><br/>"
		Exit Sub
	End If

	If strType = "write" Then		'发言
		Dim strChatContent, strSend
		strChatContent = Left(Html2Code(Replace(Replace(Request.Form("content"), "$,$", ""), "#,#", "")), 60)
		If strChatContent <> Empty And DateDiff("s", Session(PTW_CookieName & "_ChatPost"), Now) > PTW_PostTime Then
			strSend = strNickName & "#,#" & strChatContent & "#,#" & "(" & Hour(Time) & ":" & Minute(Time) & ")$,$"		'串
			Call SplitChatHistory(Application(PTW_CookieName & "_RoomId" & intRoomId), intRoomId)		'分离聊天记录
			Application.Lock()		'写入缓存,锁定进程
			Application(PTW_CookieName & "_RoomId" & intRoomId) = strSend & Application(PTW_CookieName & "_RoomId" & intRoomId)
			Application.UnLock()
			Session(PTW_CookieName & "_ChatPost") = Now
			Response.Write "OK,发言成功<br/>"
		Else
			Response.Write "速度过快,喝杯水先吧.<br/>"
		End If
	End If
	
	Response.Write Time & "<br/>"
	If Session(PTW_CookieName & "_ChatReLoad") = Empty Then
		Response.Write "<input name=""content"" type=""text"" maxlength=""50"" size=""10"" emptyok=""false"" value="" ""/><anchor title=""write"">发言<go href=""" & FilePath & "&amp;type=write&amp;roomid=" & intRoomId &""" method=""post""><postfield name=""content"" value=""$content"" /></go></anchor>"
	Else
		Response.Write "<a href=""" & FilePath & "&amp;act=chat&amp;roomid=" & intRoomId & """>发言</a>"
	End If
	Response.Write "&nbsp;<a href=""" & FilePath & "&amp;roomid=" & intRoomId & """>刷新</a>&nbsp;<a href=""" & FilePath & "&amp;roomid=" & intRoomId & "&amp;act=online"">在线</a><br/>"
	
	Call CheckRoomOnline(Application(PTW_CookieName & "_OnlineId" & intRoomId), intRoomId, 1)	'检测聊天室在线人数
	If Application(PTW_CookieName & "_RoomId" & intRoomId) <> Empty Then
		Call ShowList(FiltrateContent(Application(PTW_CookieName & "_RoomId" & intRoomId)), intRoomId, "History")		'列出聊天记录
	End If

	If Session(PTW_CookieName & "_ChatReLoad") = Empty Then
		Response.Write "<br/><a href=""" & FilePath & "&amp;type=set&amp;roomid=" & intRoomId & """>自动刷新</a><br/>"
	Else
		Response.Write "<br/><a href=""" & FilePath & "&amp;type=set&amp;roomid=" & intRoomId & """>关闭刷新</a><br/>"
	End If

End Sub

'聊室在线人数
Sub OnlineList()
	Call ShowList(FiltrateContent(Application(PTW_CookieName & "_OnlineId" & intRoomId)), intRoomId, "Online")		'列出在线人数
	Response.Write "<a href=""" & FilePath & "&amp;roomid=" & intRoomId & """>" & SiteName & "</a><br/>"
End Sub

'发言的表单
Sub ChatForm()
	Response.Write Time & "<br/>"
	Response.Write "<input name=""content"" type=""text"" maxlength=""60"" size=""10"" emptyok=""false"" value="" "" /><anchor title=""write"">发言<go href=""" & FilePath & "&amp;type=write&amp;roomid=" & intRoomId &""" method=""post""><postfield name=""content"" value=""$content"" /></go></anchor><br/><a href=""" & FilePath & "&amp;roomid=" & intRoomId & """>返回</a><br/>"
End Sub

Sub Main()
	If bRoomId = False And (strAct = Empty Or strAct = "clearapp") Then
		RoomList
	ElseIf bRoomId = False And strAct = "custom" Then
		CustomRoomList
	ElseIf bRoomId = True And strAct = "online" Then
		OnlineList
	Else
		If bRoomId = True And strAct = "chat" Then
			ChatForm
		Else
			ChatList
		End If
	End If

	If bRoomId = True Or strAct = "custom" Then Response.Write "<a href=""" & FilePath & """>返回聊天室</a>"
	

End Sub
%>