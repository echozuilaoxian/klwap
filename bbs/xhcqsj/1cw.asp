<%
if rs8("zhong")="y" then 
    Response.write "<a href='zhong.asp?SessionID=" & SessionID & "'>人族</a><br/>"
end if  
 
if rs8("zhong")="l" then 
 Response.write "<a href='zhong.asp?SessionID=" & SessionID & "'>狼族</a><br/>"
end if 
  
if rs8("zhong")="x" then 
 Response.write "<a href='zhong.asp?SessionID=" & SessionID & "'>吸血鬼</a><br/>"
end if 
%>
