<% LANGUAGE="VBSCRIPT" %>

<%
set conn=Createobject("ADODB.Connection")
conn.ConnectionString="DBQ="& server.mappath("/lt/#cjb781219+&@#$#$")& ";DRIVER={Microsoft Access Driver (*.mdb)};"
conn.open
 sub endConnection()
 conn.close
 set conn=nothing
 end sub

dim wap,rsc

wap=request("wap")


            if Session("gyykid")="" then
          Session("gyykid")="1000000"
        elseif Session("gyykid") > 2000000 or Session("gyykid") < 1000000 then
       Session("gyykid")="1000001"
         end if

         if wap="" then
    wap=request.cookies("wap")
      end if
         if wap="" then
Session("gyykid")=Session("gyykid")+9
  wap="guest00000000000000000000"& Session("gyykid") &""
          end if

if left(wap,25)="guest00000000000000000000" then
Session("useid")=Session("gyykid")
Session("zh")="wap"
Session("ltname")="&#x6E38;&#x5BA2;"
Session("showjd")="10"
Session("showwz")="500"
Session("wap")=wap
else
    set rsc=Server.CreateObject("ADODB.Recordset")
    ssql="select * from usereg where wap='"&wap&"' order by id"
    rsc.open ssql,conn
if rsc.eof then
Session("useid")=Session("gyykid")
Session("zh")="wap"
Session("ltname")="&#x6E38;&#x5BA2;"
Session("showjd")="10"
Session("showwz")="500"
Session("wap")="guest00000000000000000000"& Session("gyykid") &""
else
Session("useid")=rsc("id")
Session("zh")=rsc("usephone")
Session("ltname")=rsc("usename")
  Session("showjd")=rsc("jdshow")
  ssusejf=rsc("usejf")
 if Session("useid")=1 or Session("useid")=2 then 
      Session("Counter")="pass_numbers_56431290"
    End if

	if CStr(rsc("ftsdbz"))="t" and Session("Counter")<>"pass_numbers_56431290" then
	    Session("ltfsbz")="sdfghdfg_dfg45fg45_6554"
	  else
	    Session("ltfsbz")=""
	End if
	if CStr(rsc("lysdbz"))="t" and Session("Counter")<>"pass_numbers_56431290" then
	    Session("ltlybz")="dfg34fdf_dfg554ghy_3452"
	  else
	    Session("ltlybz")=""
	End if
	if CStr(rsc("ftsdbz"))="x" and Session("Counter")<>"pass_numbers_56431290" then
	    Session("ltfsid")="ksjrh_jae56_hge654dgdd"
        response.redirect "http://yxxe.net"
      else
        Session("ltfsid")=""
    End if

    End if
  Session.Timeout=10
end if

set rsc=nothing


wap=request.querystring("wap")
if Session("zh")="wap" then
        response.redirect "/lt/yksm.asp?wap="&wap&""
     response.end
    End if
iduse=Session("useid")
gfdsa=Session("ltname")
%>