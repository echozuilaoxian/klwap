<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% 
Server.ScriptTimeout=999
wap=request.querystring("wap")
dim frid,objgbrs,ltlyuan
 id=1000000
  ltlyuan=request("ltlyuan")
  ids=request("frid")
 ltlyuan=trim(ltlyuan)
ltlyuan=untowide(ltlyuan)
  if ltlyuan="" then

 response.write "<card id='card1' title='发送留言'><p align='center'><br/>字段不能为空白！！"
     response.write "<br/><a href='/bbs/chatroom/roomy.asp?ids="& ids &"&amp;wap=" & wap & "'>>返回重写</a>"
     response.write "<br/><a href='/bbs/chatroom/chatroomls.asp?wap=" & wap & "'>>相约玩乐城</a></p></card></wml>"
     response.end
  End if
 
   if conn.execute("select * from myfriend where ids='"& reids &"' and friid='*" & ids & "'").eof then
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(1000000) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='贺卡发送成功' ontimer='/bbs/shop/index.asp?wap=" & wap & "'><timer value='1'/><p>"
  response.write"你的贺卡我们已送到对方手中!!<br/><a href='/bbs/shop/index.asp?wap=" & wap & "'>>商店购物</a><br/>"

  response.write "<br/><a href='/bbsfult.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>




