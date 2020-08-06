<%
if objgbrs("gongzuo")=0 then
Response.write "职业:無业游民"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=11 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=1&amp;SessionID=" & SessionID & "'>侍者</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=12 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=2&amp;SessionID=" & SessionID & "'>群众演员</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=13 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=3&amp;SessionID=" & SessionID & "'>跑龙套演员</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=14 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=4&amp;SessionID=" & SessionID & "'>主角替身</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=15 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=5&amp;SessionID=" & SessionID & "'>新人影星</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=16 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=6&amp;SessionID=" & SessionID & "'>一般影星</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=17 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=7&amp;SessionID=" & SessionID & "'>电视名星</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=18 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=8&amp;SessionID=" & SessionID & "'>影视大腕</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=19 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=9&amp;SessionID=" & SessionID & "'>演艺明星</a>"
end if
if objgbrs("gongzuo")=2 and objgbrs("zhiye")=20 then
Response.write "娱乐圈:<a href='/bbs/job/entlist1.asp?n=10&amp;SessionID=" & SessionID & "'>超级巨星</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=1 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=1&amp;SessionID=" & SessionID & "'>收发室职员</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=2 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=2&amp;SessionID=" & SessionID & "'>行政助理</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=3 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=3&amp;SessionID=" & SessionID & "'>区域推销员</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=4 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=4&amp;SessionID=" & SessionID & "'>低级主管</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=5 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=5&amp;SessionID=" & SessionID & "'>项目经理</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=6 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=6&amp;SessionID=" & SessionID & "'>高级经理</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=7 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=7&amp;SessionID=" & SessionID & "'>业务总监</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=8 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=8&amp;SessionID=" & SessionID & "'>副总裁</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=9 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=9&amp;SessionID=" & SessionID & "'>首席执行官</a>"
end if
if objgbrs("gongzuo")=1 and objgbrs("zhiye")=10 then
Response.write "商业:<a href='/bbs/job/sylist1.asp?n=10&amp;SessionID=" & SessionID & "'>商业大亨</a>"
end if
%>