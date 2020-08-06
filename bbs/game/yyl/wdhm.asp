<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/conn.asp"-->
<card id="card1" title="我的号码"><p>
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
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if
Response.write "我的号码<br/>"
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds where hm='nno'"
  objgbr.open ssql,jjconn,1,1
if objgbr.eof then
   'Response.write "晕晕的...还没开奖呢!<br/>"
else
id=objgbr("id")
sql="Delete FROM dx WHERE ks< "&id-1&""
jjconn.Execute sql
objgbr.close
Set objgbr= Nothing
end if
 set objgbrs=Server.CreateObject("ADODB.Recordset")
  jjconn.CommandTimeOut = 999
     ssql="select * from dx where ids='" & iduse & "'  order by times desc"
  objgbrs.open ssql,jjconn,1,1
 objgbrs.PageSize=jdshow
  page=CLng(Request("page"))
 if page<1 then
    page=1
  End if
 if page>objgbrs.pagecount then
    page=objgbrs.pagecount
  End if
  response.write "系统只保留最后几期数据<br/>你下了<b><u>"&objgbrs.RecordCount&"</u></b>注<br/>------------<br/>"

if objgbrs.eof then
   Response.write "哟!真健忘,我本期还没买呢!<br/>"
Else
 objgbrs.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrs.PageSize
    id=objgbrs("id")
    bihaocont=bihaocont+1
    Response.write "第<b><u>"&bihao+bihaocont &"</u></b>张."&"号码:<b><u>"& objgbrs("hm") &"</u></b> 期数:<u>"&objgbrs("ks")&"</u><br/>"
objgbrs.Movenext
  if objgbrs.EOF then Exit for
    Next
  End if
if objgbrs.PageCount>1 then
    response.write "------------<br/>"
  End if
If Page<objgbrs.PageCount then
    Response.Write "<a href='/bbs/game/yyl/wdhm.asp?page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If page>1 then
    Response.Write "<a href='/bbs/game/yyl/wdhm.asp?page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if

    response.write "<br/>"


Response.write "------------<br/><a href='/bbs/game/yyl/index.asp?sessionID=" & SessionID & "'>返回摇摇乐</a><br/><a href='/bbs/index.asp?sessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
jjconn.close
set jjconn=nothing
conn.close
set conn=nothing

%>