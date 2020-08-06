<% Response.ContentType="text/vnd.wap.wml" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->  
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-权限说明">
<p align="left">
权限说明<br/> 
----------<br/> <%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
一：<b><u>站长</u></b>全权负责.其中包括:<br/>  
1.任命版主,任命总管,任命巡查,免职版主. <br/> 
2.申请论坛活动经费. <br/> 
3.故意捣乱者需要封号的(需认真调查后进行). <br/> 
4.凡与论坛相关的事务一切由其全权负责. <br/> 

二：<b><u>社区总管 </u></b>拥有以下权限: <br/> 
1.任免主版，副版. <br/> 
2.可在任何版块进行删贴,加精...等操作. <br/> 

三：<b><u>社区法官 </u></b>拥有以下权限: <br/> 
1.可在任何版块进行删贴,加精...等操作. <br/> 
2.社区所有纠纷案件全权由法官负责<br/>
可以管理社区法院所有案件的权限，<br/>
包括审理案件，删除案件，执行判决...等操作.<br/>

四：<b><u>论坛彩管 </u></b>拥有以下权限: <br/> 
1.可在任何版块进行删贴,加精...等操作. <br/> 
2.全权负责六合虚拟博彩的开奖等管理操作.<br/>

五：<b><u>论坛巡查 </u></b>拥有以下权限: <br/> 
1.可在任何版块进行删贴,加精...等操作. <br/> 

六：<b><u>论坛版主及副版主 </u></b>相关权限请看<a href='/bbs/public/bzgz.asp?SessionID=<%=SessionID%>'>版主规范</a><br/> 

七：<b><u>vip会员</u></b>拥有以下权限<br/>1.可以任意修改昵称等资料，<br/>不再受注册天数大于三天就不能修改昵称的限制，<br/>2.自定义社区秀将是vip会员的特权，普通会员不能自定义社区秀，<br/>3.vip会员每天可以额外再领取500金币日薪和三倍的魅力与体力等属性，<br/>4.vip会员在查看社区帖子时可以行驶vip特权管理该帖子，<br/>有着锁定与固底帖子并有着删除回复的特权，<br/>5.可以群发消息给所有在线会员<br/>---------------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>返回上级</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/>    
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>