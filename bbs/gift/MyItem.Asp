<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的个人物品">
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" or ky>11 or ky<1 then
	ky=9
  end if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if
iduse=Session("useid")
set rs=Server.CreateObject("ADODB.Recordset")
rsQL="select * from wupin where cstr(ids)='"&iduse& "'"
rs.open rsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=iduse
rs.update
end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if
%>
<%
if kyzc="" then
  select case ky

'================================
  case 9
  tip="汽车物品"
  StrFont="<a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;ky=4'>寄售物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a>|汽车物品<br/>"
'================================
  case 10
  tip="地产物品"
  StrFont="<a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;ky=4'>寄售物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|地产物品<br/>"
 end select
response.write StrFont
%>
<%
if ky="1" then
Response.Write "-----------<br/>该类物品你一件都没有~真晕*.*<br/>"
elseif ky="9" then 

if rs("wp54")<>0 then
Response.Write "物品名称:帕萨特<br/>物品图片:<img src='/bbs/gift/54.jpg' alt='wap'/><br/>物品数量:"&rs("wp54")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=54&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=54&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=54&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp55")<>0 then
Response.Write "物品名称:新皇冠<br/>物品图片:<img src='/bbs/gift/55.jpg' alt='wap'/><br/>物品数量:"&rs("wp55")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=55&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=55&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=55&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp56")<>0 then
Response.Write "物品名称:法拉利<br/>物品图片:<img src='/bbs/gift/56.jpg' alt='wap'/><br/>物品数量:"&rs("wp56")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=56&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=56&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=56&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp57")<>0 then
Response.Write "物品名称:保时捷<br/>物品图片:<img src='/bbs/gift/57.jpg' alt='wap'/><br/>物品数量:"&rs("wp57")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=57&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=57&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=57&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp58")<>0 then
Response.Write "物品名称:劳斯来斯<br/>物品图片:<img src='/bbs/gift/58.jpg' alt='wap'/><br/>物品数量:"&rs("wp58")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=58&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=58&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=58&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp59")<>0 then
Response.Write "物品名称:电动车<br/>物品图片:<img src='/bbs/gift/59.jpg' alt='wap'/><br/>物品数量:"&rs("wp59")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=59&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=59&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=59&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp60")<>0 then
Response.Write "物品名称:脚踏车<br/>物品图片:<img src='/bbs/gift/60.jpg' alt='wap'/><br/>物品数量:"&rs("wp60")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=60&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=60&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=60&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp61")<>0 then
Response.Write "物品名称:摩托车<br/>物品图片:<img src='/bbs/gift/61.jpg' alt='wap'/><br/>物品数量:"&rs("wp61")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=61&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=61&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=61&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp62")<>0 then
Response.Write "物品名称:轮船<br/>物品图片:<img src='/bbs/gift/62.jpg' alt='wap'/><br/>物品数量:"&rs("wp62")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=62&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=62&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=62&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp63")<>0 then
Response.Write "物品名称:飞机<br/>物品图片:<img src='/bbs/gift/63.jpg' alt='wap'/><br/>物品数量:"&rs("wp63")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=63&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=63&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=63&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if

if rs("wp54")+rs("wp55")+rs("wp56")+rs("wp57")+rs("wp58")+rs("wp59")+rs("wp60")+rs("wp61")+rs("wp62")+rs("wp63")<=0 then
Response.Write "-----------<br/>该类物品你一件都没有~真晕*.*<br/>"
end if

elseif ky="10" then 

if rs("wp64")<>0 then
Response.Write "物品名称:赏月台<br/>物品图片:<img src='/bbs/gift/64.jpg' alt='wap'/><br/>物品数量:"&rs("wp64")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=64&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=64&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=64&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp65")<>0 then
Response.Write "物品名称:观月台<br/>物品图片:<img src='/bbs/gift/65.jpg' alt='wap'/><br/>物品数量:"&rs("wp65")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=65&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=65&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=65&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp66")<>0 then
Response.Write "物品名称:许愿台<br/>物品图片:<img src='/bbs/gift/66.jpg' alt='wap'/><br/>物品数量:"&rs("wp66")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=66&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=66&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=66&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp67")<>0 then
Response.Write "物品名称:摘月台<br/>物品图片:<img src='/bbs/gift/67.jpg' alt='wap'/><br/>物品数量:"&rs("wp67")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=67&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=67&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=67&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp68")<>0 then
Response.Write "物品名称:单身公寓<br/>物品图片:<img src='/bbs/gift/68.jpg' alt='wap'/><br/>物品数量:"&rs("wp68")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=68&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=68&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=68&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp69")<>0 then
Response.Write "物品名称:帝豪庭苑<br/>物品图片:<img src='/bbs/gift/69.jpg' alt='wap'/><br/>物品数量:"&rs("wp69")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=69&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=69&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=69&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp70")<>0 then
Response.Write "物品名称:彩色家园<br/>物品图片:<img src='/bbs/gift/70.jpg' alt='wap'/><br/>物品数量:"&rs("wp70")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=70&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=70&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=70&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp71")<>0 then
Response.Write "物品名称:环山套房<br/>物品图片:<img src='/bbs/gift/71.jpg' alt='wap'/><br/>物品数量:"&rs("wp71")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=71&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=71&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=71&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if
if rs("wp72")<>0 then
Response.Write "物品名称:海湾别墅<br/>物品图片:<img src='/bbs/gift/72.jpg' alt='wap'/><br/>物品数量:"&rs("wp72")&"个<br/><a href='/bbs/gift/shou.Asp?wpid=72&amp;SessionID=" & SessionID & "'>寄售</a>|<a href='/bbs/gift/song.Asp?wpid=72&amp;SessionID=" & SessionID & "'>赠送</a>|<a href='/bbs/gift/yong.Asp?wpid=72&amp;SessionID=" & SessionID & "'>使用</a><br/>"
end if

if rs("wp64")+rs("wp65")+rs("wp66")+rs("wp67")+rs("wp68")+rs("wp69")+rs("wp70")+rs("wp71")+rs("wp72")<=0 then
Response.Write "-----------<br/>该类物品你一件都没有~真晕*.*<br/>"
end if
end if

end if
        rs.Close
	Set rs=Nothing
%>-----------<br/>

<a href="/bbs/gift/gift.asp?SessionID=<%=SessionID%>">进入社区超市</a><br/>
<a href="/bbs/public/gygl.asp?SessionID=<%=SessionID%>">返回我的地盘</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>