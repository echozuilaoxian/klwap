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
<card id="card1" title="火车站"><p>
<img src='hcz.gif' alt='load...'/>
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
    response.write"<br/>哈哈哈哈！捡到8块钱，也不知是那个傻冒掉的。"
    sql="update usereg set usejf=usejf+8 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"<br/>呵呵！脚下有十块钱，快收起来。"
    sql="update usereg set usejf=usejf+ " & num & "*2 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"<br/>遇小龙女指点武功，内力大增2"
    sql="update usereg set usejf=usejf+1,tili=tili+2 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"<br/>倒霉！不小心在门口掉了356块钱"
    sql="update usereg set usejf=usejf-356 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"<br/>遇见要钱的看着真可怜，给五钱吧！"
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "<br/>"
    response.write "<br/>火车站人太多，不过运气还不错，遇见几个吸毒仔收到保护费4块。" 
     sql="update usereg set usejf=usejf+4,ml=ml+0,tili=tili-0,regtimes=regtimes-0,entcont=entcont+0 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write ""
      response.write "<br/>小子耍长咯吧？来火车站收保护费，遇见几个小混混打架你被打伤住院.<br/>花了医药费826<br/>块魅力减少了30<br/>体力减少了50<br/>经验增长2"
     sql="update usereg set usejf=usejf-826,ml=ml-30,tili=tili-50,regtimes=regtimes-0,entcont=entcont+2 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><anchor>继续巡逻<go method="post" href='jb.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>--------<br/>
<a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>巡逻首页</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>

