<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<%
if Session("zh")="sid" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")

dim talks,baoch,usename,forname,show
  show=request("show")
  usename=Session("ltname")
  talks=trim(request("talks"))
  talks=untowide(talks)
 if Session("adftzl")=talks then
     response.write "<card id='afund' title='大厅发言'><p>请不要刷屏！<br/><a href='chats.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>交流大厅</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
        Session("asftzl")=talks
		Session.Timeout=5
  if talks="" then
     response.write "<card id='afund' title='大厅发言'><p>发言内容不能为空！<br/><a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>返回重写</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  End if
  sql="insert into gproom(usename,talk,baoch)values("
  sql=sql & sqlstr(usename) & ","
  sql=sql & sqlstr(talks) & ","
  sql=sql & sqlstr(4) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
dim drs
  set drs=Server.CreateObject("ADODB.Recordset")
  ssql="select zhiyue_id from usereg Where CStr(id)='" & iduse &"'"
  drs.open ssql,conn
if drs("zhiyue_id")=3 then
sql="update usereg set usejf=usejf+1,fanj=fanj+2,zhiyue_time=now() where CStr(id)='" & iduse & "'"
	conn.execute(sql)
drs.close
 set drs=Nothing
end if
  conn.close
  set conn=nothing
     response.write "<card id='afund' title='大厅发言' ontimer='Chats.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'><timer value='1'/></card></wml>"
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



