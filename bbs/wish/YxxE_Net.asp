<% LANGUAGE="VBSCRIPT" %>

<%
set conn=Createobject("ADODB.Connection")
conn.ConnectionString="DBQ="& server.mappath("/admin/Database/#qqccb.mdb")& ";DRIVER={Microsoft Access Driver (*.mdb)};"
conn.open
 sub endConnection()
 conn.close
 set conn=nothing
 end sub

dim SessionID,rsc

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
Session("zh")=rsc("useklsj")
Session("ltname")=rsc("usename")
  Session("showjd")=rsc("jdshow")
  Session("showwz")=rsc("cwxq")
  Session("SessionID")=rsc("wap")
  LKXXX=rsc("useklmm")
  ssusejf=rsc("usejf")
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
        response.redirect "http://xh6666.cn"
      else
        Session("ltfsid")=""
    End if

    End if
  Session.Timeout=10
end if

set rsc=nothing


SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
%>
