<%response.write "" & "<a href='/bbs/chan/indexcw.asp?SessionID=" & SessionID & "'>命</a>:"& objgbrs("cwsm")*1
response.write "" & "<a href='/bbs/chan/cwxy.asp?SessionID=" & SessionID & "'>情</a>:"& objgbrs("cwrq")*1
if objgbrs("cw")=1 then
end if

if objgbrs("cwsm")+objgbrs("cwrq")>499999 then 
    Response.write "<br/>猫神仙<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/12.gif' alt='13'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao66.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>299999 then 
    Response.write "<br/>大猫皇<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/11.gif' alt='12'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao55.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>49999 then 
    Response.write "<br/>黄金猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/10.gif' alt='11'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao44.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>19999 then 
    Response.write "<br/>猫法师<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/9.gif' alt='10'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao33.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>9999 then 
    Response.write "<br/>猫将军<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/8.gif' alt='9'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao22.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>4999 then 
    Response.write "<br/>猫队长<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/7.gif' alt='8'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao11.asp?rd=8&amp;SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>3499 then 
    Response.write "<br/>猫中队<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/6.gif' alt='7'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if
else if objgbrs("cwsm")+objgbrs("cwrq")>1999 then 
    Response.write "<br/>猫副队<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/5.gif' alt='6'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>1199 then 
    Response.write "<br/>高级猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/4.gif' alt='5'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>799 then 
    Response.write "<br/>中级猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/3.gif' alt='4'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>299 then 
    Response.write "<br/>猫咪咪<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/2.gif' alt='3'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")>49 then 
    Response.write "<br/>小小猫<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/1.gif' alt='2'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if

else if objgbrs("cwsm")+objgbrs("cwrq")<49 then 
    Response.write "<br/>不明生物<a href='/bbs/reg/cwsm.asp?SessionID=" & SessionID & "'><img src='/bbs/reg/mao/0.gif' alt='1'/></a>"
if objgbrs("id")=Session("useid") then
Response.write "<a href='/bbs/reg/gao/gao.asp?SessionID=" & SessionID & "'>领猫币</a>"
end if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if

%>