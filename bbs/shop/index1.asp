<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="�̵�">
<p align='left'>
<img src='shop.gif' alt=''/>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")="/hk/shop/index.asp?"
gfdsa=Session("ltname")
lasttlls="90"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>&#x6709;&#x65B0;&#x7559;&#x8A00;" & lycount & "&#x6761;</a><br/>"
    Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
End if
%>
<a href='#card2'>��С���Ի�</a><br/>
<b>������ϵĿ�Ƭ</b><br/>
<a href='shop_zj.asp?wap=<%=wap%>'>+|����ӵ��</a><br/>
<a href='shop_gx.asp?wap=<%=wap%>'>+|��Ц����</a><br/>
<a href='shop_mg.asp?wap=<%=wap%>'>+|õ�廨��</a><br/>
<a href='shop_zq.asp?wap=<%=wap%>'>+|����ף��</a><br/>
<b>������ϵ�CD</b><br/>
<a href='shop_cd.asp?wap=<%=wap%>'>>����ף��</a><br/>
<a href='shop_cd2.asp?wap=<%=wap%>'>>���ı��</a><br/>
----------<br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>������ҳ</a>
</p>
</card>
<card id="card2" title="��С���Ի�">
<p>
С��˵:���������վ��������ҵ��Ϻؿ��̵���ϰ�ඣ�<br/>С��������д����Ŀ�ƬҲ�д�����CD���͸��������������������ʵ�������ȻҲ�������ã����㿴����Ҫʲô�ɡ�<br/>
<a href='/bbs/shop/index.asp?wap=<%=wap%>'>�����ϼ�</a><br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>������ҳ</a><br/>
</p>
</card><%
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
</wml>


