<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%ForumID=request("ForumID")
SessionID=request.querystring("SessionID")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
rs.open rspl,conn,1,2
dlname=rs("name")
%>
<card id="main" title="<%=dlname%>-编辑版块" >
<p>
<%if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("Counter")="pass_numbers_55556666" then
if Session("Counter")="pass_numbers_55556666" then%>
版块图标:<input name='logo<%=minute(now)%><%=second(now)%>' title='版块图标' value='<%=rs("ltlogo")%>'/>可以留空<br/>
论坛名称:<input name='nam<%=minute(now)%><%=second(now)%>' title='论坛名称' value='<%=rs("name")%>'/>必须输入<br/>
论坛说明:<input name='txt<%=minute(now)%><%=second(now)%>' title='论坛说明' value='<%=rs("shuo")%>'/>可以留空<br/>
发贴限时:<input name='ftsj<%=minute(now)%><%=second(now)%>' title='发贴限时' value='<%=rs("ftsj")%>'/>必须输入<br/>
回复限时:<input name='hfsj<%=minute(now)%><%=second(now)%>' title='回复限时' value='<%=rs("hfsj")%>'/>必须输入<br/>
进入权限:<select name="jrqx<%=minute(now)%><%=second(now)%>" value="<%=rs("qx")%>">
<option value='0'>没有限制</option>
<option value='1'>只限会员</option>
<option value='2'>只限版主</option>
<option value='3'>需要积分</option>
</select><br/>
工作天数:<input name='gz<%=minute(now)%><%=second(now)%>' title='需要天数' format='*N' maxlength='10' value='<%=rs("gongzuo")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要魅力:<input name='ml<%=minute(now)%><%=second(now)%>' title='需要魅力' format='*N' maxlength='10' value='<%=rs("ml")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要体力:<input name='tl<%=minute(now)%><%=second(now)%>' title='需要体力' format='*N' maxlength='10' value='<%=rs("titi")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
需要金币:<input name='jb<%=minute(now)%><%=second(now)%>' title='需要金币' format='*N' maxlength='10' value='<%=rs("jin")%>' size='10' emptyok='false'/><b>进入权限</b>选<b>需要积分</b>时生效<br/>
内容后面:<select name='brr<%=minute(now)%><%=second(now)%>' value='<%=rs("brr")%>'>
<option value='1'>自动换行</option>
<option value='0'>不换行</option>
</select><br/>
显示顺序:<input name='idi<%=minute(now)%><%=second(now)%>' title='显示顺序' format='*N' maxlength='6' value='<%=rs("pid")%>' size='2' emptyok='false'/><br/>
公开方式:<select name='yc<%=minute(now)%><%=second(now)%>' value='<%=rs("yc")%>'>
<option value='0'>正常显示</option>
<option value='1'>隐藏显示</option>
</select><br/>
<anchor>[确定修改]<go href='yxxe_bbs_bkxg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=request("ForumID")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='logo' value='$(logo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='idi' value='$(idi<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ftsj' value='$(ftsj<%=minute(now)%><%=second(now)%>)'/>
<postfield name='hfsj' value='$(hfsj<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jrqx' value='$(jrqx<%=minute(now)%><%=second(now)%>)'/>
<postfield name='ml' value='$(ml<%=minute(now)%><%=second(now)%>)'/>
<postfield name='tl' value='$(tl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='jb' value='$(jb<%=minute(now)%><%=second(now)%>)'/>
<postfield name='gz' value='$(gz<%=minute(now)%><%=second(now)%>)'/>
<postfield name='yc' value='$(yc<%=minute(now)%><%=second(now)%>)'/>
<postfield name='brr' value='$(brr<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>
<%else%>
版块图标:<%=rs("ltlogo")%><br/>
版块说明:<%=rs("shuo")%><br/>
版块图标:<input name='logo<%=minute(now)%><%=second(now)%>' title='版块图标:' value='<%=rs("ltlogo")%>'/>可以留空<br/>
版块说明:<input name='txt<%=minute(now)%><%=second(now)%>' title='论坛说明:' value='<%=rs("shuo")%>'/>可以留空<br/>
<anchor>[确定修改]<go href='yxxe_bbs_bkxg2.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=request("ForumID")%>' method='post' accept-charset='utf-8'>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
<postfield name='logo' value='$(logo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("id")%>'/>
</go></anchor>
<%
end if
end if
    Response.Write "<br/>-------------<br/>"
Response.write "<a href='/BBS/Forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/ztlb.asp?SessionID=" & SessionID & "'>返回论坛主题</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"%>
