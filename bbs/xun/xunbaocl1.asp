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
<card title="寻宝结果">
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

  Call Error("很遗憾！你的"&getcent&"不够用了！不能在来寻宝了，请到社区赚足了金币再来吧")
  end if

if num1<1 or num1>5 then 
  Call Error("数字无效！必须1-5中的数字")
  end if
Function RndNumber(Min,Max) 
Randomize 
RndNumber=Int((Max - Min + 1) * Rnd() + Min) 
End Function 
dx=RndNumber(1,5)
jb=clng(num*5)
if clng(dx)=clng(num1) then 
response.write "<img src='zuan.gif' alt='钻石'/><br/>"

       conn.Execute("update usereg set usejf=usejf+"&jb&" where id="&iduse)
dim talk
talk="" & Session("ltname") & "在(url=/bbs/xun/xunbao.Asp)深山寻宝(/url)找到了一颗(img)/bbs/xun/zuan.gif(/img)价值" & jb & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock

response.write "终于找到了宝箱！<br/>"
response.write "小道消息:宝箱放在"&dx&"号井里<br/>你打开宝箱，得到了一颗钻石，你拿着钻石到当铺当了:"&jb&"<br/>"
else
response.write "发现宝箱:宝箱放在"&dx&"号井里快去找<br/>"
response.write "您来到了"&num1&"号井里<br/>"
response.write "很可惜，你没有找到宝箱！<br/>害得你花了:"&num&getcent&"买药补充体力！继须寻宝！下次差不多就能找到了噢！<br/>"
       conn.Execute("update usereg set usejf=usejf-"&num&" where id="&iduse)
end if
response.write "--------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#include file="xun.asp"-->
<%conn.close
set conn=nothing%>
</p></card></wml>