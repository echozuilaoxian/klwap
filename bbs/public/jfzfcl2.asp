<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if Session("Counter")="pass_numbers_55556666" or Session("yxxezb")<>"" then
dim id,jorf,munber,ltlyuan,zfly
zfly=request("zfly")
jorf=request("jorf")
munber=Clng(request("munber"))
id=request("id")
reids=Session("useid")
if zfly="" then
end if
  if jorf="j" then
'   Response.write "<card id='card1' title='奖罚金币'><p align='center'>很抱歉,社区金库是空的"
'   Response.write "<br/><a href='jfzf.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
'   Response.end
     ltlyuan="奖励:"&Cstr(munber)*5&"经验,理由:"&zfly
     lydcfvg="奖励经验" & Cstr(munber)*5& "点,操作:" & Session("ltname") & "ID:" & reids & ",理由:" & zfly & ",这是系统信息,请勿回复以及转发!"
   else
     ltlyuan="处罚:"&Cstr(munber)*5&"经验,理由:"&zfly
     lydcfvg="处罚经验" & Cstr(munber)*5 & "点,操作:" & Session("ltname") & "ID:" & reids & ",理由:" & zfly & ",这是系统信息,请勿回复以及转发!"
  end if
  sql="insert into guestbook1(ids,reids,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
if jorf="j" then
    sql="update usereg set ticont=ticont+" & munber & " where CStr(id)=" & id
   else
    sql="update usereg set ticont=ticont-" & munber & " where CStr(id)=" & id
end if
	conn.execute(sql)
  Application.Unlock
  ltlyuan=lydcfvg
            gftz()
   Response.write "<card id='card1' title='奖罚经验' ontimer='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='3'/>"
   Response.write "<p>操作成功，正在返回..."
   Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>会员资料</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
end if
conn.close
set conn=nothing
%>