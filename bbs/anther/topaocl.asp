<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="投票系统">  
<p>
<% if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if

wap=request.querystring("wap")
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM useid where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="你已经投过了,下次再投吧!"
     else
          SQL="insert into useid(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+200 where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg="投票有效,奖金币200深表谢意!"
      end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
conn.close
set rec=nothing
set conn=nothing
%>
<br/>-------------
<br/><a href='view.asp?wap=<%=wap%>'>查看投票结果</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>[社区首页]</a><br/><a href='/index.asp?wap=<%=wap%>'>[狂野首页]</a>
</p>
</card>
</wml>

