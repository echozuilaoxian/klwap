<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="vip领薪特权" ontimer='/bbs/index.asp?SessionID=<%=SessionID%>'>
<timer value='10'/>
<p>
<% 
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
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
    sql="select * from vip where CStr(useid)='" & iduse & "'"
    objgbrs.open sql,conn
    if not objgbrs.eof then
if day(objgbrs("time"))<>day(now) then
sql="Delete FROM vip WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
      end if
      end if
end if
objgbrs.close
set objgbrs=nothing

Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM vip where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="今天您已经领过vip薪水了!一天只能领一次！<br/>正在返回..."
     else
          SQL="insert into vip(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+500,ml=ml+15,tili=tili+15 where CStr(id)='" & ids & "'"
          conn.execute sql
          dim talk
talk="" & Session("ltname") & "领取了vip日薪"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
          msg="领取vip日薪成功!金币增加500枚,魅力增加15点,体力增加15点<br/>正在返回..."
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