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
<card id="main" title="工作岗位详情">
<p align="left">
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
n=request("n")
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
%>
<%
if n=1 then
Response.write "收发室职员-级别属性<br/>---------"
Response.write "<br/>职位等级:1<br/>发工资:1000金币<br/>加体力:10<br/>加魅力:10<br/>加智力:10<br/>加才华:10"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作：7天<br/>体力:100<br/>魅力:5000<br/>智力:5000<br/>才华:5000<br/>学历:无"
end if
if n=2 then
Response.write "行政助理-级别属性<br/>---------"
Response.write "<br/>职位等级:2<br/>发工资:2000金币<br/>加体力:20<br/>加魅力:20<br/>加智力:20<br/>加才华:20"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作：14天<br/>体力:200<br/>魅力:10000<br/>智力:10000<br/>才华:10000<br/>学历:小学"
end if
if n=3 then
Response.write "区域推销员-级别属性<br/>---------"
Response.write "<br/>职位等级:3<br/>发工资:3000金币<br/>加体力:30<br/>加魅力:30<br/>加智力:30<br/>加才华:30"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:30天<br/>体力:300<br/>魅力:25000<br/>智力:25000<br/>才华:25000<br/>学历:初中"
end if
if n=4 then
Response.write "低级主管-级别属性<br/>---------"
Response.write "<br/>职位等级:4<br/>发工资:4000金币<br/>加体力:40<br/>加魅力:40<br/>加智力:40<br/>加才华:40"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:50天<br/>体力:400<br/>魅力:40000<br/>智力:40000<br/>才华:40000<br/>学历:高中"
end if
if n=5 then
Response.write "项目经理-级别属性<br/>---------"
Response.write "<br/>职位等级:5<br/>发工资:5000金币<br/>加体力:50<br/>加魅力:50<br/>加智力:50<br/>加才华:50"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:80天<br/>体力:500<br/>魅力:70000<br/>智力:70000<br/>才华:70000<br/>学历:大学"
end if
if n=6 then
Response.write "高级经理-级别属性<br/>---------"
Response.write "<br/>职位等级:6<br/>发工资:6000金币<br/>加体力:60<br/>加魅力:60<br/>加智力:60<br/>加才华:60"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:120天<br/>体力:600<br/>魅力:100000<br/>智力:100000<br/>才华:100000<br/>学历:大学"
end if
if n=7 then
Response.write "业务总监-级别属性<br/>---------"
Response.write "<br/>职位等级:7<br/>发工资:7000金币<br/>加体力:70<br/>加魅力:70<br/>加智力:70<br/>加才华:70"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:160天<br/>体力:700<br/>魅力:150000<br/>智力:150000<br/>才华:150000<br/>学历:硕士"
end if
if n=8 then
Response.write "副总裁-级别属性<br/>---------"
Response.write "<br/>职位等级:8<br/>发工资:8000金币<br/>加体力:80<br/>加魅力:80<br/>加智力:80<br/>加才华:80"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:200天<br/>体力:800<br/>魅力:220000<br/>智力:220000<br/>才华:220000<br/>学历:硕士"
end if
if n=9 then
Response.write "首席执行官-级别属性<br/>---------"
Response.write "<br/>职位等级:9<br/>发工资:9000金币<br/>加体力:90<br/>加魅力:90<br/>加智力:90<br/>加才华:90"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>需要工作:300天<br/>体力:900<br/>魅力:350000<br/>智力:350000<br/>才华:350000<br/>学历:博士"
end if
if n=10 then
Response.write "商业大亨-级别属性<br/>---------"
Response.write "<br/>职位等级:10<br/>发工资:10000金币<br/>加体力:100<br/>加魅力:100<br/>加智力:100<br/>加才华:100"
Response.write "<br/>--------<br/>升级所需要属性"
Response.write "<br/>当前工作单位最高级!!"
end if
Response.write "<br/>-------------<br/><a href='/bbs/job/sylist.asp?SessionID="&SessionID&"'>其它职业属性</a><br/><a href='/bbs/job/sy.asp?SessionID="&SessionID&"'>返回商场广场</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>