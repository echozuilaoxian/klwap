<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card title="36选1">
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
response.write "<img src='36.1.gif' alt='36选1'/><br/>"
Response.write "奖金高达30倍！<br/>"
Response.write "您有"&myjb&getcent&"<br/>"
Response.write "押金:<input name=""num"" format=""*N"" emptyok=""true"" maxlength=""4"" value=""10""/><br/>"
Response.write "数字:<input name=""num1"" format=""*N"" emptyok=""true"" maxlength=""2"" value=""0""/><br/>"
Response.write "<anchor>开始摇奖<go method=""post"" href='36cl.asp?SessionID="&SessionID&"'>"
Response.write "<postfield name=""num"" value=""$(num)""/>"
Response.write "<postfield name=""num1"" value=""$(num1)""/>"
Response.write "</go></anchor><br/>"
response.write "--------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<%
Response.write "<br/><a href=""../index.asp?SessionID="&SessionID&""">社区首页</a>"
Response.write "<br/><a href=""/index.asp?SessionID="&SessionID&""">网站首页</a><br/>"
response.write "</p></card></wml>"
%>