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

  Call Error("你好！亲爱的寻宝者，你的"&getcent&"不够寻宝的费用噢！")
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
response.write "<img src='bao.gif' alt='找到宝箱'/><br/>"

       conn.Execute("update usereg set usejf=usejf+"&jb&" where id="&iduse)
dim talk
talk="" & Session("ltname") & "在(url=/bbs/xun/xunbao.Asp)深山寻宝(/url)找到了一个(img)/bbs/xun/bao.gif(/img),价值" & jb & "金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','524','game')"
  Application.Lock
  conn.execute sql
  Application.Unlock

response.write "恭喜您，找到宝箱啦！<br/>"
response.write "找到宝箱:宝箱放在"&dx&"号金字塔<br/>你打开了宝箱，里面有钻石和聚宝盆，你拿到了当铺当了:"&jb&"<br/>"
response.write "您进入了:"&num1&"号金字塔<br/>"
else
response.write "小道消息:宝箱放在"&dx&"号金字塔<br/>"
response.write "您打开了"&num1&"号宝箱<br/>"
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