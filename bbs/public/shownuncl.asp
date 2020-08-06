<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
sort=request("sort")
id=request("id")
spage=request("spage")
page=request("page")
sspage=request("sspage")

	dim idss,shownun
	idss=Session("useid")
	PerPageArticleCount=request("PerPageArticleCount")
	PerPageWordCount=request("PerPageWordCount")
	PerPagePhotoCount=request("PerPagePhotoCount")
    sql="update usereg set jdshow=" & sqlstr(PerPageArticleCount) &",cwxq=" & sqlstr(PerPageWordCount) &",cwqg=" & sqlstr(PerPagePhotoCount) &" where CStr(id)='" & idss & "'"
    conn.execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & idss & "'"
  objgbrs.open sql,conn
	set objgbrs=conn.execute(sql)
		Session("showjd")=objgbrs("jdshow")
		Session("showwz")=objgbrs("cwxq")
		Session("showtu")=objgbrs("cwqg")
        Session.Timeout=120
conn.close
set objgbrs=nothing
set conn=nothing
Response.write "<card id='card1' title='自定义显示' ontimer='"& sspage &"?SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'><timer value='10'/>"
Response.write "<p>操作成功,正在返回..."
Response.write "<br/><a href='"& sspage &"?SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>返回来源面页</a>"
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



