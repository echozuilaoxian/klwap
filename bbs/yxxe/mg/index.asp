<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="191"
lasttlls="191"
lasttls


wap=request("wap")
nnpp=request("nnpp")
nnp=request("nnp")
id=request("id")
if id="" then id="1"
gp=request("gp")
pid=request("pid")
if pid="" then pid="1" 
ids=session("useid")
Select Case pid
   Case "1"
      itidtit="螺旋迷宫"
   Case "2"
      itidtit="四方迷宫"
   Case "3"
      itidtit="奇迹迷宫"
   Case "4"
      itidtit="镜海迷宫"
 End Select
%>
<%
dim suijidj(9)
        suijidj(0)="1"
	suijidj(1)="2"
	suijidj(2)="3"
	suijidj(3)="4"
	suijidj(4)="5"
	suijidj(5)="6"
	suijidj(6)="7"
	suijidj(7)="8"
	suijidj(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj=suijidj(I)
dim suijidj1(9)
        suijidj1(0)="1"
	suijidj1(1)="2"
	suijidj1(2)="3"
	suijidj1(3)="4"
	suijidj1(4)="5"
	suijidj1(5)="6"
	suijidj1(6)="7"
	suijidj1(7)="8"
	suijidj1(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj1=suijidj1(I)
dim suijidj2(9)
        suijidj2(0)="1"
	suijidj2(1)="2"
	suijidj2(2)="3"
	suijidj2(3)="4"
	suijidj2(4)="5"
	suijidj2(5)="6"
	suijidj2(6)="7"
	suijidj2(7)="8"
	suijidj2(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj2=suijidj2(I)
dim suijidj3(9)
        suijidj3(0)="1"
	suijidj3(1)="2"
	suijidj3(2)="3"
	suijidj3(3)="4"
	suijidj3(4)="5"
	suijidj3(5)="6"
	suijidj3(6)="7"
	suijidj3(7)="8"
	suijidj3(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj3=suijidj3(I)
dim suijidj4(9)
        suijidj4(0)="1"
	suijidj4(1)="2"
	suijidj4(2)="3"
	suijidj4(3)="4"
	suijidj4(4)="5"
	suijidj4(5)="6"
	suijidj4(6)="7"
	suijidj4(7)="8"
	suijidj4(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj4=suijidj4(I)
dim suijidj5(9)
        suijidj5(0)="1"
	suijidj5(1)="2"
	suijidj5(2)="3"
	suijidj5(3)="4"
	suijidj5(4)="5"
	suijidj5(5)="6"
	suijidj5(6)="7"
	suijidj5(7)="8"
	suijidj5(8)="9"
	Randomize
	I=Int(Rnd()*9)
	sj5=suijidj5(I)


%>
<card title="迷宫寻宝">
<p>
<!--#INCLUDE VIRTUAL="/bbs/pk/conn1.asp"-->
<%if gp=1 or id=1 then%>
迷宫入口<br/>
<!--#INCLUDE VIRTUAL="/bbs/pk/conn.asp"-->
<%set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select rw from wupin where cstr(ids)="&ids
rsppp.open rsstr,conn,1,2
rw=rsppp("rw")
   rsppp.close
set rsppp=Nothing%>
<%if clng(rw)>1 then%>
对不起，您已经完成本次任务了！
请不要刷新！
<%else%>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%end if%>
<%elseif gp=2 or nnpp=2 and nnp=1 then%>
迷宫二层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=3&amp;nnp=2">↓</a>
<%elseif gp=3 or nnpp=3 and nnp=2 then%>
迷宫三层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=4&amp;nnp=3">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=3">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=4&amp;nnp=<%=sj%>">↓</a>
<%elseif gp=4 or nnpp=4 and nnp=3 then%>
迷宫四层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%elseif gp=5 or nnpp=5 and nnp=4 then%>
迷宫五层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%elseif gp=6 or nnpp=6 and nnp=5 then%>
迷宫六层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%elseif gp=7 or nnpp=7 and nnp=6 then%>
迷宫七层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%elseif gp=8 or nnpp=8 and nnp=7 then%>
迷宫八层<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;nnp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;nnp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=2&amp;nnp=1">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;nnp=<%=sj%>">↓</a>
<%elseif nnpp=9 and nnp=9 then%>

<!--#INCLUDE VIRTUAL="/bbs/pk/conn.asp"-->
<%set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select rw from wupin where cstr(ids)="&ids
rsppp.open rsstr,conn,1,2
rw=rsppp("rw")
   rsppp.close
set rsppp=Nothing%>
<%if clng(rw)>1 then%>
对不起，您已经完成本次任务了！
请不要刷新！
<%else%>
<%sql="update wupin set yz=yz+100000 where cstr(ids)="&ids
  conn.Execute(sql)%>
<%sql="update wupin set rw=2 where cstr(ids)="&ids
  conn.Execute(sql)%>
恭喜您走出迷宫！<br/>
奖励100000两银子<br/>
已经存入您的账户了！
<%end if%>
<%else%>
原地打转！<br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj%>&amp;gp=<%=sj%>">↑</a><br/>
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj1%>&amp;gp=<%=sj%>">←</a>&nbsp;
<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj2%>&amp;gp=<%=sj%>">→</a><br/>
&nbsp;&nbsp;<a href="index.asp?wap=<%=xiyd%>&amp;mm=<%=time%>&amp;nnpp=<%=sj3%>&amp;gp=<%=sj%>">↓</a>
<%end if%>
<br/>=========<br/>
<a href="/bbs/pk/index.asp?wap=<%=wap%>">江湖首页</a><br/>
</p>
</card>
</wml>