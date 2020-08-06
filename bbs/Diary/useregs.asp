<% LANGUAGE="VBSCRIPT" %>
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<%
'response.redirect "update.asp"
'response.end
dim SessionID,rsc
t1=timer()
SessionID=request("SessionID")
if SessionID="" then SessionID=Session("SessionID")
lycountgo=lycount
            if Session("gyykid")="" then
          Session("gyykid")="1000000"
        elseif Session("gyykid") > 2000000 or Session("gyykid") < 1000000 then
       Session("gyykid")="1000001"
         end if

         if SessionID="" then
    SessionID=request.cookies("SessionID")
      end if
       if SessionID="" then
   SessionID=Session("SessionID")
     end if
         if SessionID="" then
Session("gyykid")=Session("gyykid")+9
  SessionID="guest00000000000000000000"& Session("gyykid") &""
          end if

if left(SessionID,25)="guest00000000000000000000" then
Session("useid")=Session("gyykid")
Session("zh")="wap"
Session("ltname")="&#x6E38;&#x5BA2;"
Session("showjd")="10"
Session("showwz")="500"
Session("SessionID")=SessionID
else
    set rsc=Server.CreateObject("ADODB.Recordset")
    ssql="select * from usereg where wap='"&SessionID&"' order by id"
    rsc.open ssql,conn
if rsc.eof then
Session("useid")=Session("gyykid")
Session("zh")="wap"
Session("ltname")="&#x6E38;&#x5BA2;"
Session("showjd")="10"
Session("showwz")="500"
Session("SessionID")="guest00000000000000000000"& Session("gyykid") &""
else
Session("useid")=rsc("id")
Session("zh")=rsc("usephone")
Session("ltname")=rsc("usename")
  Session("showjd")=rsc("jdshow")
  Session("showwz")=rsc("cwxq")
  Session("SessionID")=rsc("wap")
  LKXXX=rsc("usepass")
response.Cookies("SessionID")=rsc("wap")
Response.Cookies("SessionID").Expires=#January 01, 2010#
if CStr(rsc("yxxegg"))<>"0" then
      Session("Counter")="pass_numbers_55556666"
    End if

    if CStr(rsc("yxxezb"))<>"0" then
        Session("yxxezb")=rsc("yxxezb")
      else
        Session("yxxezb")=""
    End if

    if CStr(rsc("yxxexc"))<>"0" then
        Session("yxxexc")=rsc("yxxexc")
      else
        Session("yxxexc")=""
    End if

    if CStr(rsc("vip"))<>"0" then
        Session("vip")=rsc("vip")
      else
        Session("vip")=""
    End if

if CStr(rsc("cw1"))<>"0" then
        Session("cw1")=rsc("cw1")
      else
        Session("cw1")=""
    End if

    if CStr(rsc("bzbz"))<>"0" then
        Session("bzbz")=rsc("bzbz")
      else
        Session("bzbz")=""
    End if

    if CStr(rsc("gly"))<>"0" then
        Session("gly")=rsc("gly")
      else
        Session("gly")=""
    End if

	if CStr(rsc("ftsdbz"))="t" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltfsbz")="sdfghdfg_dfg45fg45_6554"
	  else
	    Session("ltfsbz")=""
	End if
	if CStr(rsc("lysdbz"))="t" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltlybz")="dfg34fdf_dfg554ghy_3452"
	  else
	    Session("ltlybz")=""
	End if
	if CStr(rsc("ftsdbz"))="x" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltfsid")="ksjrh_jae56_hge654dgdd"
        response.redirect "/index.asp"
      else
        Session("ltfsid")=""
    End if

    End if
  Session.Timeout=10
end if
set rsc=nothing

if Systemop<>"1" and Session("useid")<>"1" then
Dim useipyxxe,ipaddryxxe
useipyxxe = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If useipyxxe = "" Then useipyxxe = Request.ServerVariables("REMOTE_ADDR") 
ipaddryxxe = Clng(left(trim(replace(useipyxxe,".","")),6))
If (ipaddryxxe<>211103 and ipaddryxxe<>102186 and ipaddryxxe<>612401 and ipaddryxxe<211136) or (ipaddryxxe>220195 and ipaddryxxe<220190) or (ipaddryxxe>211143 and ipaddryxxe<211941) or (ipaddryxxe>211962 and ipaddryxxe<218200) or (ipaddryxxe>218207 and ipaddryxxe<221130) or (ipaddryxxe>221131) Then response.redirect"/WAP/SORR.asp"
end if
if Systemyk<>"1" and Session("zh")="wap" then response.redirect"/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
if Systemkg<>"1" then response.redirect"/bbs/off.asp"
%>