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
<card id="main" title="宠物公司">
<p>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
lasttlls="100"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "欢迎<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;wap=" & wap & "'>" & converttowide(gfdsa) & "</a>来到宠物公司!"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
%>
<br/>您现在的金币有:<% =objgbrs("usejf")%>
<br/>价格列表 
<br/>
--------
<br/>1.<a href='/bbs/chan/cwt/go.asp?wap=<%=wap%>'>哈皮狗</a>10000金币 
<br/><anchor>购买<go method="post" href='cwcla.asp?wap=<%=wap%>'><postfield name="cw" value="1"/></go></anchor>
<br/>2.<a href='/bbs/chan/cwt/mao.asp?wap=<%=wap%>'>波斯猫</a>30000金币 
<br/><anchor>购买<go method="post" href='cwclb.asp?wap=<%=wap%>'><postfield name="cw" value="2"/></go></anchor>
<br/>3.<a href='/bbs/chan/cwt/niao.asp?wap=<%=wap%>'>金丝雀</a>50000金币
<br/><anchor>购买<go method="post" href='cwclc.asp?wap=<%=wap%>'><postfield name="cw" value="3"/></go></anchor>
<br/>4.<a href='/bbs/chan/cwt/xion.asp?wap=<%=wap%>'>趴趴熊</a>200000金币
<br/><anchor>购买<go method="post" href='cwcld.asp?wap=<%=wap%>'><postfield name="cw" value="4"/></go></anchor>
<br/>5.<a href='/bbs/chan/cwt/hu.asp?wap=<%=wap%>'>吊睛虎</a>500000金币       
<br/><anchor>购买<go method="post" href='cwcle.asp?wap=<%=wap%>'><postfield name="cw" value="5"/></go></anchor>
<br/>6.<a href='/bbs/chan/cwt/ji.asp?wap=<%=wap%>'>卡卡鸡</a>1000金币       
<br/><anchor>购买<go method="post" href='cwclf.asp?wap=<%=wap%>'><postfield name="cw" value="6"/></go></anchor>
<br/>7.<a href='/bbs/chan/cwt/ya.asp?wap=<%=wap%>'>红头鸭</a>3000金币       
<br/><anchor>购买<go method="post" href='cwclg.asp?wap=<%=wap%>'><postfield name="cw" value="7"/></go></anchor>
<br/>8.<a href='/bbs/chan/cwt/yu.asp?wap=<%=wap%>'>屁屁鱼</a>5000金币       
<br/><anchor>购买<go method="post" href='cwclh.asp?wap=<%=wap%>'><postfield name="cw" value="8"/></go></anchor>

<br/>--------

<br/><a href='/bbs/public/gygl.asp?wap=<%=wap%>'>我的地盘</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>







