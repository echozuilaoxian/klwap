<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card title="挖宝地图">
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



response.write "<img src='wabao.gif' alt='挖宝地图'/><br/>"
Response.write "您有"&myjb&getcent&"！<br/>宝藏藏在16个宝箱中，赔律1：16！贵族区需100000"&getcent&"<br/>"
Response.write "<a href='wabao.asp?SessionID="&SessionID&"'>平民区</a>|"
Response.write "<a href='wabao1.asp?SessionID="&SessionID&"'>居民区</a>|贵族区<br/>-------------<br/>"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""1""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""2""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""3""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""4""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""5""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""6""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""7""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""8""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""9""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""10""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""11""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""12""/>"
Response.write "</go></anchor><br/>"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""13""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""14""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""15""/>"
Response.write "</go></anchor>|"
Response.write "<anchor><img src='bao.gif' alt=''/>宝箱<go method=""post"" href='wabaocl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""100000""/>"
Response.write "<postfield name=""num1"" value=""16""/>"
Response.write "</go></anchor>"
response.write "<br/>--------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#include file="fanhui.asp"-->
<%conn.close
set conn=nothing%>
</p></card></wml>