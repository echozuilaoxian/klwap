<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="系统花店" >
<p>
<%
Response.write "系统花店/<a href='/bbs/hua/zhong_m.asp?SessionID=" & SessionID & "'>种子公司</a>"
%>
<%
dim ky,kyzc
  kid=request.querystring("kid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
Action=request.querystring("Action")
iduse=Session("useid")
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from hua where ids=" & iduse & ""
       rs8.open ssql,conn,1,1
if rs8.eof then
 Error("你花园都没有开！")
end if

 if Action="" or Action<>"save" then
Response.write "<br/>你共有("&rs8("hongs")+rs8("huangs")+rs8("zis")+rs8("yis")+rs8("hmus")+rs8("kangs")+rs8("mans")+rs8("tians")+rs8("zmus")+rs8("qangs")+rs8("qians")+rs8("pus")&")朵鲜花<br/>"
%>
选择鲜花:<select name='kid' value='选择鲜花'>
<option value='1'>红玖瑰</option>
<option value='2'>红牡丹</option>
<option value='3'>郁金香</option>
<option value='4'>康乃馨</option>
<option value='5'>满天星</option>
<option value='6'>蓝玫瑰</option>
<option value='7'>天堂鸟</option>
<option value='8'>紫牡丹</option>
<option value='9'>向日葵</option>
<option value='10'>蔷薇花</option>
<option value='11'>牵牛花</option>
<option value='12'>蒲公英</option>
</select><br/>
数量:<input name="dlmm" title="数量" type="text" format="*N" emptyok="true" maxlength="30" value=""/><br/>
<anchor>确定提交
    <go href="xthdcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
         <postfield name="dlmm" value="$(dlmm)"/>
		<postfield name="kid" value="$(kid)"/>
        </go></anchor><br/>
本店出售所有品种鲜花<br/>
<img src='/bbs/xhjy/hua/1.gif' alt=''/>红玫瑰(1280金币)<br/><img src='/bbs/xhjy/hua/2.gif' alt=''/>红牡丹(1280金币)
<br/><img src='/bbs/xhjy/hua/3.gif' alt=''/>郁金香(1280金币)
<br/><img src='/bbs/xhjy/hua/4.gif' alt=''/>康乃馨(1280金币)
<br/><img src='/bbs/xhjy/hua/5.gif' alt=''/>满天星(1280金币)
<br/><img src='/bbs/xhjy/hua/6.gif' alt=''/>蓝玫瑰(1280金币)
<br/><img src='/bbs/xhjy/hua/7.gif' alt=''/>天堂鸟(1280金币)
<br/><img src='/bbs/xhjy/hua/8.gif' alt=''/>紫牡丹(1280金币)
<br/><img src='/bbs/xhjy/hua/9.gif' alt=''/>向日葵(1280金币)
<br/><img src='/bbs/xhjy/hua/10.gif' alt=''/>蔷薇花(1280金币)
<br/><img src='/bbs/xhjy/hua/11.gif' alt=''/>牵牛花(1280金币)
<br/><img src='/bbs/xhjy/hua/12.gif' alt=''/>蒲公英(1280金币)
<br/>------------<br/>
<%else

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kid=" & kid & ""
End if
kid=clng(request("kid"))
dlmm=clng(request("dlmm"))
if   kid=""  or dlmm="" or Isnumeric(dlmm)=False  or Isnumeric(kid)=False  or dlmm<=0 or kid<=0  or dlmm>999999999 or kid>12    then
  Error("数字无效！")
  end if
if kid=1 then 
kkb=rs8("hongs")
 huaa="hongs" 
jia="1280" 
elseif kid=2 then 
kkb=rs8("hmus")
huaa="hmus"
jia="1280"
elseif kid=3 then 
kkb=rs8("huangs")
huaa="huangs"
 jia="1280"
elseif kid=4 then 
kkb=rs8("kangs")
huaa="kangs"
 jia="1280"
elseif kid=5 then 
kkb=rs8("mans")
huaa="mans"
 jia="1280"
elseif kid=6 then 
kkb=rs8("zis")
huaa="zis"
 jia="1280"
elseif kid=7 then 
kkb=rs8("tians")
 huaa="tians"
 jia="1280"
elseif kid=8 then 
kkb=rs8("zmus")
 huaa="zmus" 
jia="1280" 
elseif kid=9 then 
kkb=rs8("yis")
huaa="yis"
jia="1280"
elseif kid=10 then 
kkb=rs8("qangs")
huaa="qangs"
 jia="1280"
elseif kid=11 then 
kkb=rs8("qians")
huaa="qians"
 jia="1280"
elseif kid=12 then 
kkb=rs8("pus")
huaa="pus"
 jia="1280"
end if
if clng(dlmm)>clng(kkb) then
Error("你有这么多的物品吗???！")
  end if
if clng("usejf")<dlmm*1000 then
Error("金币不够")
  end if
jbjia=jia*dlmm
sql="update hua set "&huaa&"="&huaa&"+"&dlmm&"  where ids=" &iduse& "" 				
                conn.execute sql
sql="update usereg set  usejf=usejf-"&jbjia&"  where id=" &iduse& "" 				
                conn.execute sql
dim talk
talk="" & Session("ltname") & "在(url=/bbs/hua/xthd.Asp?SessionID=[SessionID=])系统花店(/url)买了"&dlmm&"朵鲜花!花了"&jbjia&"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock

%>
----------<br/>成功买了<%=dlmm%>朵鲜花,共花费<%=jbjia%>金币<br/>
<% end if%>
<a href="/bbs/hua/index.asp?SessionID=<%=SessionID%>">返回我的花园</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%  rs8.Close
	Set rs8=Nothing
conn.close
set conn=nothing%>