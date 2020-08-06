<%Response.write "<br/>头衔:"
if objgbrs("lasttime")-objgbrs("regtimes")<1 then
Response.write "娃娃"
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1 and  objgbrs("lasttime")-objgbrs("regtimes")<10 then
Response.write "<img src='/bbs/reg/shao/2.gif' alt='下士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>下士</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=10 and  objgbrs("lasttime")-objgbrs("regtimes")<50 then
Response.write "<img src='/bbs/reg/shao/3.gif' alt='中士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>中士</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=50 and  objgbrs("lasttime")-objgbrs("regtimes")<100 then
Response.write "<img src='/bbs/reg/shao/4.gif' alt='上士'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>上士</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=100 and  objgbrs("lasttime")-objgbrs("regtimes")<150 then
Response.write "<img src='/bbs/reg/shao/5.gif' alt='少校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>少校</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=150 and  objgbrs("lasttime")-objgbrs("regtimes")<200 then
Response.write "<img src='/bbs/reg/shao/6.gif' alt='中校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>中校</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=200 and  objgbrs("lasttime")-objgbrs("regtimes")<250 then
Response.write "<img src='/bbs/reg/shao/7.gif' alt='大校'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>大校</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=250 and  objgbrs("lasttime")-objgbrs("regtimes")<300 then
Response.write "<img src='/bbs/reg/shao/8.gif' alt='少尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>少尉</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=300 and  objgbrs("lasttime")-objgbrs("regtimes")<400 then
Response.write "<img src='/bbs/reg/shao/9.gif' alt='中尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>中尉</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=400 and  objgbrs("lasttime")-objgbrs("regtimes")<600 then
Response.write "<img src='/bbs/reg/shao/10.gif' alt='上尉'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>上尉</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=600 and  objgbrs("lasttime")-objgbrs("regtimes")<800 then
Response.write "<img src='/bbs/reg/shao/11.gif' alt='少将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>上尉</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=800 and  objgbrs("lasttime")-objgbrs("regtimes")<1000 then
Response.write "<img src='/bbs/reg/shao/12.gif' alt='中将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>中将</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1000 and  objgbrs("lasttime")-objgbrs("regtimes")<1200 then
Response.write "<img src='/bbs/reg/shao/13.gif' alt='大将'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>大将</a>"
end if
end if

if objgbrs("lasttime")-objgbrs("regtimes")>=1200 and  objgbrs("lasttime")-objgbrs("regtimes")<6000 then
Response.write "<img src='/bbs/reg/shao/14.gif' alt='元帅'/>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/txxz.asp?SessionID=" & SessionID & "'>元帅</a>"
end if
end if


%>