<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" 

encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" 

"http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="��������Ϸ"><p>

<%
wap=request.querystring("wap")
      '����ҳ�治ʹ�û���
      Response.Expires = 0
%>
<%
dim GuessNum
on error resume next
GuessNum=Request("Number")
if GuessNum="" then GuessNum="0" End if
GuessNum=Clng(GuessNum)

Session("Count")=Session("Count") + 1
if Session("Count") < 10 and GuessNum <> session("Number") then

%>
<br/><input type='text' name='Number'  value='' format='*N'/>
<anchor>�ύ
<go href='guessNumber.asp?wap=<%=wap%>'>' method='post'>
<postfield name='Number' value='$(Number)'/>	
</go>
</anchor>
<%
end if
if GuessNum<0 or guessNum>100 then
    Response.write "������1~100֮�������"
elseif GuessNum=0 then
	session("Count") = 0
    Randomize
	session("Number") = Int(rnd * 100 + 1)
    Response.write "������1~100֮�������"
elseif GuessNum > session("Number") then
	response.write "��µ�̫����"
elseif GuessNum < session("Number") then
	response.write "��µ�̫С��"
elseif GuessNum = session("Number") then
	response.write "ף����,�¶���"
end if

Response.write "<br/>������" & Session("Count") & "��"
if Session("Count")=10 then
    Response.write "����" & Session("Number")
end if
%>
<a href="guessnumber.asp?Number=0">���²�</a><br/>--------<br/>
<a href='/bbs/scyl.asp?wap=<%=wap%>'>������������</a><br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>����������ҳ</a>-<a href='/index.asp?wap=<%=wap%>'>��ҳ</a>
</p>
</card>
</wml>
