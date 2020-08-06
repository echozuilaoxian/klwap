<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<card id="main" title="商店回收瓜果" >
<p>

<%
dim ky,kyzc
  kid=request.querystring("kid")
SID=request.querystring("SID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & id & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
Action=request.querystring("Action")
iduse=Session("useid")
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from huakl where ids=" & iduse & ""
       rs8.open ssql,conn,1,1
if rs8.eof then
 Error("你还没有果园！")
end if
Response.write "<img src='img/logo.gif' alt=''/><br/>系统商店/<a href='zhong_m.asp?SessionID=" & SessionID & "'>种子公司</a>"
 if Action="" or Action<>"save" then
Response.write "<br/>你共收获("&rs8("hongs")+rs8("huangs")+rs8("zis")+rs8("yis")+rs8("hmus")+rs8("kangs")+rs8("mans")+rs8("tians")+rs8("zmus")+rs8("qangs")+rs8("qians")+rs8("pus")&")瓜果<br/>"
%>
选择种类:<select name='kid' value='选择种类'>
<option value='1'>桃子</option>
<option value='2'>雪梨</option>
<option value='3'>樱桃</option>
<option value='4'>杨梅</option>
<option value='5'>芒果</option>
<option value='6'>草莓</option>
<option value='7'>香蕉</option>
<option value='8'>菠萝</option>
<option value='9'>西瓜</option>
<option value='10'>橙子</option>
<option value='11'>苹果</option>
<option value='12'>葡萄</option>
</select><br/>
数量:<input name="dlmm" title="数量" type="text" format="*N" emptyok="true" maxlength="30" value=""/><br/>
<anchor>确定卖出
    <go href="xtsd.asp?Action=save&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
         <postfield name="dlmm" value="$(dlmm)"/>
		<postfield name="kid" value="$(kid)"/>
        </go></anchor><br/>
<%
response.write "本店回收各类瓜果，价格合理。<br/><img src='img/1.gif' alt='.'/>桃子("&rs8("hongs")&")售价:800金币<br/>"
response.write "<img src='img/2.gif' alt='.'/>雪梨("&rs8("hmus")&")售价:800金币<br/>"
response.write "<img src='img/3.gif' alt='.'/>樱桃("&rs8("huangs")&")售价:800金币<br/>"
response.write "<img src='img/4.gif' alt='.'/>杨梅("&rs8("kangs")&")售价:900金币<br/><img src='img/5.gif' alt='.'/>芒果("&rs8("mans")&")售价:900金币<br/>"
response.write "<img src='img/6.gif' alt='.'/>草莓("&rs8("zis")&")售价:900金币<br/>"
response.write "<img src='img/7.gif' alt='.'/>香蕉("&rs8("tians")&")售价:1000金币<br/>"
response.write "<img src='img/8.gif' alt='.'/>菠萝("&rs8("zmus")&")售价:1000金币<br/><img src='img/9.gif' alt='.'/>西瓜("&rs8("yis")&")售价:1000金币<br/>"
response.write "<img src='img/10.gif' alt='.'/>橙子("&rs8("qangs")&")售价:1200金币<br/>"
response.write "<img src='img/11.gif' alt='.'/>苹果("&rs8("qians")&")售价:1200金币<br/>"
response.write "<img src='img/12.gif' alt='.'/>葡萄("&rs8("pus")&")售价:1200金币<br/>------------<br/>"
%>
<%else

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kid=" & kid & ""
End if
kid=clng(request("kid"))
dlmm=clng(request("dlmm"))
if   kid=""  or dlmm="" or Isnumeric(dlmm)=False  or Isnumeric(kid)=False  or dlmm<=0 or kid<=0  or dlmm>999999999 or kid>12    then
  Error("<br/>数字无效！")
  end if
if kid=1 then 
kkb=rs8("hongs")
 huaa="hongs" 
jia="800" 
voteID="1"
elseif kid=2 then 
kkb=rs8("hmus")
huaa="hmus"
jia="800"
voteID="2"
elseif kid=3 then 
kkb=rs8("huangs")
huaa="huangs"
 jia="800"
voteID="3"
elseif kid=4 then 
kkb=rs8("kangs")
huaa="kangs"
 jia="900"
voteID="4"
elseif kid=5 then 
kkb=rs8("mans")
huaa="mans"
 jia="900"
voteID="5"
elseif kid=6 then 
kkb=rs8("zis")
huaa="zis"
 jia="900"
voteID="6"
elseif kid=7 then 
kkb=rs8("tians")
 huaa="tians"
 jia="1000"
voteID="7"
elseif kid=8 then 
kkb=rs8("zmus")
 huaa="zmus" 
jia="1000"
voteID="8" 
elseif kid=9 then 
kkb=rs8("yis")
huaa="yis"
jia="1000"
voteID="9"
elseif kid=10 then 
kkb=rs8("qangs")
huaa="qangs"
 jia="1200"
voteID="10"
elseif kid=11 then 
kkb=rs8("qians")
huaa="qians"
 jia="1200"
voteID="11"
elseif kid=12 then 
kkb=rs8("pus")
huaa="pus"
 jia="1200"
voteID="12"
end if
if clng(dlmm)>clng(kkb) then
Error("<br/>你的瓜果没有这么多...不能卖出")
  end if
jbjia=jia*dlmm
sql="update huakl set "&huaa&"="&huaa&"-"&dlmm&"  where ids=" &iduse& "" 				
                conn.execute sql
sql="update usereg set  usejf=usejf+"&jbjia&"  where id=" &iduse& "" 				
                conn.execute sql
dim talk
talk="" & Session("ltname") & "在(url=/bbs/long/xthd.Asp)果园商店(/url)卖出了"&dlmm&"(img)/bbs/long/img/" &voteID& ".gif(/img)赚了"&jbjia&"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock

%>
<br/>----------<br/>成功卖了<%=dlmm%><img src='/bbs/long/img/<%=voteID%>.gif' alt=''/>,共获得<%=jbjia%>金币<br/>
<% end if%>
<a href='/bbs/long/index.asp?SessionID=<%=SessionID%>'>返回开心果园</a><br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回家园中心</a><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%  rs8.Close
	Set rs8=Nothing
conn.close
set conn=nothing%>