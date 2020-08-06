<%
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&forumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
   Response.write "<wml><card title='&#x51FA;&#x9519;&#x5566;&#x5566;'><p>&#x65E0;&#x6B64;&#x8BBA;&#x575B;！<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;</a></p></card></wml>"
response.end
Else
dlname=objgbrsy("name")
dljj=objgbrsy("shuo")
LX_yxxe=objgbrsy("qx")
gongzuo=objgbrsy("gongzuo")
ml=objgbrsy("ml")
titi=objgbrsy("titi")
jin=objgbrsy("jin")
ltlogo=objgbrsy("ltlogo")
end if
objgbrsy.close
Set objgbrsy= Nothing

if LX_yxxe=1 and Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID="&forumID&"&amp;id="&id&"&amp;page="&page&""
Response.write "<card id='card1' title='" & converttowidebaiti(dlname) & "-&#x9519;&#x8BEF;&#x63D0;&#x793A;' ontimer='/BBS/UseLogin.asp?SessionID="&SessionID&"'><timer value='500'/><p><b>&#x9519;&#x8BEF; &#xFF01;&#x8BE5;&#x7248;&#x5757;&#x53EA;&#x9650;&#x4F1A;&#x5458;&#x8FDB;&#x5165;</b>"
response.write "<br/><a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>&#x7ACB;&#x5373;&#x767B;&#x9646;</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
response.end
End if

if LX_yxxe=2 and Session("yxxezb")="" and Session("yxxexc")="" and Session("cw1")="" and Session("cg")="" and Session("bzbz")="" and Session("gly")="" and Session("Counter")<>"pass_numbers_55556666" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID="&forumID&"&amp;id="&id&"&amp;page="&page&""
Response.write "<card id='card1' title='" & converttowidebaiti(dlname) & "-&#x9519;&#x8BEF;&#x63D0;&#x793A;' ontimer='/bbs/index.asp?SessionID=" & SessionID & "'><timer value='500'/><p align='center'><b>&#x9519;&#x8BEF;&#xFF01;&#x8BE5;&#x7248;&#x5757;&#x53EA;&#x9650;&#x7248;&#x4E3B;&#x8FDB;&#x5165;</b>"
response.write "<br/><a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>&#x7ACB;&#x5373;&#x767B;&#x9646;</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
response.end
End if

if LX_yxxe=3 and Session("yxxezb")="" and Session("yxxexc")="" and Session("cw1")="" and Session("cg")="" and Session("bzbz")="" and Session("gly")="" and Session("Counter")<>"pass_numbers_55556666" then
if Session("zh")="wap" then 
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID="&forumID&"&amp;id="&id&"&amp;page="&page&""
response.write "<card id='card1' title='" & converttowidebaiti(dlname) & "-&#x9519;&#x8BEF;&#x63D0;&#x793A;' ontimer='/BBS/UseLogin.asp?SessionID="&SessionID&"'><timer value='500'/><p><b>&#x8BF7;&#x5148;&#x767B;&#x9646;</b><a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>&#x7ACB;&#x5373;&#x767B;&#x9646;</a></p></card></wml>"
response.end
End if
set rsss=Server.CreateObject("ADODB.Recordset")
ssqll="select * from usereg where Cstr(id)='" & iduse & "'"
rsss.open ssqll,conn
YXXETI=rsss("tili")
YXXEMI=rsss("ml")
YXXEjb=rsss("usejf")
YXXEGZ=rsss("tianshu")
if YXXETI<titi or YXXEMI<ml or YXXEjb<jin or YXXEGZ<gongzuo then
Response.write "<card id='card1' title='" & converttowidebaiti(dlname) & "-&#x9519;&#x8BEF;&#x63D0;&#x793A;' ontimer='/bbs/index.asp?SessionID=" & SessionID & "'><timer value='500'/><p>&#x7CFB;&#x7EDF;&#x63D0;&#x793A;&#xFF01;&#x5404;&#x9879;&#x79EF;&#x5206;&#x4E0D;&#x8DB3;&#x65E0;&#x6CD5;&#x8FDB;&#x5165;,<b>" & converttowidebaiti(dlname) & "</b>-&#x8BE5;&#x7248;&#x5757;&#x9700;&#x8FBE;&#x5230;&#x4EE5;&#x4E0B;&#x8981;&#x6C42;&#x624D;&#x80FD;&#x8FDB;&#x5165;!<br/>---------------<br/><a href='/bbs/job.asp?SessionID=" & SessionID & "'><b>&#x5DE5;&#x4F5C;</b></a><b>&#x5929;&#x6570;:</b><u>"&gongzuo&"&#x5929;.</u><b>&#x6B20;"&gongzuo-YXXEGZ&"&#x5929;</b><br/><b>&#x9700;&#x8981;&#x91D1;&#x5E01;:</b><u>"&jin&"&#x679A;</u>.<b>&#x6B20;"&jin-YXXEjb&"&#x679A;</b><br/><b>&#x9700;&#x8981;&#x4F53;&#x529B;:</b><u>"&titi&"&#x70B9;</u>.<b>&#x6B20;"&titi-YXXETI&"&#x70B9;</b><br/><b>&#x9700;&#x8981;&#x9B45;&#x529B;:</b><u>"&ml&"&#x70B9;</u>.<b>&#x6B20;"&ml-YXXEMI&"&#x70B9;</b><br/>---------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a></p></card></wml>"
Response.end
rsss.close
Set rsss= Nothing
End if
End if

%>