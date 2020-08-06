<%
Dim ad09(13)
ad09(0)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x1.jpg' alt='.'/></a>"
ad09(1)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x3.jpg' alt='.'/></a>"
ad09(2)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x5.jpg' alt='.'/></a>"
ad09(3)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x7.jpg' alt='.'/></a>"
ad09(4)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x9.jpg' alt='.'/></a>"
ad09(5)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x6.jpg' alt='.'/></a>"
ad09(6)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x8.jpg' alt='.'/></a>"
ad09(7)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x10.jpg' alt='.'/></a>"
ad09(8)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x12.jpg' alt='.'/></a>"
ad09(9)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x11.jpg' alt='.'/></a>"
ad09(10)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x.jpg' alt='.'/></a>"
ad09(11)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x2.jpg' alt='.'/></a>"
ad09(12)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x4.jpg' alt='.'/></a>"
ad09(13)="<a href='/bbs/Myalbum/Index.asp?SessionID=" & SessionID & "'><img src='x0.jpg' alt='.'/></a>"
Randomize
I=Int(Rnd()*14)
ad=ad09(i)
Response.Write(ad)
%>