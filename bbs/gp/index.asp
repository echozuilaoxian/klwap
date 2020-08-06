<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="社区股票">
<p align="left">
<img src='gupiao.gif' alt='股票'/><br/>
股票与现实股市同步<br/>
=<a href='/bbs/gp/sm.asp?SessionID=<%=SessionID%>'>股票说明</a>|<a href='my.asp?SessionID=<%=SessionID%>'>我的股票</a>=
<br/>开市时间为9:30-15:00<br/>现在时间为：<%=time()%></p>

<p>序号|股票|代码<br/>
<%Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if

mon=request("mon")
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
    RecordCounts=RecordCount
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
 set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 1 baoch,usename,talk from gproom WHERE baoch='1' order by id desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
else
if objgbrs("baoch")=1 then
 Response.write "<a href='gpmms.asp?SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&":"&converttowidebaiti(objgbrs("talk")) & "</a><br/>"
end if
end if
sql="Delete FROM gproom WHERE baoch='1' and DATEDIFF('s', date, now()) > 180*60"
conn.Execute sql
if mon="" or mon="0" then
Response.write "1.<a href='guhq.asp?stockcode=600000&amp;SessionID=" & SessionID & "'>浦发银行</a>(600000)<br/>"
Response.write "2.<a href='guhq.asp?stockcode=600001&amp;SessionID=" & SessionID & "'>邯郸钢铁</a>(600001)<br/>"
Response.write "3.<a href='guhq.asp?stockcode=600008&amp;SessionID=" & SessionID & "'>首创股份</a>(600008)<br/>"
Response.write "4.<a href='guhq.asp?stockcode=600058&amp;SessionID=" & SessionID & "'>五矿发展</a>(600058)<br/>"
Response.write "5.<a href='guhq.asp?stockcode=600558&amp;SessionID=" & SessionID & "'>大西洋</a>(600558)<br/>"
Response.write "6.<a href='guhq.asp?stockcode=600684&amp;SessionID=" & SessionID & "'>珠江实业</a>(600684)<br/>"
Response.write "7.<a href='guhq.asp?stockcode=600354&amp;SessionID=" & SessionID & "'>敦煌种业</a>(600354)<br/>"
Response.write "8.<a href='guhq.asp?stockcode=600368&amp;SessionID=" & SessionID & "'>五洲交通</a>(600368)<br/>"
Response.write "9.<a href='guhq.asp?stockcode=600860&amp;SessionID=" & SessionID & "'>北人股份</a>(600860)<br/>"
Response.write "10.<a href='guhq.asp?stockcode=600241&amp;SessionID=" & SessionID & "'>辽宁时代</a>(600241)<br/>"
Response.write "1.<a href='index.asp?mon=1&amp;SessionID=" & SessionID & "'>2</a>.<a href='index.asp?mon=2&amp;SessionID=" & SessionID & "'>3</a>.<a href='index.asp?mon=3&amp;SessionID=" & SessionID & "'>4</a>.<a href='index.asp?mon=4&amp;SessionID=" & SessionID & "'>5</a>"
else 
if mon="1" then
Response.write "11.<a href='guhq.asp?stockcode=600298&amp;SessionID=" & SessionID & "'>安琪酵母</a>(600298)<br/>"
Response.write "12.<a href='guhq.asp?stockcode=600606&amp;SessionID=" & SessionID & "'>金丰投资</a>(600606)<br/>"
Response.write "13.<a href='guhq.asp?stockcode=600784&amp;SessionID=" & SessionID & "'>鲁银投资</a>(600784)<br/>"
Response.write "14.<a href='guhq.asp?stockcode=600884&amp;SessionID=" & SessionID & "'>杉杉股份</a>(600884)<br/>"
Response.write "15.<a href='guhq.asp?stockcode=600398&amp;SessionID=" & SessionID & "'>凯诺科技</a>(600398)<br/>"
Response.write "16.<a href='guhq.asp?stockcode=600965&amp;SessionID=" & SessionID & "'>福成五丰</a>(600965)<br/>"
Response.write "17.<a href='guhq.asp?stockcode=600088&amp;SessionID=" & SessionID & "'>中视传媒</a>(600088)<br/>"
Response.write "18.<a href='guhq.asp?stockcode=600066&amp;SessionID=" & SessionID & "'>宇通客车</a>(600066)<br/>"
Response.write "19.<a href='guhq.asp?stockcode=600870&amp;SessionID=" & SessionID & "'>厦华电子</a>(600870)<br/>"
Response.write "20.<a href='guhq.asp?stockcode=600821&amp;SessionID=" & SessionID & "'>津劝业</a>(600821)<br/>"

