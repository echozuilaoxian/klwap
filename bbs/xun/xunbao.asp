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
response.write "<img src='xunbao.gif' alt='寻找宝藏'/><br/>"
Response.write "寻宝需足够的"&getcent&"，才可去寻宝。您共带了"&myjb&getcent&"！<br/>来寻宝，这里有你意想不到的惊喜，有你意想不到的财富，赶快来寻宝吧<br/>"
Response.write "<a href='xunbao1.asp?SessionID="&SessionID&"'>进入石矿山井寻宝</a>据说这里有很多小宝贝。<br/>"
Response.write "<a href='xunbao2.asp?SessionID="&SessionID&"'>进入宝石山洞寻宝</a>据说这里有很多宝石…<br/>"
Response.write "<a href='xunbao3.asp?SessionID="&SessionID&"'>进入埃圾金字塔寻宝</a>据说这里有无穷的财福<br/>"
Response.write "<br/>不久前，有一群人去寻宝，他们有的满载而归，有的两手空空，什么也没有找到，有的....<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#include file="xun.asp"-->
<%conn.close
set conn=nothing%>
</p></card></wml>