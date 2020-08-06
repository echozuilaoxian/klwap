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
<card id="main" title="狂野娱乐圈">
<p align="left">
你好,
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a>"
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
%>
<br/>---------
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,zhiye,tianshu,tili,ml,caihua,zhili,xf,xl,id from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("gongzuo")<>2 then
  response.Write "<br/>你不是在本娱乐圈工作!因此不能计算升级的属性值!"
  end if
  if  objgbrs("gongzuo")=2 then
  response.Write "<br/>注:如果所需要属性是负数或着0,那该属性已经符合要求了!"
  if objgbrs("zhiye")=11 then
Response.write "<br/>第1级:侍者"
Response.write "<br/>发工资:1000金币<br/>加体力:10<br/>加魅力:10<br/>加智力:10<br/>加才华:10<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：7天[欠"&(7-objgbrs("tianshu"))&"天]<br/>体力:100[欠"&(100-objgbrs("tili"))&"]<br/>魅力:5000[欠"&(5000-objgbrs("ml"))&"]<br/>智力:5000[欠"&(5000-objgbrs("zhili"))&"]<br/>才华:5000[欠"&(5000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=12 then
Response.write "<br/>第2级:群众演员"
Response.write "<br/>发工资:2000金币<br/>加体力:20<br/>加魅力:20<br/>加智力:20<br/>加才华:20<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：14天[欠"&(14-objgbrs("tianshu"))&"天]<br/>体力:200[欠"&(200-objgbrs("tili"))&"]<br/>魅力:10000[欠"&(10000-objgbrs("ml"))&"]<br/>智力:10000[欠"&(10000-objgbrs("zhili"))&"]<br/>才华:10000[欠"&(10000-objgbrs("caihua"))&"]<br/>学历:小学<br/>"
end if
  if objgbrs("zhiye")=13 then
Response.write "<br/>第3级:跑龙套演员"
Response.write "<br/>发工资:3000金币<br/>加体力:30<br/>加魅力:30<br/>加智力:30<br/>加才华:30<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：30天[欠"&(30-objgbrs("tianshu"))&"天]<br/>体力:300[欠"&(300-objgbrs("tili"))&"]<br/>魅力:25000[欠"&(25000-objgbrs("ml"))&"]<br/>智力:25000[欠"&(25000-objgbrs("zhili"))&"]<br/>才华:25000[欠"&(25000-objgbrs("caihua"))&"]<br/>学历:高中<br/>"
end if
  if objgbrs("zhiye")=14 then
Response.write "<br/>第4级:主角替身"
Response.write "<br/>发工资:4000金币<br/>加体力:40<br/>加魅力:40<br/>加智力:40<br/>加才华:40<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：50天[欠"&(50-objgbrs("tianshu"))&"天]<br/>体力:400[欠"&(400-objgbrs("tili"))&"]<br/>魅力:40000[欠"&(40000-objgbrs("ml"))&"]<br/>智力:40000[欠"&(40000-objgbrs("zhili"))&"]<br/>才华:40000[欠"&(40000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=15 then
Response.write "<br/>第5级:新人影星"
Response.write "<br/>发工资:5000金币<br/>加体力:50<br/>加魅力:50<br/>加智力:50<br/>加才华:50<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：80天[欠"&(80-objgbrs("tianshu"))&"天]<br/>体力:500[欠"&(500-objgbrs("tili"))&"]<br/>魅力:70000[欠"&(70000-objgbrs("ml"))&"]<br/>智力:70000[欠"&(70000-objgbrs("zhili"))&"]<br/>才华:70000[欠"&(70000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=16 then
Response.write "<br/>第6级:一般影星"
Response.write "<br/>发工资:6000金币<br/>加体力:60<br/>加魅力:60<br/>加智力:60<br/>加才华:60<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：120天[欠"&(120-objgbrs("tianshu"))&"天]<br/>体力:600[欠"&(600-objgbrs("tili"))&"]<br/>魅力:100000[欠"&(100000-objgbrs("ml"))&"]<br/>智力:100000[欠"&(100000-objgbrs("zhili"))&"]<br/>才华:100000[欠"&(100000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=17 then
Response.write "<br/>第7级:电视名星"
Response.write "<br/>发工资:7000金币<br/>加体力:70<br/>加魅力:70<br/>加智力:70<br/>加才华:70<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：160天[欠"&(160-objgbrs("tianshu"))&"天]<br/>体力:700[欠"&(700-objgbrs("tili"))&"]<br/>魅力:150000[欠"&(150000-objgbrs("ml"))&"]<br/>智力:150000[欠"&(0-objgbrs("zhili"))&"]<br/>才华:150000[欠"&(150000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=18 then
Response.write "<br/>第8级:影视大腕"
Response.write "<br/>发工资:8000金币<br/>加体力:80<br/>加魅力:80<br/>加智力:80<br/>加才华:80<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：200天[欠"&(200-objgbrs("tianshu"))&"天]<br/>体力:800[欠"&(800-objgbrs("tili"))&"]<br/>魅力:220000[欠"&(220000-objgbrs("ml"))&"]<br/>智力:220000[欠"&(220000-objgbrs("zhili"))&"]<br/>才华:220000[欠"&(220000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=19 then
Response.write "<br/>第9级:演艺明星"
Response.write "<br/>发工资:9000金币<br/>加体力:90<br/>加魅力:90<br/>加智力:90<br/>加才华:90<br/>"
Response.write "--------<br/>下级所需要属性<br/>需要工作：300天[欠"&(300-objgbrs("tianshu"))&"天]<br/>体力:900[欠"&(900-objgbrs("tili"))&"]<br/>魅力:350000[欠"&(350000-objgbrs("ml"))&"]<br/>智力:350000[欠"&(350000-objgbrs("zhili"))&"]<br/>才华:350000[欠"&(350000-objgbrs("caihua"))&"]<br/>学历:无<br/>"
end if
  if objgbrs("zhiye")=20 then
Response.write "<br/>第10级:超级巨星"
Response.write "<br/>发工资:10000金币<br/>加体力:100<br/>加魅力:100<br/>加智力:100<br/>加才华:100<br/>"
end if
end if

Response.write "-------------<br/><a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>