<%
if rs8("nongdj")<50 then 
    Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>贫农</a>"
end if  
 
if rs8("nongdj")=>50 and rs8("nongdj")<200 then 
 Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>果农</a>"
end if 
  
if rs8("nongdj")=>200 and rs8("nongdj")<500 then 
 Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>园丁</a>"
end if 
  
if rs8("nongdj")=>500 and rs8("nongdj")<1000 then 
 Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>园长</a>"
end if 
  
if rs8("nongdj")=>1000 and rs8("nongdj")<2000 then 
 Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>园主</a>"
end if 
  
if rs8("nongdj")=>2000  then 
 Response.write "<a href='nongdj.asp?SessionID=" & SessionID & "'>庄主</a>"
end if 
%>
