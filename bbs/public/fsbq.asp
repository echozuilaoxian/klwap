<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml><head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发送表情信息">
<p align="left">

<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起!您的发信权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='f'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>500 and Session("ltglzdl")="" then
   Response.write "您好，您保留的旧信息超过了500条,暂时不能发信或回复,请删除一些没用的留言！"
   Response.write "<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='srxx.asp?SessionID=" & SessionID& "'>我的信箱</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a></p></card></wml>"
objgbrr.close
conn2.close
set objgbrr=nothing
set conn2=nothing
   response.end
End if
lasttlls="167"
lasttls
dim ids,name
ids=request("ids")
tjhm=ids
Response.write "给(" & converttowide(redtjname) & "ID:" & ids & ")发表情信:"
objgbrr.close
conn.close
set objgbrr=nothing
set conn=nothing
%>
<br/>选择表情1:
<br/><select name="ltlyuan" value="01">
<option value="01">哦</option>
<option value="02">害怕</option>
<option value="03">汗</option>
<option value="04">发火</option>
<option value="05">鬼脸</option>
<option value="06">奸笑</option>
<option value="07">眨眼</option>
<option value="08">委屈</option>
<option value="09">气</option>
<option value="10">吐</option>
<option value="13">喜欢</option>
<option value="14">偷笑</option>
<option value="15">不好意思</option>
<option value="16">白眼</option>
<option value="17">撇嘴</option>
<option value="18">露舌</option>
<option value="19">困</option>
<option value="20">发抖</option>
</select>
<br/><anchor>发 送<go method="post" href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="!$(ltlyuan)!"/>
<%
Response.write "<postfield name='ids' value='" & ids & "'/>"
%>
</go></anchor>
<br/>选择表情2:
<br/><select name="ltlyuan" value="21">
<option value="21">狂笑</option>
<option value="22">恩</option>
<option value="23">叼烟</option>
<option value="24">郁闷</option>
<option value="25">努力</option>
<option value="26">大骂</option>
<option value="27">疑惑</option>
<option value="28">嘘</option>
<option value="29">晕</option>
<option value="30">消失</option>
<option value="31">炸黑了脸</option>
<option value="32">骷髅</option>
<option value="33">敲</option>
<option value="34">拜拜</option>
<option value="35">得意</option>
<option value="36">我走了</option>
<option value="37">跌坐在地</option>
<option value="38">爱情</option>
<option value="39">开心</option>
<option value="40">吹泡泡</option>
</select>
<br/><anchor>发 送<go method="post" href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="!$(ltlyuan)!"/>
<%
Response.write "<postfield name='ids' value='" & ids & "'/>"
%>
</go></anchor>
<br/>选择表情3:
<br/><select name="ltlyuan" value="41">
<option value="41">女</option>
<option value="42">猪头</option>
<option value="43">猫头</option>
<option value="44">狗头</option>
<option value="45">娃娃</option>
<option value="46">大哭</option>
<option value="47">金钱</option>
<option value="48">灯泡</option>
<option value="49">请茶</option>
<option value="50">生日蛋糕</option>
</select>
<br/><anchor>发 送<go method="post" href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="!$(ltlyuan)!"/>
<%
Response.write "<postfield name='ids' value='" & ids & "'/>"
%>
</go></anchor>
<% 
Response.write "<br/><a href='/bbs/reg/useinfo.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>查看资料</a>"
 Response.write "<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a>"
 Response.write "<br/><a href='srxx.asp?SessionID=" & SessionID & "'>私人信箱</a>"
Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a>"%><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
<br/>时间:<%=time%>
</p></card></wml>



