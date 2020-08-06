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
<card id="index" title="<%=converttowidebaiti(SystemSiteName)%>-新手帮助">
<p align="left">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<a href="/bbs/sqbz/xrbd.asp?SessionID=<%=SessionID%>">新人必读</a><br/>
<a href="/bbs/sqbz/gycf.asp?SessionID=<%=SessionID%>">关于处罚</a><br/>
<a href="/bbs/sqbz/tzglgf.asp?SessionID=<%=SessionID%>">帖子规范</a><br/>
<a href="/bbs/sqbz/mzsm.asp?SessionID=<%=SessionID%>">免责声明</a><br/>
<a href="/bbs/sqbz/scgf.asp?SessionID=<%=SessionID%>">社区规范</a><br/>
<a href="/bbs/sqbz/gyqx.asp?SessionID=<%=SessionID%>">关于权限</a><br/>
<a href="/bbs/sqbz/ftbz.asp?SessionID=<%=SessionID%>">发帖帮助</a><br/>
<a href="/bbs/sqbz/gyjy.asp?SessionID=<%=SessionID%>">关于经验</a><br/>
<a href="/bbs/sqbz/gyst.asp?SessionID=<%=SessionID%>">关于申团</a><br/>
<a href="/bbs/sqbz/gylt.asp?SessionID=<%=SessionID%>">关于申请论坛</a><br/>

--------------<br/> 
如果您的手机支持cookies,就不存在掉线或者功能无法用的的问题，您必须设置好您的手机，<br/> 

诺基亚设置如下：功能表＞服务＞设置＞保密设置＞允许接收缓存数据。

设置好以后进入网站首页重新登陆一次后再看看session有没有丢失。
如果有，可以把安全设置里设为关。手机支持cookies的，请设为允许。支持缓存的也设为允许。

金币说明><br/> 
一,社区用户每访问社区一次奖金币1个，每发表一帖奖金币50个，回复文章奖金币10个(字数大于5个字)，文章入精奖金币200个(系统自动操作)！<br/>  
二,文章被删除减金币100个，回复被删除减金币10个，文章解除精华减金币200元，恶意捣乱者会由管理员扣除该会员所有金币的一半!情节严重:禁言,禁帖,封号等处罚! <br/> 
三、金币的用处:可以买房,买车,买宠物.然后结婚(结婚需要有房才能结).可以开聊天室和朋友们一起聊天.可以买文章.到赌场豪赌等等...<br/> 
---------------<br/>
<anchor>返回上级<prev/></anchor><br/>    
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'><%=converttowidebaiti(SystemSiteName)%></a><br/> 
<a href='/index.asp?SessionID=<%=SessionID%>'>网站首页</a>
</p>
</card>
</wml>