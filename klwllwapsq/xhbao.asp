<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<card id="main" title="排版帮助" >
<p>



可以在后台的超级链接那链接上所有的地址.
<br/>
如:娱乐功能模块，论坛帖子…论坛版块…等等全部……
<br/>
在链接帖子或论坛地址的时候，
<br/>
地址中带有ForumID=数字，这个数字是id，
<br/>一定要将这个数字加上，不然无法链接到指定的地址，<br/>后面再加上<img src='1.gif' alt=''/>否则电脑op看会乱码
<br/>
如下面的这个地址:<br/>
/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=23<img src='1.gif' alt=''/><br/>
<img src='0.gif' alt=''/>
<br/>
这样就可以了
<br/>
注意:链接的时候，ForumID=数字<img src='1.gif' alt=''/>后面的不要填，
<br/>因为后面的是你自己的身份码
<br/>
以下部分常用功能的地址:
<br/>
------------
<br/>
/bbs/index.asp  社区首页<br/>
/bbs/ztlb.asp   论坛<br/>
/bbs/area.asp  帮派<br/>
/bbs/public/gygl.asp  地盘<br/>
/bbs/dhxh/index.asp   吹牛<br/>
/bbs/xhdj/index.asp   道具<br/>
/bbs/gogo/sqgg.asp   点击广告送币<br/>
/bbs/nbaxh/index.asp  球彩<br/>
/bbs/lbxh/index.asp   龙宝<br/>
/bbs/room/from.asp  聊天室<br/>
/bbs/JOB.asp   工作<br/>
/bbs/anther/gao.asp  日薪<br/>
/bbs/school/school.asp  上课<br/>
/bbs/wish/index.asp  许愿<br/>
/bbs/LHC/index.asp  博彩<br/>
/bbs/gp/index.asp   炒股<br/>
/bbs/jieh/index.asp  婚姻<br/>
/bbs/Reg/Dongf/index.asp  洞房<br/>
/bbs/Reg/Bank.asp   银行<br/>
/bbs/Function/Index.Asp  酒店<br/>
/bbs/Myalbum/Index.asp  相册<br/>
/bbs/SCYL.asp    赌场<br/>
/bbs/gift/gift.asp   超市<br/>
/bbs/dg/index.asp    打工<br/>
/BBS/xinz/index.asp  星座<br/>
/BBS/sqll/index.asp  巡逻<br/>
/bbs/shc/Index.asp   市场<br/>
/BBS/hk/Index0.asp   博客<br/>
/bbs/Reg/Dongf/Yiyindex.asp  医院<br/>
/bbs/yxxe/Index.asp  江湖<br/>
/bbs/tz/Index.asp  竞技<br/>
/bbs/shop/Index.asp  礼品<br/>
/bbs/ltfy/index.asp   法院<br/>
/bbs/Diary/index.asp  日记<br/>
/bbs/sqcp/sqcp.asp    彩票<br/>
/bbs/Reg/Dongf/Jcj/index.asp  警局<br/>
/bbs/Reg/Dongf/index.asp  洞房<br/>
/bbs/chan/xiaof.asp   消费<br/>
/bbs/Public/Xczu.asp   监狱<br/>
/bbs/hk/index.asp    博客<br/>
/bbs/sqll/index.asp   巡逻<br/>
/bbs/shc/index.asp   市场<br/>
/bbs/advm.asp  广告<br/>
/bbs/public/find.asp  交友<br/>
/bbs/forum_content/Xcbgs.asp  政府<br/>
/bbs/sqbz/index.asp  新手帮助<br/>
/bbs/UseLogin.asp    重新登陆<br/>
/bbs/useTOP.asp    会员排行<br/>
/bbs/reg/ckzxhy.asp   在线人数<br/>



--------------<br/>
注意：本系统由狂龙网络xh6666.cn版权所有,<br/>终身维护升级,客户不得赠送和作为商用,<br/>不得私自将程序外泄，<br/>否则取消一切合作关系,并且追究其责任!<br/>技术支持QQ：762907090<br/>
<%
response.write("<a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a><br/>")
%>
</p>
</card>
</wml>