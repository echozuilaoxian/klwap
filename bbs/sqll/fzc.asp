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
<card id="card1" title="服装"><p>
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
    response.write"<br/>抓贼呀，有小偷~不远处传来了一女孩的呼叫声，正在巡逻的你听到叫声会怎么做那？<br/>闲事还是少管的好，假装没看见！<br/>本人生平最狠小偷，贼人那跑~<a href='/bbs/sqll/zz.asp?SessionID="& SessionID &"'>帮忙抓贼</a>"
    sql="update usereg set usejf=usejf+8 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"<br/>门口人太多不小心被小偷光顾了，丢了90块钱。"
    sql="update usereg set usejf=usejf-90 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"<br/>遇天使娃娃指点，魅力大增2。"
    sql="update usereg set usejf=usejf+1,ml=ml+2 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"<br/>哈哈哈哈，遇见站长看破红尘指点，赚了5外块。"
    sql="update usereg set usejf=usejf+5 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"<br/>真倒霉！碰见酒仙，没办法请他喝酒用去630块。"
    sql="update usereg set usejf=usejf-630 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "<br/>"
    response.write "<br/>服装城人真多，生意火啊！一小偷混水摸鱼想偷钱，被你抓住了.<br/>收到保护费5<br/>魅力增加了1点<br/>体力下降8点<br/>经验增长1" 
     sql="update usereg set usejf=usejf+5,ml=ml+1,tili=tili-8,regtimes=regtimes-0,entcont=entcont+1 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write ""
      response.write "<br/>服装人太多了！到处走走吧！"
     sql="update usereg set usejf=usejf-0,ml=ml-0,tili=tili-0,regtimes=regtimes-0,entcont=entcont+0 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><anchor>继续巡逻<go method="post" href='hcz.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>--------<br/>
<a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>巡逻首页</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>

