<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="*月宫一日游">
<p>
<%
dim idss,guanb
wap=request.querystring("wap")
idss=Session("useid")
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn		   
if objgbrs("usejf")<20 then response.redirect"signal.asp"
                sql="update usereg set usejf=usejf-20  where CStr(id)='" & idss & "'" 
			conn.execute sql
    
%>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")="/bbs/scfu.asp?"
gfdsa=Session("ltname")
lasttlls="91"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>&#x8D2D;&#x4E70;&#x6210;&#x529F;&#xFF0C;&#x4F60;&#x82B1;&#x4E86;20&#x679A;&#x91D1;&#x5E01;<br/>
<a href='/bbs/shop/img/002.gif'>>我要下载自已用</a><br/>
>输入你要赠送的ID
<br/><input type='text' format='*N' name='frid'/>
<br/>>您想对她/他说点什么呢？
<br/><input name='ltlyuan' maxlength='200'/>
<br/><anchor>>我要送给他/她
<br/><go href="addcl.asp?wap=<%=wap%>" method="post" accept-charset="utf-8">
<%
response.write "<postfield name='ltlyuan' value='您的朋友：" & converttowide(gfdsa) & "ID:" & objgbrs("id") & "给您发来一张贺卡“月宫一日游”\(img)/bbs/shop/img/002.gif(/img)他/她想对你说：$(ltlyuan)'/>"
response.write "<postfield name='frid' value='$(frid)'/>"
response.write "</go></anchor>"
%><a href='/bbs/shop/index.asp?wap=<%=wap%>'>/返回商店</a><br/>
<a href='/bbs/index.asp?wap=<%=wap%>'>&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
</p></card>
<%
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
</wml>





