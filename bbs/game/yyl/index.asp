<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/bqzj.asp"-->



<%
Response.write "<img src='yyl.gif' alt=''/><br/>"
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
lasttlls="321"
lasttls

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if
dim idss,zjhm
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds where hm='nno'"
  objgbr.open ssql,jjconn,1,1

if objgbr.eof then
   'Response.write "晕晕的...还没开奖呢!<br/>"
else

ids=objgbr("ids")
ks=1000-objgbr("ks")
id=objgbr("id")
set objgbra=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds where id="&id-1&""
  objgbra.open ssql,jjconn,1,1
mgs="<a href='/bbs/reg/useinfo.asp?id="&objgbra("idd")&"&amp;SessionID="&SessionID&"'>"&converttowidebaiti(objgbra("usname"))&"</a>"
if objgbra("idd")=0 then mgs="无人中奖"
response.write "上期中奖：<b>"&mgs&"</b><br/>"
objgbra.close
Set objgbra= Nothing
response.write "本期是第<b>"&id&"</b>期<br/>"
response.write "开奖号码:<b>"&ids&"</b><br/>"
response.write "奖池累积奖金:<b>"&objgbr("lzjb")&"</b><br/>"
response.write "你还有:<b>"&ks&"</b>次下注的机会<br/>"
objgbr.close
Set objgbr= Nothing
end if
response.write "-------------<br/>"
response.write "<a href='txhmcl.asp?SessionID=" & SessionID & "'>我来摇摇</a><br/>"
response.write "<a href='wdhm.asp?SessionID=" & SessionID & "'>我的号码</a><br/>"
response.write "<a href='kjzl.asp?SessionID=" & SessionID & "'>开奖记录</a><br/>"
response.write "<a href='top100.asp?SessionID=" & SessionID & "'>下注排名</a><br/>"
response.write "<a href='top100.asp?ky=2&amp;SessionID=" & SessionID & "'>中奖排名</a><br/>"
response.write "<a href='hel.Asp?SessionID=" & SessionID & "'>摇摇乐说明</a><br/>"
   %>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/game.inc"-->
<%jjconn.close
  set jjconn=nothing
conn.close
  set conn=nothing%>

</p> 
</card>
</wml>



