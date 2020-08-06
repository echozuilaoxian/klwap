<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
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
<card title="砸蛋结果">
<p>
<%
dim num,num1,jb,dx
num=Request("num")
num1=Request("num1")
if num="" or num=<0 or IsNumeric(num)=False then
  Call Error("押金无效！")
  end if
num=clng(num)
if num>999999 then 
  Call Error("押金最高999999,大赌伤身呀！")
  end if
if myjb<num then

  Call Error("呵呵！你的"&getcent&"不够啊！")
  end if

if num1<1 or num1>8 then 
  Call Error("数字无效！必须1-16中的数字")
  end if
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
dx=RndNumber(1,8)
jb=clng(num*8)
if clng(dx)=clng(num1) then 
response.write "<img src='egg.gif' alt='中奖啦'/><br/>"

       conn.Execute("update usereg set usejf=usejf+"&jb&" where id="&iduse)
dim talk
talk="" & Session("ltname") & "在(url=/bbs/game/zadan.Asp)幸运砸金蛋(/url)砸到了(img)/bbs/game/egg.gif(/img),价值" & jb & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "哇噻~眼前一片金光四射！恭喜您砸到金蛋啦！<br/>"
response.write "本次奖金:"&jb&"<br/>"
else
response.write "<img src='fentu.gif' alt='粪土'/>很遗憾，您砸到了一堆粪土！扣除血本:"&num&getcent&"别灰心！下次金蛋就是您的了！<br/>"
       conn.Execute("update usereg set usejf=usejf-"&num&" where id="&iduse)
end if
response.write "--------<br/>"
Response.write "<a href=""zadan.asp?SessionID="&SessionID&""">继续砸蛋</a><br/>"
%>
<!--#include file="fanhu.asp"-->
</p></card></wml>
