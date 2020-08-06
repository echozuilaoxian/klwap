<%
if int(datediff("s",srs("jj_times"),now())/1800)>0 then
response.redirect "s.asp?t=" & time() & "&jjid=" & jjid & "&SessionID=" & SessionID & "&wxwm=" & wxwm & ""
end if
%>