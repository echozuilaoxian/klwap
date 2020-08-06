<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->

<card title="寻找宝藏">
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

sql="Delete FROM sjzk WHERE bu='game' and DATEDIFF('s', timed, now()) > 720*60*3"
 set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usejf from [usereg] where [id]=" &iduse& " "
 rs1.open ssql1,conn
myjb=rs1("usejf")
 rs1.close
set  rs1=nothing

response.write "<img src='xunbao.gif' alt='寻觅宝箱'/><br/>"
Response.write "亲爱的寻宝者您好！你带了"&myjb&getcent&"来到宝石山洞寻宝<br/>，宝贝就放在宝箱，找到即可得到相应的报酬，每次寻宝都需要缴纳10000"&getcent&"<br/>"

Response.write "<anchor>一号山洞<go method=""post"" href='xunbaocl2.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""10000""/>"
Response.write "<postfield name=""num1"" value=""1""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>二号山洞<go method=""post"" href='xunbaocl2.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""10000""/>"
Response.write "<postfield name=""num1"" value=""2""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>三号山洞<go method=""post"" href='xunbaocl2.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""10000""/>"
Response.write "<postfield name=""num1"" value=""3""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>四号山洞<go method=""post"" href='xunbaocl2.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""10000""/>"
Response.write "<postfield name=""num1"" value=""4""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor>五号山洞<go method=""post"" href='xunbaocl2.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""10000""/>"
Response.write "<postfield name=""num1"" value=""5""/>"
Response.write "</go></anchor><br/>"
response.write "<br/>--------<br/>有个古老的传说，居说，在大海深处的一个小岛上，有很多宝贝，于是有一批人组成了一支寻宝队，他们飘过大海来到了小岛，开始了寻宝旅程....<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#include file="xun.asp"-->
<%conn.close
set conn=nothing%>
</p></card></wml>