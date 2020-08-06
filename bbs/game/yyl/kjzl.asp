<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/conn.asp"-->
<card id="card1" title="摇摇乐-开奖记录"><p>
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
Response.write "开奖记录<br/>"
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds order by id desc"
  objgbrs.open ssql,jjconn,1,1
if objgbrs.eof then
   Response.write "晕晕的...还没开奖呢!<br/>"
else

 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
  response.write "共有"&objgbrs.RecordCount&"条记录<br/>------------<br/>"
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
mgs="<a href='/bbs/reg/useinfo.asp?id="&objgbrs("idd")&"&amp;SessionID="&SessionID&"'>"&converttowidebaiti(objgbrs("usname"))&"</a>"
if objgbrs("idd")=0 then mgs="无人中奖"
    Response.write ""&bihao+bihaocont &".第"&objgbrs("id")&"期.号码:<b><u>"& objgbrs("ids") &"</u></b> 中奖:"&mgs&"<br/>"
objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
if objgbrs.PageCount>1 then
    response.write "------------<br/>"
  End if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/bbs/game/yyl/kjzl.asp?page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If page>1 then
    Response.Write "<a href='/bbs/game/yyl/kjzl.asp?page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
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