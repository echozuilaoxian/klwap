<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<% if Session("useid")="1" or Session("useid")="2" then %>
<% SessionID=request.querystring("SessionID") %>
<wml>
<card id="card1" title="管理会员">
<p>管理会员<br/>注意：<u>修改会员手机号必须用11位数的手机号</u>!<br/>--------------<br/>
选择:<select name="select" value="1">
<option value="01">选择属性</option>
<option value="02">会员金币</option>
<option value="03">会员昵称</option>
<option value="04">会员简介</option>
<option value="05">改手机号</option>
<option value="08">修改登陆</option>
<option value="09">修改密码</option>
<option value="010">修改发帖</option>
<option value="011">修改魅力</option>
<option value="012">修改体力</option>
<option value="013">注册时间</option>
<option value="020">修改城市</option>
<option value="021">聊室积分</option>
<option value="06">婚姻管理</option>
<option value="014">修改BB姓名</option>
<option value="015">孩子管理</option>
<option value="016">修改怀孕期</option>
<option value="017">修改生日[年]</option>
<option value="018">修改生日[月]</option>
<option value="019">修改生日[日]</option>
<option value="0100">修改个人股票</option>
<option value="0101">修改股票实际数量</option>
<option value="0102">修改前台购买勋章</option>
</select>
<br/>ID:<input type='text' format="*N" name='id' maxlength="10" size='6'/>
<br/>内容:<input type='text' name='keyword' size='6'/>
<br/><anchor>提 交<go method='post' href='wap1.asp?SessionID=<%=SessionID%>'>
<postfield name='id' value='$(id)'/>
<postfield name='select' value='$(select)'/>
<postfield name='keyword' value='$(keyword)'/></go></anchor>
<br/>--------------
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>管理前台勋章中，所修改的勋章内容一定要是!111!或者!333!文本格式，可以挨着连续输入多个，如果要清空所有购买勋章请输入一个空格，十个勋章所显示的格式依次为<br/>!111! !222! !333! !444! !555! !666! !777! !888! !999! !1000!<br/>管理配偶中，输入0为单身贵族，输入ID号即为配偶；管理房间中,0为打开房间,1为关闭房间!
</p>
</card>
</wml>
<% end if %>





