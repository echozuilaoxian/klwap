﻿<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card title="36选一">
<p>
<%
getcent="金币"
iduse=Session("useid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if
 set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usejf from [usereg] where [id]=" &iduse& " "
 rs1.open ssql1,conn
myjb=rs1("usejf")
 rs1.close
set  rs1=nothing
%>
<%
dim num,num1,jb,dx
num=Request("num")
num1=Request("num1")
if num="" or num=<0 or IsNumeric(num)=False then
  Call Error("押金无效！")
  end if
num=clng(num)
if num>9999 then 
  Call Error("押金最高9999,大赌伤身呀！")
  end if
if myjb<num then

  Call Error("呵呵！你的"&getcent&"不够啊！")
  end if

if num1<1 or num1>36 then 
  Call Error("数字无效！必须1-36中的数字")
  end if
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
dx=RndNumber(1,36)
jb=clng(num*30)
if clng(dx)=clng(num1) then 
response.write "<img src='bao.gif' alt='中奖啦'/><br/>"

        conn.Execute("update usereg set usejf=usejf+"&jb&" where id="&iduse)
dim talk
talk="" & Session("ltname") & "在(url=/bbs/game/36.Asp)36选1(/url)中到了" & jb & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "恭喜您，中奖啦<br/>"
response.write "开奖结果:"&dx&"<br/>本次奖金:"&jb&"<br/>"
response.write "你的投注数字为:"&num1&"<br/>"
else
response.write "开奖结果:"&dx&"<br/>本次奖金:"&jb&"<br/>"
response.write "你的投注数字为:"&num1&"<br/>"
response.write "很遗憾，你没有没有中奖！<br/>扣除血本:"&num&getcent&"<br/>"
       conn.Execute("update usereg set usejf=usejf-"&num&" where id="&iduse)
end if
response.write "--------<br/>"
Response.write "<a href=""36.asp?SessionID="&SessionID&""">继续游戏</a>"
Response.write "<br/><a href=""../index.asp?SessionID="&SessionID&""">社区首页</a>"
Response.write "<br/><a href=""/index.asp?SessionID="&SessionID&""">网站首页</a><br/>"
%>
</p></card></wml>