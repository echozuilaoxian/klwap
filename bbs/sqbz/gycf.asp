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
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-处罚条例">
<p align="left">
处罚条例<br/>
 <%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
-----------<br/>
社区首页会员若出现下列情况任意一种或几种，社区首页有权修改直至禁用其ID号； <br/>
一:<br/>
1）使用不雅或不恰当的昵称； <br/> 
2）在论坛上发表含有色情、人身攻击和反政府言论，足以影响移动城市声誉者. <br/>
二:<br/> 
1）凡文章出现以下情况之一，社区管理人员有权在不提前通知作者的情况下直接删除或者对其封锁部分权限、暂停其ID号；<br/> 
2）发现谩骂、包含人身攻击的文章；以及含有广告性质的文章；<br/> 
3）发表不符合版面主题，或者无内容的灌水文章；<br/> 
4）同一文章重复发表的；<br/> 
5）发表与版面主题没有关系的文章；<br/> 
6）文章内容含有色情、政治敏感话题，违反现行法律及移动城市有关规定的文章. <br/> 
三:<br/>
1)会员需尊重道德礼仪，遵守中华人民共和国各项法律法规； <br/> 
2)会员不得发表危害国家安全、泄露国家机密、损害国家利益、破坏民族团结、破坏国家宗教政策、破坏社会稳定、侮辱、诽谤、教唆等内容的言论. <br/> 
注:欢迎会员监督,举报有奖.最低奖1000金币.<br/> 
---------------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>返回上级</a><br/>  
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/>    
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>