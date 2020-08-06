<!--#include file="config.inc"-->
<!--#include file="hotmo.inc"-->

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
	<head>
		<meta http-equiv="Cache-Control" content="max-age=0"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
	</head>
	<card id="index" title="<%=SiteName%>">
		<%If Session(PTW_CookieName & "_ChatReLoad") <> Empty And strAct = Empty And bRoomId = True Then%>
			<onevent type="ontimer"><go href="<%=FilePath%>&amp;roomid=<%=intRoomId%>"/></onevent><timer value="200"/>
		<%End If%>
		<p>
			<%Main%>
<br/><a href='/'>返回网站首页</a><br/>
		</p>
	</card>
</wml>