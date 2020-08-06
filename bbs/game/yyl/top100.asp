<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/conn.asp"-->

<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
 dim ky,desc
  ky=request.querystring("ky")
if ky="" or ky>2 then ky=1
select case ky
  case 1
  wheretmp="order by xz desc"
title="下注100强"
 case 2
 wheretmp="order by zongj desc"
title="中奖100强"
end select
Response.write "<card id='card1' title='摇摇乐-"&title&"'><p>"
Response.write ""&title&"<br/>"
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select top 100 * from fuuse "&wheretmp&""
  objgbrs.open ssql,jjconn,1,1
if objgbrs.eof then
   Response.write "晕晕的...还没人下注呢!"
else

 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
tjhm=objgbrs("ids")
    Response.write ""&bihao+bihaocont &".<a href='/bbs/reg/useinfo.asp?id="&objgbrs("ids")&"&amp;SessionID="&SessionID&"'>"&converttowidebaiti(redtjname)&"</a>下注:<b><u>"&objgbrs("xz")&"</u></b>次 中奖"&objgbrs("zongj")&"次<br/>"
objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
 
if objgbrs.PageCount>1 then
    response.write "------------<br/>"
  End if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/bbs/game/yyl/kjzl.asp?page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If page>1 then
    Response.Write "<a href='/bbs/game/yyl/kjzl.asp?page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
 End if

%>


<!--#INCLUDE VIRTUAL="/bbs/game/game.inc"-->

</p></card></wml>
<%objgbrs.close
Set objgbrs= Nothing
jjconn.close
set jjconn=nothing
conn.close
set conn=nothing

%>