Response.write "<a href='index.asp?SessionID=" & SessionID & "'>1</a>.2.<a href='index.asp?mon=2&amp;SessionID=" & SessionID & "'>3</a>.<a href='index.asp?mon=3&amp;SessionID=" & SessionID & "'>4</a>.<a href='index.asp?mon=4&amp;SessionID=" & SessionID & "'>5</a>"
else 
if mon="2" then 
Response.write "21.<a href='guhq.asp?stockcode=600532&amp;SessionID=" & SessionID & "'>华阳科技</a>(600532)<br/>"
Response.write "22.<a href='guhq.asp?stockcode=600818&amp;SessionID=" & SessionID & "'>上海永久</a>(600818)<br/>"
Response.write "23.<a href='guhq.asp?stockcode=600888&amp;SessionID=" & SessionID & "'>新疆众和</a>(600888)<br/>"
Response.write "24.<a href='guhq.asp?stockcode=600502&amp;SessionID=" & SessionID & "'>安徽水利</a>(600502)<br/>"
Response.write "25.<a href='guhq.asp?stockcode=600520&amp;SessionID=" & SessionID & "'>三佳科技</a>(600520)<br/>"
Response.write "26.<a href='guhq.asp?stockcode=600387&amp;SessionID=" & SessionID & "'>海越股份</a>(600387)<br/>"
Response.write "27.<a href='guhq.asp?stockcode=600321&amp;SessionID=" & SessionID & "'>国栋建设</a>(600321)<br/>"
Response.write "28.<a href='guhq.asp?stockcode=600123&amp;SessionID=" & SessionID & "'>兰花科创</a>(600123)<br/>"
Response.write "29.<a href='guhq.asp?stockcode=600636&amp;SessionID=" & SessionID & "'>三爱富</a>(600636)<br/>"
Response.write "30.<a href='guhq.asp?stockcode=600687&amp;SessionID=" & SessionID & "'>华盛达</a>(600687)<br/>"

Response.write "<a href='index.asp?SessionID=" & SessionID & "'>1</a>.<a href='index.asp?mon=1&amp;SessionID=" & SessionID & "'>2</a>.3.<a href='index.asp?mon=3&amp;SessionID=" & SessionID & "'>4</a>.<a href='index.asp?mon=4&amp;SessionID=" & SessionID & "'>5</a>"
else
if mon="3" then
Response.write "31.<a href='guhq.asp?stockcode=600748&amp;SessionID=" & SessionID & "'>上实发展</a>(600748)<br/>"
Response.write "32.<a href='guhq.asp?stockcode=600785&amp;SessionID=" & SessionID & "'>新华百货</a>(600785)<br/>"
Response.write "33.<a href='guhq.asp?stockcode=600289&amp;SessionID=" & SessionID & "'>亿阳信通</a>(600289)<br/>"
Response.write "34.<a href='guhq.asp?stockcode=600222&amp;SessionID=" & SessionID & "'>太龙药业</a>(600222)<br/>"
Response.write "35.<a href='guhq.asp?stockcode=600333&amp;SessionID=" & SessionID & "'>长春燃气</a>(600333)<br/>"
Response.write "36.<a href='guhq.asp?stockcode=600777&amp;SessionID=" & SessionID & "'>新潮实业</a>(600777)<br/>"
Response.write "37.<a href='guhq.asp?stockcode=600723&amp;SessionID=" & SessionID & "'>西单商场</a>(600723)<br/>"
Response.write "38.<a href='guhq.asp?stockcode=600838&amp;SessionID=" & SessionID & "'>上海九百</a>(600838)<br/>"
Response.write "39.<a href='guhq.asp?stockcode=600858&amp;SessionID=" & SessionID & "'>银座股份</a>(600858)<br/>"
Response.write "40.<a href='guhq.asp?stockcode=600459&amp;SessionID=" & SessionID & "'>贵研铂业</a>(600459)<br/>"

Response.write "<a href='index.asp?SessionID=" & SessionID & "'>1</a>.<a href='index.asp?mon=1&amp;SessionID=" & SessionID & "'>2</a>.<a href='index.asp?mon=2&amp;SessionID=" & SessionID & "'>3</a>.4.<a href='index.asp?mon=4&amp;SessionID=" & SessionID & "'>5</a>"
else
if mon="4" then
Response.write "没有了<br/>"
Response.write "<a href='index.asp?SessionID=" & SessionID & "'>1</a>.<a href='index.asp?mon=1&amp;SessionID=" & SessionID & "'>2</a>.<a href='index.asp?mon=2&amp;SessionID=" & SessionID & "'>3</a>.<a href='index.asp?mon=3&amp;SessionID=" & SessionID & "'>4</a>.5.共40支股票"
end if
end if
end if
end if
end if

Response.write "<br/><a href='so.asp?SessionID=" & SessionID & "'>购买其他股票</a><br/>--------------<br/><a href='gus.asp?SessionID=" & SessionID & "'>股神</a>|<a href='fb.asp?SessionID=" & SessionID & "'>发布消息</a><br/><a href='/bbs/reg/bank.asp?SessionID=" & SessionID & "'>银行</a>|<a href='gproom/chatroom.asp?SessionID=" & SessionID & "'>交流大厅</a><br/><a href='gpjyjl.asp?SessionID=" & SessionID & "'>卖出</a>|<a href='gpmjl.asp?SessionID=" & SessionID & "'>买入记录</a><br/>-------------<br/><a href='/bbs//public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>

