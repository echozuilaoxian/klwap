<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="百利达商场"><p>
<img src='fzc.gif' alt='load...'/>
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
      msg="10000块钱都没有还想巡逻？倒！回家吧"
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
   if objgbrs("tili")<60 then
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
    response.write"<br/>呵呵~商场的生意就是好啊，人山人海的！呦~这是谁的钱包呀？管他那，谁捡到就是谁的了！失主就认活该倒霉吧！嘿嘿嘿~捡到3快钱。"
    sql="update usereg set usejf=usejf+3 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"<br/>今天商场大减价，疯狂让利大出血耶，这等好事怎能错过啊，快步冲到最前线，一定要抢占先机才行啊~全然忘记了今天的任务！被扣除当天工资99快钱。"
    sql="update usereg set usejf=usejf-99 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"<br/>哇哇哇~好漂亮的两位美女耶！ 喂！  口水流都成了河啦，还看！在看给钱！色狼~   啊？看看你怎么啦？见不得人呀？真是的，白来了一顿口舌之争，什么玩意吗~扫兴！呸~呸呸。"
    sql="update usereg set usejf=usejf+1,tili=tili+0 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"<br/>今天的心情可真糟糕！看见什么都没个心情，看见谁还都不顺眼。唉~"
    sql="update usereg set usejf=usejf-300 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"又是一天了，时间过的可真快呀，想我一世的英名却只混了个巡逻的工作，到现在还一事无成，年少时的梦啊~早已随风不知飞向了何方。~~   喂~ 楼上的~想开点~千万可别往下跳呀~    谁？谁要跳楼啊？楼下的~你在喊谁呀？   就是你呀楼上的，你有什么想不开的呀？非要寻短见？    我？~我说楼下的，你有毛病吧，我只是上来吹风的，神经病！心情指数减少25点。<br/>"
    sql="update usereg set usejf=usejf-0,ml=ml-25 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "<br/>"
    response.write "<br/>听说这家商场顶楼的美食很是出名啊，何不让自己也偶尔的奢侈一下，就算是犒劳犒劳自己吧。来到美食城大吃了一顿。<br/>花掉钱钱693快<br/>体力增加2点<br/>经验增长1" 
     sql="update usereg set usejf=usejf-693,ml=ml+0,tili=tili+2,regtimes=regtimes-0,entcont=entcont+1 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write ""
      response.write "<br/>今日商场的生意好冷清啊，柜台小姐们都去聊天了，呵呵~看来我也可已找个地方去补补觉咯。打了一夜的麻将可真累啊。<br/>经验增长1"
     sql="update usereg set usejf=usejf-0,ml=ml-0,tili=tili-20,regtimes=regtimes-0,entcont=entcont+1 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><anchor>继续巡逻<go method="post" href='yc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>--------<br/>
<a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>巡逻首页</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>

