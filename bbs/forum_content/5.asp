<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
dim rd,ids
rd=Cstr(request("rd"))
ForumID=request("ForumID")
ids=Session("useid")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<%
Response.write "<card id='card1' title='领取"& dlname&"-基金'><p>领取"& dlname&"-基金<br/>-----------<br/>"
if Session("bzbz")<>"" or  Session("yxxegg")<>"" or  Session("yxxexc")<>"" or  Session("yxxezb")<>"" then
sql="Delete FROM gaowz WHERE  DATEDIFF('s', time, now()) > 43200*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gaowz where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="本月的论坛基金你已经领过!请下个月再领!可以问问其他版主是否已经领过,如果基金不够论坛开销,可以向高级督察申请增加!"
     else
          SQL="insert into gaowz(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
sql="update jzbl set hfcontd=hfcontd+10000 Where CStr(itid)='" & ForumID & "'"
  conn.Execute(sql)
          sql="update sn_dat set num=num+10000 where CStr(des)='" & ForumID & "'"
          conn.execute sql
          Application.Unlock
          msg="成功领取本月基金!您所在该版块的基金增加10000元,一个月只能领一次,如果基金不够论坛开销,可以向高级督察申请增加!"
      end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

rec.close
set rec=nothing
     else
Response.write "系统无法识别您的身份"

end if

Response.write "<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
set conn=nothing
%>