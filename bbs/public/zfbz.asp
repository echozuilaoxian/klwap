<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="main" title="关于金币">
<p  align="left">金币说明<br/>-----------<br/>
<% SessionID=request.querystring("SessionID") %>
一、用户每访问社区一次奖金币1个，每发表一帖奖金币50个，回复文章奖金币10个(字数大于5个字)，文章入精奖金币200元(系统自动操作)！
<br/>二、文章被删除减金币50个，回复被删除减金币10个，文章解除精华减金币200元，恶意捣乱者会由管理员扣除该会员所有金币的一半!！情节严重:禁言,禁帖,封号等处罚!
<br/>
三、金币的用处:可以买房,买车,买宠物.然后结婚(结婚需要有房才能结).可以开聊天室和朋友们一起聊天.可以买文章.到赌场豪赌等等...<br/>
<% 
response.write("------------<br/>")
Response.write "<a href='/bbs/sqbz/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x65B0;&#x4EBA;&#x5E2E;&#x52A9;</a><br/>"
Response.write "<a href='/bbs/Index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>"
%>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5; "

distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small>
</p></card></wml>

