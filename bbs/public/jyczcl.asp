<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
dim id,jorf,munber,ltlyuan,zfly
zfly=request("zfly")
jorf=request("jorf")
munber=Clng(request("munber"))
id=request("id")
ForumID=request("ForumID")
reids=Session("useid")
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")<>"" or Session("Counter")="pass_numbers_55556666" then
if zfly="" then
   Response.write "<card id='card1' title='封禁操作'><p align='left'>请填写理由!<br/><a href='jycz.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
   Response.end
end if
if id="" then
   Response.write "<card id='card1' title='封禁操作'><p align='left'>请输入ID!<br/><a href='jycz.asp.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
   Response.end
end if
  if jorf="j" then
     ltlyuan="处罚:"&Cstr(munber)&"金币<br/>&#29702;&#30001;&#58;"&zfly
     lydcfvg="你被关进监狱,同时处罚金币" & Cstr(munber) & "元,操作:" & Session("ltname") & "ID:" & reids & "理由:" & zfly & ",这是系统信息,请勿回复以及转发!"
   else
     ltlyuan="处罚:"&Cstr(munber)&"金币<br/>&#29702;&#30001;&#58;"&zfly
     lydcfvg="你被关进监狱,同时处罚金币" & Cstr(munber) & "元,操作人:" & Session("ltname") & "ID:" & reids & "理由:" & zfly & ",这是系统信息,请勿回复以及转发!"
  end if
  sql="insert into guestbook2(ids,reids,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
if jorf="j" then
    sql="update usereg set usejf=usejf-" & munber & " where CStr(id)=" & id
   else
    sql="update usereg set usejf=usejf-" & munber & " where CStr(id)=" & id
end if
	conn.execute(sql)
  Application.Unlock
  ltlyuan=lydcfvg
  gftz()
	dim bzfscz,ids
	ids=Session("useid")
	bzfscz=CStr(request("bzfscz"))
 Select Case bzfscz
   Case "1"
    sql="update usereg set ftsdbz='t',lysdbz='t',fsczg=" & ids & " where CStr(id)='" & id & "'"
   Case "2"
    sql="update usereg set ftsdbz='x',fsczg=" & ids & " where CStr(id)='" & id & "'"
 End Select
    conn.execute(sql)
conn.close
set conn=nothing
Response.write "<card id='card1' title='封禁操作' ontimer='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>操作成功,正在返回...<br/><a href='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>用户资料</a></p></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
end if
%>
