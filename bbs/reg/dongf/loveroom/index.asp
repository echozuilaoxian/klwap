<!--#include file="config.asp"-->
<%
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
%>
<%
'============================================================
' Copyright 2006 TakWai. All Rights Reserved.
' Last Update: 22:38 2006-6-25
' MSN / E-Mail: pongtakwai@hotmail.com
'============================================================
Dim intRoomId, bRoomId, strRoomPass,SessionID
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
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

	Response.Write "欢迎:" & strNickName & "<br/>"

	Dim i, strName, intId, strPass, intOnline

	If PTW_CustomRoom = 1 Then
		Response.Write "<a href=""" & FilePath & "&amp;act=custom&amp;SessionID=" &SessionID& """>开设房间"
		Dim intCustomListNum
		intCustomListNum = UBound(Split(Application(PTW_CookieName & "_CustomList"), "$,$"))
		If intCustomListNum < 0 Then intCustomListNum = 0
		Response.Write "(" & intCustomListNum & ")"
		Response.Write "</a><br/>"
	End If

	'常规聊天室列表
	strName = Split(PTW_RoomName, ", ")
	intId = Split(PTW_RoomId, ", ")
	strPass = Split(PTW_RoomPass, ", ")
	For i = 0 To UBound(strName)
		Call CheckRoomOnline(Application(PTW_CookieName & "_OnlineId" & intId(i)), intId(i), 0)	'检测聊天室在线人数
		Response.Write "<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & intId(i) & """>" & strName(i)
		If Trim(strPass(i)) <> Empty Then Response.Write "(密)"
		intOnline = UBound(Split(Application(PTW_CookieName & "_OnlineId" & intId(i)), "$,$"))
		If intOnline < 0 Then intOnline = 0
		Response.Write "(" & intOnline & ")"
		Response.Write "</a>"
		If strNickName = PTW_AdminName Then Response.Write "<a href=""" & FilePath & "&amp;act=clearapp&amp;SessionID=" & SessionID & "&amp;id=" & intId(i) & """>清</a>"
	Response.Write "<br/>"
	Next
Response.Write "<br/><input name=""nickname"" type=""text"" maxlength=""10"" size=""10"" emptyok=""false"" value="" "" />"
	Response.Write "<anchor title=""change"">修改昵称"
	Response.Write "<go href=""" & FilePath & "&amp;act=change&amp;SessionID=" & SessionID & """ method=""post"">"
	Response.Write "<postfield name=""nickname"" value=""$nickname"" />"
	Response.Write "</go></anchor><br/>"
End Sub
	
'自定义聊天室列表
Sub CustomRoomList()	

	SiteName = "开设房间"
	If strType= "yes" Then		'新建房间
		Dim strCustomRoom, strCustomPass, bCheckCustom
		bCheckCustom = True
		strCustomRoom = Trim(Left(Html2Code(Replace(Replace(Request.Form("roomname"), "$,$", ""), "#,#", "")), 10))
		strCustomPass = Trim(Left(Html2Code(Replace(Replace(Request.Form("roompass"), "$,$", ""), "#,#", "")), 10))
		If strCustomRoom <> Empty Then
			'检测自建房间名
			'....
			If bCheckCustom = True Then
				Randomize
				Dim intRndId
				intRndId = "188" & Int(rnd*50)
				Application.Lock()
				Application(PTW_CookieName & "_CustomList") = strCustomRoom & "#,#" & strCustomPass & "#,#" &  intRndId & "#,#" & Time & "$,$" & Application(PTW_CookieName & "_CustomList")
				Application.UnLock()
				If strCustomPass <> Empty Then	Session(PTW_CookieName & "_Login") = strCustomPass
				Response.Redirect FilePath & "&SessionID=" & SessionID & "&roomid=" & intRndId
			End If
		End If
	End If

	Call ShowList(FiltrateContent(Application(PTW_CookieName & "_CustomList")), 0, "Custom")		'列出自定义聊天室

	Response.Write "-------------<br/>开房成功后邀请对方<br/>房名<input name=""roomname"" type=""text"" maxlength=""10"" size=""20"" emptyok=""false"" value="""" />"
	Response.Write "<br/>密码<input name=""roompass"" type=""text"" maxlength=""10"" size=""10""  value="""" />(必填)"
	Response.Write "<br/><anchor title=""change"">确定开设"
	Response.Write "<go href=""" & FilePath & "&amp;SessionID="&SessionID&"&amp;act=custom&amp;type=yes"" method=""post"">"
	Response.Write "<postfield name=""roomname"" value=""$roomname"" />"
	Response.Write "<postfield name=""roompass"" value=""$roompass"" />"
	Response.Write "</go></anchor><br/>-------------<br/>"
End Sub

