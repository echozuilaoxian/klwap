<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
dim ltlyuan,ids,reids
reids=request("reids")
id=request("id")
SessionID=request.querystring("SessionID")
 ltlyuan=request("ltlyuan")
 ids=request("ids")
ltlyuan=trim(ltlyuan)
ltlyuan=untowide(ltlyuan)
sql="update urls set fsdj=fsdj+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql) 
  if ltlyuan="" then
     response.write "<card id='card1' title='发送信息'><p align='left'><br/>字段不能为空白！！"
     response.write "<br/><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'></a></p></card></wml>"
     response.end
  End if
if conn.execute("select * from myfriend where ids='"& ids &"' and friid='*" & reids & "'").eof then
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock

end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='发送信息'><p>发送信息<br/>--------------<br/>"
  response.write"<img src='/bbs/logo/fs.gif' alt='.'/>成功将判决发给被告<br/><br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>回收件箱</a>"
 response.write"<br/><a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>私人信箱</a>"

if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "?SessionID=" & SessionID & "'>回刚才页面</a>"
  Else
End if
 
Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>回我的好友</a>"
  response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
  response.write "-<a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a>"%>
<br/>时间:<%=time%>
<%

Response.write "<br/>=社区快道="  
Response.write "<br/><select>"  
Response.write "<option onpick='/bbs/myalbum/index.asp?SessionID=" & SessionID & "'>社区相册</option>"  
Response.write "<option onpick='/bbs/room/from.asp?SessionID=" & SessionID & "'>激情聊天</option>"  
Response.write "<option onpick='/bbs/ztlb.asp?SessionID=" & SessionID & "'>社区论坛</option>"   
Response.write "<option onpick='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</option>"  
Response.write "<option onpick='/bbs/wish/index.asp?SessionID=" & SessionID & "'>许愿树</option>"  
Response.write "<option onpick='/bbs/sqcp/sqcp.asp?SessionID=" & SessionID & "'>社区彩票</option>"
Response.write "<option onpick='/bbs/SCYL.asp?SessionID=" & SessionID & "'>澳门赌场</option>"  
Response.write "</select></p></card></wml>"


function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>