<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="提交报告"><p>
<%
Server.ScriptTimeout=999
ltlyuan=untouwide(request("ltlyuan"))
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ltlyuan="&ltlyuan&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
reids=Session("useid")
 ids="1"

if Session("ltftzls")=ltlyuan  then
     response.write "不能在短时间内提交大部分相同内容的报告！"
     response.write "<br/><a href='/bbs/yxxe/tjbg.asp?SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
     response.end
    End if

  if ltlyuan="" then
     response.write "字段不能为空白！！"
     response.write "<br/><a href='/bbs/yxxe/tjbg.asp?SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
     response.end
  End if
        Session("ltftzls")=ltlyuan
		Session.Timeout=10
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
  response.write"提交报告成功!!谢谢你的建议意见.. 客服会在24小时内给予你答复<br/>"
  response.write "--------------<br/><a href='/bbs/yxxe/index.asp?SessionID=" & SessionID & "'>返回江湖首页</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
Function untouwide(str)
	str=replace(str,"<","＜")
	str=replace(str,">","＞")
	str=replace(str,"$","＄")
	str=replace(str,"'","＊")
        str=replace(str,"六合","６合")
        str=replace(str,"做爱","**")
untouWide=str
end function
%>

