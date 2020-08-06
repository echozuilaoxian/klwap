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
<card title="挖宝结果">
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

if num1<1 or num1>16 then 
  Call Error("数字无效！必须1-16中的数字")
  end if
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
dx=RndNumber(1,16)
jb=clng(num*16)
if clng(dx)=clng(num1) then 
response.write "<img src='bao.gif' alt='中奖啦'/><br/>"

       conn.Execute("update usereg set usejf=usejf+"&jb&" where id="&iduse)
dim talk
talk="" & Session("ltname") & "在(url=/bbs/game/wabao.Asp)挖宝地图(/url)挖到了(img)/bbs/game/bao.gif(/img),价值" & jb & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "恭喜您，挖到宝藏啦！<br/>"
response.write "挖宝结果:宝藏藏在"&dx&"号宝箱<br/>本次奖金:"&jb&"<br/>"
response.write "您打开了:"&num1&"号宝箱<br/>"
else
response.write "挖宝结果:宝藏藏在"&dx&"号宝箱<br/>"
response.write "您打开了"&num1&"号宝箱<br/>"
response.write "很遗憾，你没有没有挖中！<br/>扣除血本:"&num&getcent&"别灰心！下次大奖就是您的了！<br/>"
       conn.Execute("update usereg set usejf=usejf-"&num&" where id="&iduse)
end if
response.write "--------<br/>"
Response.write "<a href=""wabao.asp?SessionID="&SessionID&""">继续挖宝</a><br/>"
%>
<!--#include file="fanhui.asp"-->
<%conn.close
set conn=nothing%>
</p></card></wml>

