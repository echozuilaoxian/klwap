﻿<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="攻击"><p>
<% 
SessionID=request.querystring("SessionID")
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
   if num>Clng(objgbrs("usejf")) or Clng(objgbrs("usejf")) < 10000 then
      msg="10000钱都没有还想玩巡逻？倒！回家吧"
	  response.write msg & "<br/><a href='index.asp?SessionID=" & SessionID & "'>返回</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if num<5 then
      msg="出错了"
      response.write msg & "<br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
   if objgbrs("tili")<0 then
      msg="这样的体力也来玩？想死啊！"
      response.write msg & "<br/>--------<br/><a href='/bbs/chan/index.asp?SessionID=" & SessionID & "'>补充体力</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
   end if
  else
    msg="巡逻可不是件容易的事哦!"
      response.write msg & "<br/><a href='index.asp?SessionID=" & SessionID & "'>再来一次</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
  if Clng(request("select"))>6 or Clng(request("select"))<1 then
      conn.Execute(sql)
      msg=" 数据非法,扣除100000金币"
      response.write msg & "<br/><a href='index.asp?SessionID=" & SessionID & "'>再来一次</a><br/>--------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
	response.end
  end if
Randomize
ds=Clng(request("select"))
d1=fix(rnd*6)+1
d2=fix(rnd*10)+1
d3=fix(rnd*10)+1
function redx()
d1=fix(rnd*6)+1
if d1>6 then redx
end function




if d2=1 and d3=1 or d2=6 and d3=6  then 
    response.write"<br/>"
    sql="update usereg set usejf=usejf+8 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"<br/>"
    sql="update usereg set usejf=usejf+ " & num & "*2 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"<br/>"
    sql="update usereg set usejf=usejf+1,tili=tili+0 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"<br/>"
    sql="update usereg set usejf=usejf-356 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"<br/>"
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "<img src='/bbs/tu/meis.gif' alt='load...'/><br/>你一拳打过去，小偷不慌不忙的化解了。这点本事也来出丑？<br/>体力减少10"
    response.write "<br/>" 
     sql="update usereg set usejf=usejf+0,ml=ml+0,tili=tili-10,regtimes=regtimes-0,entcont=entcont+0 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write "<br/><img src='/bbs/tu/bdd.gif' alt='load...'/>"
      response.write "<br/>你狠狠的一记左勾拳打在小偷右脸上，小偷当场倒地，被你制服。社区保卫科为了表扬你.奖励你3块钱<br/>魅力增加了1<br/>经验增长1"
     sql="update usereg set usejf=usejf+3,ml=ml+1,tili=tili-5,regtimes=regtimes-0,entcont=entcont+1 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><anchor>继续巡逻<go method="post" href='fzc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>--------<br/>
<a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>巡逻首页</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>

