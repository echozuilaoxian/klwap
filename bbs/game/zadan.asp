<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card title="幸运砸金蛋">
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



Response.write "您有"&myjb&getcent&"！<br/>里面有<img src='fentu.gif' alt='粪土'/>跟<img src='egg.gif' alt='金蛋'/>！砸到金蛋便能得到奖励！<u>赔律1：8！</u>平民区需1000"&getcent&"<br/>"
Response.write "平民区."
Response.write "<a href='zadan2.asp?SessionID="&SessionID&"'>居民区</a>."
Response.write "<a href='zadan3.asp?SessionID="&SessionID&"'>贵族区</a><br/>-------------<br/>"
Response.write "<anchor>一号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""1""/>"
Response.write "</go></anchor>|"
Response.write "<anchor>二号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""2""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>三号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""3""/>"
Response.write "</go></anchor>|"
Response.write "<anchor>四号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""4""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>五号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""5""/>"
Response.write "</go></anchor>|"
Response.write "<anchor>六号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""6""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>七号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""7""/>"
Response.write "</go></anchor>|"
Response.write "<anchor>八号<img src='egg.gif' alt='金蛋'/><go method=""post"" href='zadancl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""1000""/>"
Response.write "<postfield name=""num1"" value=""8""/>"
Response.write "</go></anchor>"
response.write "<br/>--------<br/>&gt;&gt;游戏规则：付一定的费用进行游戏，您就可以拿起锤子狠狠的砸八个蛋中的任意一个蛋了，蛋里面随机出现粪土跟金蛋，砸到粪土血本无归，砸到金蛋返回8倍奖金！<br/>-------------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#include file="fanhu.asp"-->
</p></card></wml>
