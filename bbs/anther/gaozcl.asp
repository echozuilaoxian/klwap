<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="领取日薪" ontimer='/bbs/index.asp?SessionID=<%=SessionID%>'>
<timer value='10'/>
<p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
iduse=Session("useid")
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from gao2 where CStr(useid)='" & iduse & "'"
    objgbrs.open sql,conn
    if not objgbrs.eof then
if day(objgbrs("time"))<>day(now) then
sql="Delete FROM gao2 WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
      end if
      end if
objgbrs.close
set objgbrs=nothing

Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao2 where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="今天您已经领过日薪了!一天只能领一次！<br/>正在返回..."
     else
          SQL="insert into gao2(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+200,ml=ml+5,tili=tili+5 where CStr(id)='" & ids & "'"
          conn.execute sql
          dim talk
talk="" & Session("ltname") & "领取了日薪"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
          msg="领取日薪成功!金币增加200枚,魅力增加5点,体力增加5点<br/>正在返回..."
      end if
response.write ""&msg&"<br/>------------<br/><a href='/bbs/Index.asp?SessionID=" & SessionID & "'>"&converttowidebaiti("返回社区首页")&"</a><br/>"
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