
<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=525
lasttls
%>
<card id="hotpk" title="收获瓜果"  ontimer='index.asp?SessionID=<%=SessionID%>'><timer value='50'/><p>

<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from huakl where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bd=&amp;"
End if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>我的果园</a>>>>收获瓜果<br/><img src='img/logo.gif' alt=''/><br/>"
if rs8("nong")="m" then
Response.write "<br/><a href='nong.asp?SessionID="&SessionID&"'>你的果园还没有认证</a><br/>"
else
%>

<%
end if
if rs8("hongz")=0 then 
Response.write "果园还没有播种呀！<br/><a href='index.asp?SessionID="&SessionID&"'>返回我的果园</a></p></card></wml>"
response.end
end if

if rs8("hongz")=0 then 
Response.write "农场还没有播种呀！<br/><a href='index.asp?SessionID="&SessionID&"'>返回我的果园</a></p></card></wml>"
response.end
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2 then
if rs8("hongz")=1 then huaa="hongs"
if rs8("hongz")=2 then huaa="hmus"
if rs8("hongz")=3 then huaa="huangs"
if rs8("hongz")=4 then huaa="kangs"
if rs8("hongz")=5 then huaa="mans"
if rs8("hongz")=6 then huaa="zis"
if rs8("hongz")=7 then huaa="tians"
if rs8("hongz")=8 then huaa="zmus"
if rs8("hongz")=9 then huaa="yis"
if rs8("hongz")=10 then huaa="qangs"
if rs8("hongz")=11 then huaa="qians"
if rs8("hongz")=12 then huaa="pus"
dim suiji(10)
        suiji(0)="1"
	suiji(1)="1"
	suiji(2)="2"
	suiji(3)="2"
	suiji(4)="3"
	suiji(5)="1"
	suiji(6)="2"
	suiji(7)="2"
	suiji(8)="1"
	suiji(9)="4"
	suiji(10)="2"
	Randomize
	I=Int(Rnd()*10)
	huaas=suiji(I)
if huaas=0 or huaas="" then huaas=1
sql="update huakl set "&huaa&"="&huaa&"+"&huaas&",hongz=0,huas=0,huax=0,huaxx=0,huaxxx=0,hongdj=0  where CStr(ids)='" &iduse& "'" 				
                conn.execute sql

Response.write "你收获了"&huaas&"成熟瓜果<br/>"
response.write "<br/><img src='img/1.gif' alt='.'/>桃子种子:"&rs8("hong")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='1'/><postfield name='name' value='hong'/></go></anchor>"
response.write "|<img src='img/2.gif' alt='.'/>雪梨种子:"&rs8("hmu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='2'/><postfield name='name' value='hmu'/></go></anchor>"
response.write "<br/><img src='img/3.gif' alt='.'/>樱桃种子:"&rs8("huang")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='3'/><postfield name='name' value='huang'/></go></anchor>"
response.write "|<img src='img/4.gif' alt='.'/>杨梅种子:"&rs8("kang")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='4'/><postfield name='name' value='kang'/></go></anchor>"
response.write "<br/><img src='img/5.gif' alt='.'/>芒果种子:"&rs8("man")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='5'/><postfield name='name' value='man'/></go></anchor>"
response.write "|<img src='img/6.gif' alt='.'/>草莓种子:"&rs8("zi")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='6'/><postfield name='name' value='zi'/></go></anchor>"
response.write "<br/><img src='img/7.gif' alt='.'/>香蕉种子:"&rs8("tian")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='7'/><postfield name='name' value='tian'/></go></anchor>"
response.write "|<img src='img/8.gif' alt='.'/>菠萝种子:"&rs8("zmu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='8'/><postfield name='name' value='zmu'/></go></anchor>"
response.write "<br/><img src='img/9.gif' alt='.'/>西瓜种子:"&rs8("yi")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='9'/><postfield name='name' value='yi'/></go></anchor>"
response.write "|<img src='img/10.gif' alt='.'/>橙子种子:"&rs8("qang")&"|<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='10'/><postfield name='name' value='qang'/></go></anchor>"
response.write "<br/><img src='img/11.gif' alt='.'/>苹果种子:"&rs8("qian")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='11'/><postfield name='name' value='qian'/></go></anchor>"
response.write "|<img src='img/12.gif' alt='.'/>葡萄种子:"&rs8("pu")&"<anchor title='确定'>播种<go method='post' href='zhong_zcl.asp?SessionID="&SessionID&"'><postfield name='kd' value='12'/><postfield name='name' value='pu'/></go></anchor>"
else
Response.write "农场的瓜果还没有成熟呀<br/>"
end if
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


