<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="main" title="���ڽ��">
<p  align="left">���˵��<br/>-----------<br/>
<% SessionID=request.querystring("SessionID") %>
һ���û�ÿ��������һ�ν����1����ÿ����һ�������50�����ظ����½����10��(��������5����)�������뾫�����200Ԫ(ϵͳ�Զ�����)��
<br/>�������±�ɾ�������50�����ظ���ɾ�������10�������½�����������200Ԫ�����⵷���߻��ɹ���Ա�۳��û�Ա���н�ҵ�һ��!���������:����,����,��ŵȴ���!
<br/>
������ҵ��ô�:������,��,�����.Ȼ����(�����Ҫ�з����ܽ�).���Կ������Һ�������һ������.����������.���ĳ����ĵȵ�...<br/>
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

