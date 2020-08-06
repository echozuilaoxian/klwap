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
<card id="main" title="社区学校">
<p align="left">
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
%>

<img src='bcly.gif' alt='学校'/><br/>
欢迎,
<%
lasttlss="156"
lasttlls="156"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>"
Response.write "<br/><a href='/bbs/mysx.asp?SessionID="&SessionID&"'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,id,usejf,nianji from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
Response.write "<br/>学历:"
if objgbrs("xl")=0 then
Response.write "没有证书!"
end if
if objgbrs("xl")=1 then
Response.write "小学毕业"
end if
if objgbrs("xl")=2 then
Response.write "初中毕业"
end if
if objgbrs("xl")=3 then
Response.write "高中毕业"
end if
if objgbrs("xl")=4 then
Response.write "大学毕业"
end if
if objgbrs("xl")=5 then
Response.write "硕士生"
end if
if objgbrs("xl")=6 then
Response.write "博士生"
end if
Response.write "<br/>年级:"
if objgbrs("nianji")=0 then
Response.write "未读书"
Response.write "<br/><a href='/bbs/school/rx1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要读书</a>"
end if
if objgbrs("xf")=-1 then
Response.write "曾读小学一年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=1 and objgbrs("xf")>=0 then
Response.write "小学一年级"
if objgbrs("nianji")=1 and objgbrs("xf")>=500 and objgbrs("qs")>=1000 and objgbrs("love")>=1000 then
Response.write "<br/><a href='/bbs/school/sxa.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-2 then
Response.write "曾读小学二年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=2 and objgbrs("xf")>=0 then
Response.write "小学二年级"
if objgbrs("nianji")=2 and objgbrs("xf")>=1000 and objgbrs("qs")>=2000 and objgbrs("love")>=2000 then
Response.write "<br/><a href='/bbs/school/sxb.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-3 then
Response.write "曾读小学三年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=3 and objgbrs("xf")>=0 then
Response.write "小学三年级"
if objgbrs("nianji")=3 and objgbrs("xf")>=1500 and objgbrs("qs")>=3000 and objgbrs("love")>=3000 then
Response.write "<br/><a href='/bbs/school/sxc.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-4 then
Response.write "曾读小学四年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=4 and objgbrs("xf")>=0 then
Response.write "小学四年级"
if objgbrs("nianji")=4 and objgbrs("xf")>=2000 and objgbrs("qs")>=4000 and objgbrs("love")>=4000 then
Response.write "<br/><a href='/bbs/school/sxd.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-5 then
Response.write "曾读小学五年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=5 and objgbrs("xf")>=0 then
Response.write "小学五年级"
if objgbrs("nianji")=5 and objgbrs("xf")>=2500 and objgbrs("qs")>=5000 and objgbrs("love")>=5000 then
Response.write "<br/><a href='/bbs/school/sxe.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-6 then
Response.write "曾读小学六年级"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=6 and objgbrs("xf")>=0 then
Response.write "小学六年级"
if objgbrs("nianji")=6 and objgbrs("xf")>=3000 and objgbrs("qs")>=6000 and objgbrs("love")>=6000 then
Response.write "<br/><a href='/bbs/school/sxf.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-7 then
Response.write "曾读初一"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=7 and objgbrs("xf")>=0 then
Response.write "初一"
if objgbrs("nianji")=7 and objgbrs("xf")>=4500 and objgbrs("qs")>=9000 and objgbrs("love")>=9000 then
Response.write "<br/><a href='/bbs/school/sxg.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-8 then
Response.write "曾读初二"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=8 and objgbrs("xf")>=0 then
Response.write "初二"
if objgbrs("nianji")=8 and objgbrs("xf")>=5250 and objgbrs("qs")>=10500 and objgbrs("love")>=10500 then
Response.write "<br/><a href='/bbs/school/sxh.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-9 then
Response.write "曾读初三"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=9 and objgbrs("xf")>=0 then
Response.write "初三"
if objgbrs("nianji")=9 and objgbrs("xf")>=6250 and objgbrs("qs")>=12500 and objgbrs("love")>=12500 then
Response.write "<br/><a href='/bbs/school/sxi.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-10 then
Response.write "曾读高一"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=10 and objgbrs("xf")>=0 then
Response.write "高一"
if objgbrs("nianji")=10 and objgbrs("xf")>=7250 and objgbrs("qs")>=14500 and objgbrs("love")>=14500 then
Response.write "<br/><a href='/bbs/school/sxj.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-11 then
Response.write "曾读高二"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=11 and objgbrs("xf")>=0 then
Response.write "高二"
if objgbrs("nianji")=11 and objgbrs("xf")>=8250 and objgbrs("qs")>=16500 and objgbrs("love")>=16550 then
Response.write "<br/><a href='/bbs/school/sxk.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-12 then
Response.write "曾读高三"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=12 and objgbrs("xf")>=0 then
Response.write "高三"
if objgbrs("nianji")=12 and objgbrs("xf")>=9750 and objgbrs("qs")>=19500 and objgbrs("love")>=19500 then
Response.write "<br/><a href='/bbs/school/sxl.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-13 then
Response.write "曾读大一"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=13 and objgbrs("xf")>=0 then
Response.write "大一"
if objgbrs("nianji")=13 and objgbrs("xf")>=11250 and objgbrs("qs")>=22500 and objgbrs("love")>=22500 then
Response.write "<br/><a href='/bbs/school/sxm.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-14 then
Response.write "曾读大二"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=14 and objgbrs("xf")>=0 then
Response.write "大二"
if objgbrs("nianji")=14 and objgbrs("xf")>=12750 and objgbrs("qs")>=25500 and objgbrs("love")>=25500 then
Response.write "<br/><a href='/bbs/school/sxn.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-15 then
Response.write "曾读大三"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=15 and objgbrs("xf")>=0 then
Response.write "大三"
if objgbrs("nianji")=15 and objgbrs("xf")>=14250 and objgbrs("qs")>=28500 and objgbrs("love")>=28500 then
Response.write "<br/><a href='/bbs/school/sxo.asp?SessionID=" & SessionID & "'>+|我要升学</a>"
end if
end if
if objgbrs("xf")=-16 then
Response.write "曾读大四"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|重返校园</a>"
end if
if objgbrs("nianji")=16 and objgbrs("xf")>=0 then
Response.write "大四"
if objgbrs("nianji")=16 and objgbrs("xf")>=20000 and objgbrs("qs")>=40000 and objgbrs("love")>=40000 then
Response.write "<br/><a href='/bbs/school/sxp.asp?SessionID=" & SessionID & "'>+|升为硕士</a>"
end if
end if
if objgbrs("xf")=-17 then
Response.write "硕士生"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|继续进修</a>"
end if
if objgbrs("nianji")=17 and objgbrs("xf")>=0 then
Response.write "硕士"
if objgbrs("nianji")=17 and objgbrs("xf")>=30000 and objgbrs("qs")>=60000 and objgbrs("love")>=60000 then
Response.write "<br/><a href='/bbs/school/sxq.asp?SessionID=" & SessionID & "'>+|升为博士</a>"
end if
end if
if objgbrs("xf")=-18 then
Response.write "博士生"
Response.write "<br/><a href='/bbs/school/cd1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|继续进修</a>"
end if
if objgbrs("nianji")=18 and objgbrs("xf")>=0 then
Response.write "博士"
end if
if objgbrs("xf")=<0 then
Response.write "<br/>当前的学分:0"
end if
if objgbrs("xf")>0 then
Response.write "<br/>当前的学分:"&objgbrs("xf")&""
end if

