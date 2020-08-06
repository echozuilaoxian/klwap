<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="赛马游戏"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

Server.ScriptTimeout=999
iduse=Session("useid")
dim num,msg
num=request("num")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
if num<>"" then
   num=Clng(num)
   if num>Clng(objgbrs("usejf")) or Clng(objgbrs("usejf")) < 5 then
      msg="你的金币还不够赛马!"
      response.write msg & "<br/><a href='/bbs/game/saima.asp?SessionID=" & SessionID & "'>重新赛过</a><br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num<5 then
      msg="最低投注额为10金币!"
      response.write msg & "<br/><a href='/bbs/game/saima.asp?SessionID=" & SessionID & "'>重新赛过</a><br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num>100000000000000000 then
      msg="最高投注额为10000金币!"
      response.write msg & "<br/><a href='/bbs/game/saima.asp?SessionID=" & SessionID & "'>重新赛过</a><br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
  else
    msg="赛马可不是件容易的事哦!"
      response.write msg & "<br/><a href='/bbs/game/saima.asp?SessionID=" & SessionID & "'>重新赛过</a><br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
  if Clng(request("select"))>4 or Clng(request("select"))<1 then
      conn.Execute(sql)
      msg=" 数据非法,扣除100000金币"
      response.write msg & "<br/><a href='/bbs/game/saima.asp?SessionID=" & SessionID & "'>重新赛过</a><br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
Randomize
ds=Clng(request("select"))
d1=fix(rnd*4)+1
d2=fix(rnd*10)+1
d3=fix(rnd*10)+1
function redx()
d1=fix(rnd*4)+1
if d1>4 then redx
end function




if d2=1 and d3=1 or d2=6 and d3=6  then 
    response.write"赛马神童：送你10金币<br/>"
    sql="update usereg set usejf=usejf+10 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"赛马神童：送你2倍押金，开心吧？<br/>"
    sql="update usereg set usejf=usejf+ " & num & "*2 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"赛马神童：谁说十赛九输，我管你输还是赢，送你88金币。<br/>"
    sql="update usereg set usejf=usejf+88 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"赛马神童：恭喜恭喜，天上掉下了68金币，还不说声谢谢！<br/>"
    sql="update usereg set usejf=usejf+68 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"赛马神童：你押多少，我就送你多少好了。<br/>"
    sql="update usereg set usejf=usejf+" & num & " where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "你押的是:<br/>" & ds & "号马<br/>跑的结果:<br/><img src='/bbs/logo/sm/" & d1 & ".gif' alt='" & d1 & "'/><br/>" & d1 & "号马胜出"
    response.write "<br/>恭喜恭喜！你赢了：" & num*2 & "金币" 
     sql="update usereg set usejf=usejf+" & num*2 & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write "你押的是:<br/>" & ds & "号马<br/>跑的结果:<br/><img src='/bbs/logo/sm/" & d1 & ".gif' alt='" & d1 & "'/><br/>" & d1 & "号马胜出"
      response.write "<br/>你输了：" & num & "金币"
     sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><a href='/bbs/game/saima.asp?SessionID=<%=SessionID%>'>再赛一次</a><br/>------------<br/><a href='/bbs/scyl.asp?SessionID=<%=SessionID%>'>返回社区娱乐</a><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>