'聊天房间记录
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
		Response.Write "输入密码<br/><input name=""pass"" type=""text"" maxlength=""30"" size=""10"" emptyok=""false"" value="" "" />"
		Response.Write "<anchor title=""Write"">确认"
		Response.Write "<go href=""" & FilePath & "&amp;type=check&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId &""" method=""post"">"
		Response.Write "<postfield name=""pass"" value=""$pass"" />"
		Response.Write "</go></anchor><br/>"
		Exit Sub
	End If

	If strType = "write" Then		'发言
		Dim strChatContent, strSend
		strChatContent = Left(Html2Code(Replace(Replace(Request.Form("content"), "$,$", ""), "#,#", "")), 60)
		If strChatContent <> Empty And DateDiff("s", Session(PTW_CookieName & "_ChatPost"), Now) > PTW_PostTime Then
			strSend = strNickName & "#,#" & strChatContent & "#,#" & "(" & Hour(Time) & ":" & Minute(Time) & ")$,$"		'串
			Call SplitChatHistory(Application(PTW_CookieName & "_RoomId" & intRoomId), intRoomId)		'分离聊天记录
			Application.Lock()		'写入缓存
			Application(PTW_CookieName & "_RoomId" & intRoomId) = strSend & Application(PTW_CookieName & "_RoomId" & intRoomId)
			Application.UnLock()
			Session(PTW_CookieName & "_ChatPost") = Now
			Response.Write "发言成功<br/>"
		Else
			Response.Write "发言速度过快<br/>"
		End If
	End If
	
	Response.Write Time & "<br/>"
	If Session(PTW_CookieName & "_ChatReLoad") = Empty Then
		Response.Write "<input name=""content"" type=""text"" maxlength=""60"" size=""10"" emptyok=""false"" value="" "" />"
		Response.Write "<anchor title=""write"">发言"
		Response.Write "<go href=""" & FilePath & "&amp;type=write&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId &""" method=""post"">"
		Response.Write "<postfield name=""content"" value=""$content"" />"
		Response.Write "</go></anchor>"
	Else
		Response.Write "<a href=""" & FilePath & "&amp;act=chat&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>发言</a>"
	End If
	Response.Write "&nbsp;<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>刷新</a>&nbsp;<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & "&amp;act=online"">在线</a><br/>"
	
	Call CheckRoomOnline(Application(PTW_CookieName & "_OnlineId" & intRoomId), intRoomId, 1)	'检测聊天室在线人数
	If Application(PTW_CookieName & "_RoomId" & intRoomId) <> Empty Then
		Call ShowList(FiltrateContent(Application(PTW_CookieName & "_RoomId" & intRoomId)), intRoomId, "History")		'列出聊天记录
	End If

	If Session(PTW_CookieName & "_ChatReLoad") = Empty Then
		Response.Write "<a href=""" & FilePath & "&amp;type=set&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>自动刷新</a><br/>"
	Else
		Response.Write "<a href=""" & FilePath & "&amp;type=set&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>关闭刷新</a><br/>"
	End If
Response.Write "<a href='/bbs/reg/dongf/index1.asp?SessionID=" & SessionID & "'>邀请我的爱人</a><br/>"
End Sub

'房间在线人数
Sub OnlineList()
	Call ShowList(FiltrateContent(Application(PTW_CookieName & "_OnlineId" & intRoomId)), intRoomId, "Online")		'列出在线人数
	Response.Write "<a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>" & SiteName & "</a><br/>"
End Sub

'发言的表单
Sub ChatForm()
	Response.Write Time & "<br/>"
	Response.Write "<input name=""content"" type=""text"" maxlength=""60"" size=""10"" emptyok=""false"" value="" "" />"
	Response.Write "<anchor title=""write"">发言"
	Response.Write "<go href=""" & FilePath & "&amp;type=write&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId &""" method=""post"">"
	Response.Write "<postfield name=""content"" value=""$content"" />"
	Response.Write "</go></anchor><br/><a href=""" & FilePath & "&amp;SessionID=" & SessionID & "&amp;roomid=" & intRoomId & """>返回我的洞房</a><br/>"
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

	If bRoomId = True Or strAct = "custom" Then Response.Write "<a href=""" & FilePath & "&amp;act=custom&amp;SessionID=" & SessionID & """>返回社区宾馆</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
	
End Sub
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
	<head>
		<meta http-equiv="Cache-Control" content="max-age=0"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
	</head>
	<card id="index" title="<%=SiteName%>">
		<%If Session(PTW_CookieName & "_ChatReLoad") <> Empty And strAct = Empty And bRoomId = True Then%>
			<onevent type="ontimer"><go href="<%=FilePath%>&amp;roomid=<%=intRoomId%>&amp;SessionID=<%=SessionID%>"/></onevent><timer value="200"/>
		<%End If%>
		<p>
			<%Main%>
		</p>
	</card>
</wml>