<%
ConnStr="Provider = Microsoft.Jet.OLEDB.4.0;Data Source =" & Server.MapPath("#xh6666.mdb")
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
%><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="gb2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>  
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>               
<card id="main" title="星座运势"> 
<p align="center">
<%SessionID=request.querystring("SessionID")%>
星座运势日日报<br/>
</p>
<p>
<%
startype=Trim(request("startype"))
Mnum=Trim(request("key"))
Response.Write("出生年份:"&Mnum)
Response.Write("<br/>星座数理:"&startype)
If Len(Mnum)<>4 Then 
   Response.Write("<br/>请正确输入4位出生年份")
ElseIf Trim(Mnum+0)<>Trim(Mnum) Then 
   Response.Write("<br/>年份必须位数字")
ElseIf Left(Mnum,2)<>"19" Then 
   Response.write("<br/>输入的年份有误，请正确输入")
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
对不起,您可能是外星人,地球上没有保存您滴数据!嘿~
<%end if%>
<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>星座运势</a><br/>
<a href='xin.asp?SessionID=<%=SessionID%>'>星座情缘</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>