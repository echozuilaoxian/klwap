<%
ConnStr="Provider = Microsoft.Jet.OLEDB.4.0;Data Source =" & Server.MapPath("#xh6666.mdb")
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
%><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="gb2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>  
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>               
<card id="main" title="��������"> 
<p align="center">
<%SessionID=request.querystring("SessionID")%>
�����������ձ�<br/>
</p>
<p>
<%
startype=Trim(request("startype"))
Mnum=Trim(request("key"))
Response.Write("�������:"&Mnum)
Response.Write("<br/>��������:"&startype)
If Len(Mnum)<>4 Then 
   Response.Write("<br/>����ȷ����4λ�������")
ElseIf Trim(Mnum+0)<>Trim(Mnum) Then 
   Response.Write("<br/>��ݱ���λ����")
ElseIf Left(Mnum,2)<>"19" Then 
   Response.write("<br/>����������������ȷ����")
Else
   Mnum=cint(Mnum)+startype
   Mnum=cint(Mnum)+day(date) +Month(date) 
   Mnum=Mnum/80
   num=Split(Mnum,".")
   Mnum="0."&num(1)
   Mnum=Mnum+0
   Mnum=Mnum*80
   Set Rs=Conn.Execute("Select Top 1 * From dat2005JN Where a="&Mnum)
   If Not (Rs.Eof Or Rs.Bof) Then 
		A=Rs("A")
		B=Rs("B")
		C=Rs("C")
		D=Rs("D")
		E=Rs("E")
		F=Rs("F")
		G=Rs("G")
		H=Rs("H")
		I=Rs("I")
		J=Rs("J")
		stype=Rs("type")
		Else
		nors="true"
   End If
End If
%>
<br/>
<%=B%><br/>
<%=C%><br/>
<%=D%><br/>
<%=E%><br/>
<%=F%><br/>
<%=G%><br/>
<%=H%><br/>
<%=I%><br/>
<%=J%><br/>
<%=stype%><br/>
<%if nors="true" then%>
�Բ���,��������������,������û�б�����������!��~
<%end if%>
<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>��������</a><br/>
<a href='xin.asp?SessionID=<%=SessionID%>'>������Ե</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>������ҳ</a>
</p>
</card>
</wml>