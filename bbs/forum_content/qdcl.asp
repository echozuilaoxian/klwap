<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->


<%rd=Cstr(request("rd"))%>
<wml>
<card id="card1" title="论坛签到" ontimer='/BBS/forum_content/ContentlisT.asp?ForumID=<%=rd%>&amp;SessionID=<%=SessionID%>'>
<timer value='100'/>
<p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
dim rd,ids,num,cd
rd=Cstr(request("rd"))
if rd="" then
 response.write "系统提示:非法数据<br/>-------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
ids=Session("useid")
iduse=Session("useid")
   Set objgbrs3=Server.CreateObject("ADODB.Recordset")
    sql="select cd from sclt  where cstr(id)='"&rd&"'"
  objgbrs3.open sql,conn,1,1
  if  objgbrs3.eof then
msg="无此论坛<br/>"
else
cd=objgbrs3("cd")
  
  Set objgbrs4=Server.CreateObject("ADODB.Recordset")
    sql="select num from sn_dat  where cstr(des)='"&rd&"'"
  objgbrs4.open sql,conn,1,1
  if  objgbrs4.eof then
msg="此论坛还没有开通基金<br/>"
else
num=objgbrs4("num")
 
    Set objgbrs2=Server.CreateObject("ADODB.Recordset")
    sql="select * from wuza  where cstr(tjhm)='"&iduse& "' and itid='"&rd&"' and  day(retimes)=day(now())-1 and month(retimes)=month(now())and  year(retimes)=year(now())"
  objgbrs2.open sql,conn,1,1
    if  objgbrs2.eof then
msg="昨天您没有在本论坛发表过贴子,所以不能签到<br/>"
else
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from ltcd where CStr(useid)='" & iduse & "' and topao='" & rd & "'"
    objgbrs.open sql,conn
    if not objgbrs.eof then
if day(objgbrs("time"))<>day(now) then
sql="Delete FROM ltcd WHERE Cstr(useid)='" & iduse & "' and topao='" & rd & "'"
conn.Execute sql
      end if
      end if
objgbrs.close
set objgbrs=nothing

Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM ltcd where Cstr(useid)='" & ids & "' and topao='" & rd & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="请不要重复签到,一个论坛一天只能签到一次！<br/>正在返回..."
     else
       if cd>num then
msg="谢谢签到，签到基金不足,请联系该论坛版主<br/>"

   SQL="insert into ltcd(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
 
 else
   SQL="insert into ltcd(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+"&cd&",ml=ml+3,tili=tili+3 where CStr(id)='" & ids & "'"
            conn.execute sql
          Application.Unlock
sql="update sn_dat set num=num-" & cd & "   where CStr(des)='" & rd & "'"
   conn.execute sql
          Application.Unlock
          msg="谢谢签到，签到成功!金币增加"&cd&"枚,魅力增加3点,体力增加3点<br/>正在返回..."
end if
end if
end if
end if
end if
objgbrs3.close
set objgbrs3=nothing
objgbrs4.close
set objgbrs4=nothing
objgbrs2.close
set objgbrs2=nothing
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