if objgbrs("xf")>=0 and objgbrs("nianji")>0 then
Response.write "<br/><a href='/bbs/school/schoollist.asp?SessionID=" & SessionID & "'>+|我的学业</a>"
Response.write "<br/><a href='/bbs/school/daywork.asp?SessionID=" & SessionID & "'>+|今天课程</a>"
Response.write "<br/><a href='/bbs/school/schoolsame.asp?SessionID=" & SessionID & "'>+|在校学生</a>"
Response.write "<br/><a href='/bbs/school/same.asp?idn="&objgbrs("nianji")&"&amp;SessionID=" & SessionID & "'>+|同届学生</a>"
Response.write "<br/><a href='/bbs/school/ph.asp?SessionID=" & SessionID & "'>+|学校排行</a>"
Response.write "<br/><a href='/bbs/school/tx1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要退学</a>"
Response.write "<br/><a href='/bbs/school/schoollost.asp?SessionID=" & SessionID & "'>+|弃学学生</a>"
Response.write "<br/><a href='/bbs/txjl/index.asp?SessionID=" & SessionID & "'>+|闯关升级</a>"
Response.write "<br/><a href='/bbs/school/labor.asp?SessionID=" & SessionID & "'>+|参与劳动</a>"
end if
Response.write "<br/>------------<br/><a href='/bbs/job.asp?SessionID=" & SessionID & "'>返回工作单位</a><br/>"
Response.write "<a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'>返回我的地盘</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>"%>
<%
response.write "<br/>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</p></card></wml>"
conn.close
set conn=nothing
%>
