<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="夫妻洞房">
<p>
<% Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if%>
<%
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
sql="Delete FROM mydf WHERE  DATEDIFF('s', time, now()) > 1440*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM mydf where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="你们今天已经洞过房了！"
     else
          SQL="insert into mydf(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set myfq=myfq+1 where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg="<a href='/bbs/reg/dongf/loveroom/index.asp?nickname=%E6%88%BF%E5%AE%A2515&amp;act=custom&amp;SessionID="&SessionID&"'>点击进入房间</a>"
      end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
conn.close
set rec=nothing
set conn=nothing
%>

</p>
</card>
</wml>