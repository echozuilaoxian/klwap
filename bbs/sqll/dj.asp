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
<card id="card1" title="长安太平街"><p>
<img src='jfsc.gif' alt='load...'/><br/>
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
      msg="10000块钱都没有还想巡逻？倒！快回家吧"
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
    response.write"<br/>哈哈哈哈~捡到8块钱，也不知是那个傻冒掉的，今天真是走运那！"
    sql="update usereg set usejf=usejf+8 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 

if d2=2 and d3=2 or d2=7 and d3=7  then 
    response.write"<br/>今天是什么节日啊？怎么每个女孩手里都拿着花啊？哦~对了！今天好像是情人节！唉~真悲惨人家过节我巡逻！还是假装没看见吧！闪人~"
    sql="update usereg set usejf=usejf+0 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=3 and d3=3 or d2=8 and d3=8  then 
    response.write"<br/>糟糕怎么走进死胡同里了，正预往回走时，突然一道白光闪过，天降仙女向你招手，走进一看，居然是传说中的小龙女前来指点武功！体力增加3点"
    sql="update usereg set usejf=usejf+1,tili=tili+3 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=4 and d3=4 or d2=9 and d3=9  then 
    response.write"<br/>抓贼呀，有小偷~不远处传来了一女孩的呼叫声，正在巡逻的你听到叫声会怎么做那？闲事还是少管的好，假装没看见！本人生平最狠小偷，贼人那跑~<a href='/bbs/sqll/zz.asp?SessionID="& SessionID &"'>帮忙抓贼</a>"
    sql="update usereg set usejf=usejf-0 where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 
if d2=5 and d3=5 or d2=10 and d3=10  then 
    response.write"<br/>街边遇见乞丐~唉~看着真可怜，给他五快钱买点吃的吧！谁让咱是大善人那，也算积得吧！"
    sql="update usereg set usejf=usejf-" & num & " where Cstr(id)='"& iduse &"'"
   conn.Execute(sql)
   end if 



if ds=d1 then
    
     response.write "<br/>"
    response.write "<br/>哎哟！谁~是谁呀~香蕉皮怎么乱丢啊~摔的我好惨！唉~现在的人可真是没有功徳啊，这么漂亮的大街垃圾乱丢了一大堆，还是做做好事帮忙扔进垃圾箱吧！爱心增加2点" 
     sql="update usereg set usejf=usejf+0,ml=ml+2,tili=tili-0,regtimes=regtimes-0 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   else
    response.write ""
      response.write "<br/>太平街上的太平天！哈哈哈哈~今天总的来说天气不错，心情不错，自己也不错，相安无事看来今天可以早点收工咯<br/>收入6<br/>魅力增加1<br/>体力减少10<br/>经验增加1"
     sql="update usereg set usejf=usejf+6,ml=ml+1,regtimes=regtimes-0,tili=tili-10,entcont=entcont+3 where Cstr(id)='"& iduse &"'"
    conn.Execute(sql)
   end if
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/><anchor>继续巡逻<go method="post" href='fzc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>----------<br/>
<a href='/bbs/sqll/index.asp?SessionID=<%=SessionID%>'>巡逻首页</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>

