<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="夫妻洞房">
<p>
<%Server.ScriptTimeout=999
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
       msg="第三步:验证不通过.原因:你们今天已经洞过房或者你没有符合要求!<a href='/bbs/index.asp?SessionID="&SessionID &"'>返回社区首页</a>"
     else
          SQL="insert into mydf(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set myfq=myfq+1 where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg="第三步:验证通过.系统收取你30个金币的服务费.<a href='/bbs/reg/dongf/zs.asp?rd=8&amp;SessionID="&SessionID &"'>进入打开房间门并邀请您的另一半进入房间</a><br/>进入洞房后30分钟内请勿退出,退出将无法再进入,一天只能进一次洞房.请不要刷新"
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