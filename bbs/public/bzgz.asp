<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card0" title="版主需知">
<p>
<%SessionID=request.querystring("SessionID")%>
<%
ky=request("ky")
if ky="1" then%>
<u>版主说明</u>
<br/>1.主版主：为一版之主，可以有多个，享有封ID、置顶、删贴、锁贴、加精权利，要求版主每天必须有1小时以上时间维护所负责的版面，水贴不能存在于版面12小时以上，对于5天以上无故不行使版主权力或不上线不能完成版主责任和义务的将自动撤职；每天工资1500金币,50点魅力和50点体力
<br/>2.副版主：协助主版工作，可以有多个，享有置顶、删贴、锁贴、加精权利，要求版主三天内必须上网处理版务，当版主离职时，副版主为第一继任者；每天工资1000金币,20点魅力和20点体力!
<%
elseif ky="2" then%>
<u>版主任命</u>
<br/>各版版主由站长或论坛总管任命，并接受总管领导，副版主由版主提名
<%
elseif ky="3" then%>

<u>日常维护</u>
<br/>版主要及时删除版内含有危害国家安全、破坏民族团结、破坏国家宗教政策、破坏社会稳定、侮辱、诽谤、教唆、淫秽、广告、暴力、虚假、以及和版面无关的水贴、标题重复贴等，维护版面的清洁
<%
elseif ky="4" then%>

<u>精华管理</u>
<br/>版主负责管理所在的版面的精华区，精华区是一个版面的门面，版主至少每周需整理精华区一次，并且有责任保证所负责版面的精华区内容为精华
<%
elseif ky="5" then%>

<u>删贴管理</u>
<br/>版主、副版主版主有删贴权利，在删除某会员的发贴时，应通过站内信息通知发贴者，陈述原因
<br/>一般包括论坛事务（站务与版务）、活动召集、有讨论价值的版面贴子，由于手机阅读的特殊性，置顶贴不得超过两个，一般置顶贴不得超过三天（除一些特殊公告或活动可长期置顶）；需保持置顶贴的新颖。

<%
elseif ky="6" then%>
<u>版主发贴</u>
<br/>版主的主要职责在于管理和引导，对版主的发贴量没有特别标准，但版主发贴应注意内容符合版的主题，内容健康；不得滥用加精功能和置顶功能，版主自己发贴置顶时间应尽量缩短

<%
elseif ky="7" then%>
<u>封ID管理</u>
<br/>每个版主有权在自己版内将友友的发贴和跟贴权限封杀和解封，封ID为最严重的处罚措施，不建议轻易使用
<%
elseif ky="8" then%>
<u>维持秩序</u>
<br/>若版面内有纠纷，版主应负起协调的工作，如果遇到已明显失去理性的争吵，版主必须主动出面协调，维护版内的正常秩序，版主应尽量保持中立的立场来协调各种争端，特别是对于一些比较有争议性的话题，更有注意不偏不倚，公正客观地来处理问题

<%
elseif ky="9" then%>
<u>在线要求</u>
<br/>版主每天必须有1小时以上时间维护所负责的版面，水贴不能存在于版面12小时以上，对于5天以上无故不行使版主权力或不上线不能完成版主责任和义务的将自动撤职(请假除外)

<%
elseif ky="10" then%>
<u>版主义务</u>
<br/>版主除遵守<%=converttowidebaiti(SystemSiteName)%>友友守则，有义务做好删除水贴，维护版面秩序等工作，同样，版主有责任和义务维护<%=converttowidebaiti(SystemSiteName)%>的公众形象；版主禁止在公开场合发表不利于<%=converttowidebaiti(SystemSiteName)%>的讨论，不得与普通友友起哄闹事
<%
elseif ky="11" then%>
<u>申版要求</u>
<br/>1.申请版主可在社区站务发帖申请，也可发信给站长或社区总管.
<br/>2.申请版主及当版主需要对该版有一定的认识或经验,要有相当的时间管理本版,要有责任心,以身作职,积极发表佳作,并引导会员参与讨论,努力宣传本版增加人气！
<br/>3.版主需具有强烈的亲和力,能善待会员,能主动调解版内纠纷,合理运用删贴.置顶帖,转移帖权限维持本版秩序,建立温情温馨的版内气氛！
<%else%>版主需知<br/>-------------
<br/><a href="/bbs/public/bzgz.asp?ky=11&amp;SessionID=<%=SessionID%>">申版要求</a>
<br/><a href="/bbs/public/bzgz.asp?ky=1&amp;SessionID=<%=SessionID%>">版主说明</a>
<br/><a href="/bbs/public/bzgz.asp?ky=2&amp;SessionID=<%=SessionID%>">版主任命</a>
<br/><a href="/bbs/public/bzgz.asp?ky=3&amp;SessionID=<%=SessionID%>">日常维护</a>
<br/><a href="/bbs/public/bzgz.asp?ky=4&amp;SessionID=<%=SessionID%>">精华管理</a>
<br/><a href="/bbs/public/bzgz.asp?ky=5&amp;SessionID=<%=SessionID%>">删贴管理</a>
<br/><a href="/bbs/public/bzgz.asp?ky=6&amp;SessionID=<%=SessionID%>">版主发贴</a>
<br/><a href="/bbs/public/bzgz.asp?ky=7&amp;SessionID=<%=SessionID%>">封ID管理</a>
<br/><a href="/bbs/public/bzgz.asp?ky=8&amp;SessionID=<%=SessionID%>">维持秩序</a>
<br/><a href="/bbs/public/bzgz.asp?ky=9&amp;SessionID=<%=SessionID%>">在线要求</a>
<br/><a href="/bbs/public/bzgz.asp?ky=10&amp;SessionID=<%=SessionID%>">版主义务</a>
<%End if%>
<br/>-------------
<%
if ky<>"" then%>
<br/><a href='/bbs/public/bzgz.asp?SessionID=<%=SessionID%>'>返回版主规则</a>
<%End if%>
<br/><a href='/bbs/ztlb.asp?SessionID=<%=SessionID%>'>返回论坛中心</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml><%
conn.close
set objgbrs=nothing
set conn=nothing%>