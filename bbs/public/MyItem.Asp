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
	ky=2
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
  case 1
  tip="精品专柜"
  StrFont="精品专柜|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 2
  tip="首饰专柜"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|首饰专柜<br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 3
  tip="鲜花专柜"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/>鲜花专柜|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 4
  tip="食品专柜"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|食品专柜<br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 5
  tip="礼品专柜"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/>礼品专柜|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 6
  tip="服饰物品"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|服饰物品<br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 7
  tip="化妆物品"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/>化妆物品|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 8
  tip="数码物品"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|数码物品<br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 9
  tip="汽车物品"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/>汽车物品|<a href='/bbs/gift/MyItem.Asp?ky=10&amp;SessionID=" & SessionID & "'>地产物品</a><br/>"
'================================
  case 10
  tip="地产物品"
  StrFont="<a href='/bbs/gift/MyItem.Asp?ky=1&amp;SessionID=" & SessionID & "'>精品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=2&amp;SessionID=" & SessionID & "'>首饰专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=3&amp;SessionID=" & SessionID & "'>鲜花专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=4&amp;SessionID=" & SessionID & "'>食品专柜</a><br/><a href='/bbs/gift/MyItem.Asp?ky=5&amp;SessionID=" & SessionID & "'>礼品专柜</a>|<a href='/bbs/gift/MyItem.Asp?ky=6&amp;SessionID=" & SessionID & "'>服饰物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=7&amp;SessionID=" & SessionID & "'>化妆物品</a>|<a href='/bbs/gift/MyItem.Asp?ky=8&amp;SessionID=" & SessionID & "'>数码物品</a><br/><a href='/bbs/gift/MyItem.Asp?ky=9&amp;SessionID=" & SessionID & "'>汽车物品</a>|地产物品<br/>"
 end select
response.write StrFont
%>
<%
if ky="2" then
if rs("1")<>0 then
Response.Write "物品名称:钻石耳针<br/>物品图片:<img src='/bbs/gift/1.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("1")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("2")<>0 then
Response.Write "物品名称:钻石耳坠<br/>物品图片:<img src='/bbs/gift/2.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("2")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("3")<>0 then
Response.Write "物品名称:爱心金链<br/>物品图片:<img src='/bbs/gift/3.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("3")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("4")<>0 then
Response.Write "物品名称:钻石铂金链<br/>物品图片:<img src='/bbs/gift/4.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("4")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("5")<>0 then
Response.Write "物品名称:心形手链<br/>物品图片:<img src='/bbs/gift/5.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("5")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("6")<>0 then
Response.Write "物品名称:心形首饰<br/>物品图片:<img src='/bbs/gift/6.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("6")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("7")<>0 then
Response.Write "物品名称:心形颈链<br/>物品图片:<img src='/bbs/gift/7.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("7")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("8")<>0 then
Response.Write "物品名称:红心坠子<br/>物品图片:<img src='/bbs/gift/8.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("8")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("9")<>0 then
Response.Write "物品名称:鸡心链<br/>物品图片:<img src='/bbs/gift/9.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("9")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("10")<>0 then
Response.Write "物品名称:和田玉器<br/>物品图片:<img src='/bbs/gift/10.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("10")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("11")<>0 then
Response.Write "物品名称:火红玉镯<br/>物品图片:<img src='/bbs/gift/11.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("11")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("12")<>0 then
Response.Write "物品名称:玉石鼻烟壶<br/>物品图片:<img src='/bbs/gift/12.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("12")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("13")<>0 then
Response.Write "物品名称:玉石香水瓶<br/>物品图片:<img src='/bbs/gift/13.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("13")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("1")+rs("2")+rs("3")+rs("4")+rs("5")+rs("6")+rs("7")+rs("7")+rs("8")+rs("9")+rs("10")+rs("11")+rs("12")+rs("13")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="3" then 

if rs("14")<>0 then
Response.Write "物品名称:玫瑰<br/>物品图片:<img src='/bbs/gift/14.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("11")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("15")<>0 then
Response.Write "物品名称:郁金香<br/>物品图片:<img src='/bbs/gift/15.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("15")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("16")<>0 then
Response.Write "物品名称:百合<br/>物品图片:<img src='/bbs/gift/16.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("16")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("17")<>0 then
Response.Write "物品名称:康乃馨<br/>物品图片:<img src='/bbs/gift/17.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("17")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("18")<>0 then
Response.Write "物品名称:翠菊<br/>物品图片:<img src='/bbs/gift/18.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("18")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("19")<>0 then
Response.Write "物品名称:菊花<br/>物品图片:<img src='/bbs/gift/19.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("19")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("20")<>0 then
Response.Write "物品名称:红玫瑰<br/>物品图片:<img src='/bbs/gift/20.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("20")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("21")<>0 then
Response.Write "物品名称:剑兰<br/>物品图片:<img src='/bbs/gift/21.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("21")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("22")<>0 then
Response.Write "物品名称:牡丹<br/>物品图片:<img src='/bbs/gift/22.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("22")&"个<br/>寄售|送人|使用<br/>"
end if

if rs("14")+rs("15")+rs("16")+rs("17")+rs("18")+rs("19")+rs("20")+rs("21")+rs("22")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="4" then 

if rs("23")<>0 then
Response.Write "物品名称:果仁巧克力<br/>物品图片:<img src='/bbs/gift/23.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("23")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("24")<>0 then
Response.Write "物品名称:黑巧克力<br/>物品图片:<img src='/bbs/gift/24.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("24")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("25")<>0 then
Response.Write "物品名称:心形巧克力<br/>物品图片:<img src='/bbs/gift/25.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("25")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("26")<>0 then
Response.Write "物品名称:爱心蛋糕<br/>物品图片:<img src='/bbs/gift/26.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("26")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("26")+rs("23")+rs("24")+rs("25")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="5" then 

if rs("27")<>0 then
Response.Write "物品名称:德芙巧克力<br/>物品图片:<img src='/bbs/gift/27.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("27")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("28")<>0 then
Response.Write "物品名称:男士皮包<br/>物品图片:<img src='/bbs/gift/28.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("28")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("29")<>0 then
Response.Write "物品名称:水晶像架<br/>物品图片:<img src='/bbs/gift/29.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("29")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("30")<>0 then
Response.Write "物品名称:金质打火机<br/>物品图片:<img src='/bbs/gift/30.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("30")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("31")<>0 then
Response.Write "物品名称:钨金打火机<br/>物品图片:<img src='/bbs/gift/31.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("31")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("32")<>0 then
Response.Write "物品名称:度银打火机<br/>物品图片:<img src='/bbs/gift/32.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("32")&"个<br/>寄售|送人|使用<br/>"
end if

if rs("27")+rs("28")+rs("29")+rs("30")+rs("31")+rs("32")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="6" then 

if rs("33")<>0 then
Response.Write "物品名称:时尚外套<br/>物品图片:<img src='/bbs/gift/33.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("33")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("34")<>0 then
Response.Write "物品名称:皮质外套<br/>物品图片:<img src='/bbs/gift/34.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("34")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("35")<>0 then
Response.Write "物品名称:棉质上衣<br/>物品图片:<img src='/bbs/gift/35.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("35")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("36")<>0 then
Response.Write "物品名称:短裙套装<br/>物品图片:<img src='/bbs/gift/36.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("36")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("37")<>0 then
Response.Write "物品名称:新潮外套<br/>物品图片:<img src='/bbs/gift/37.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("37")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("38")<>0 then
Response.Write "物品名称:个性套装<br/>物品图片:<img src='/bbs/gift/38.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("38")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("39")<>0 then
Response.Write "物品名称:休闲套装<br/>物品图片:<img src='/bbs/gift/39.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("39")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("40")<>0 then
Response.Write "物品名称:毛线套装<br/>物品图片:<img src='/bbs/gift/40.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("40")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("41")<>0 then
Response.Write "物品名称:短袖套装<br/>物品图片:<img src='/bbs/gift/41.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("41")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("42")<>0 then
Response.Write "物品名称:夹克套装<br/>物品图片:<img src='/bbs/gift/42.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("42")&"个<br/>寄售|送人|使用<br/>"
end if

if rs("33")+rs("34")+rs("35")+rs("36")+rs("37")+rs("38")+rs("39")+rs("40")+rs("41")+rs("42")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="7" then 

if rs("43")<>0 then
Response.Write "物品名称:绿瓶香水<br/>物品图片:<img src='/bbs/gift/43.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("43")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("44")<>0 then
Response.Write "物品名称:古龙水<br/>物品图片:<img src='/bbs/gift/44.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("44")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("45")<>0 then
Response.Write "物品名称:金色女郎香水<br/>物品图片:<img src='/bbs/gift/45.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("45")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("46")<>0 then
Response.Write "物品名称:美白精华液<br/>物品图片:<img src='/bbs/gift/46.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("46")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("47")<>0 then
Response.Write "物品名称:滋养霜<br/>物品图片:<img src='/bbs/gift/47.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("47")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("43")+rs("44")+rs("45")+rs("46")+rs("47")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="8" then 

if rs("48")<>0 then
Response.Write "物品名称:数码相机<br/>物品图片:<img src='/bbs/gift/48.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("48")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("49")<>0 then
Response.Write "物品名称:普通相机<br/>物品图片:<img src='/bbs/gift/49.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("49")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("50")<>0 then
Response.Write "物品名称:宽屏手机<br/>物品图片:<img src='/bbs/gift/50.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("50")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("51")<>0 then
Response.Write "物品名称:晶晶亮手机<br/>物品图片:<img src='/bbs/gift/51.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("51")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("52")<>0 then
Response.Write "物品名称:索尼随身听<br/>物品图片:<img src='/bbs/gift/52.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("52")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("53")<>0 then
Response.Write "物品名称:爱立信可视电话<br/>物品图片:<img src='/bbs/gift/53.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("53")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("48")+rs("49")+rs("50")+rs("51")+rs("52")+rs("53")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="9" then 

if rs("54")<>0 then
Response.Write "物品名称:帕萨特<br/>物品图片:<img src='/bbs/gift/54.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("54")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("55")<>0 then
Response.Write "物品名称:新皇冠<br/>物品图片:<img src='/bbs/gift/55.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("55")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("56")<>0 then
Response.Write "物品名称:法拉利<br/>物品图片:<img src='/bbs/gift/56.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("56")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("57")<>0 then
Response.Write "物品名称:保时捷<br/>物品图片:<img src='/bbs/gift/57.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("57")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("58")<>0 then
Response.Write "物品名称:劳斯来斯<br/>物品图片:<img src='/bbs/gift/58.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("58")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("59")<>0 then
Response.Write "物品名称:电动车<br/>物品图片:<img src='/bbs/gift/59.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("59")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("60")<>0 then
Response.Write "物品名称:脚踏车<br/>物品图片:<img src='/bbs/gift/60.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("60")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("61")<>0 then
Response.Write "物品名称:摩托车<br/>物品图片:<img src='/bbs/gift/61.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("61")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("62")<>0 then
Response.Write "物品名称:轮船<br/>物品图片:<img src='/bbs/gift/62.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("62")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("63")<>0 then
Response.Write "物品名称:飞机<br/>物品图片:<img src='/bbs/gift/63.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("63")&"个<br/>寄售|送人|使用<br/>"
end if

if rs("54")+rs("55")+rs("56")+rs("57")+rs("58")+rs("59")+rs("60")+rs("61")+rs("62")+rs("63")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if

elseif ky="10" then 

if rs("64")<>0 then
Response.Write "物品名称:赏月台<br/>物品图片:<img src='/bbs/gift/64.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("64")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("65")<>0 then
Response.Write "物品名称:观月台<br/>物品图片:<img src='/bbs/gift/65.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("65")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("66")<>0 then
Response.Write "物品名称:许愿台<br/>物品图片:<img src='/bbs/gift/66.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("66")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("67")<>0 then
Response.Write "物品名称:摘月台<br/>物品图片:<img src='/bbs/gift/67.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("67")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("68")<>0 then
Response.Write "物品名称:单身公寓<br/>物品图片:<img src='/bbs/gift/68.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("68")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("69")<>0 then
Response.Write "物品名称:帝豪庭苑<br/>物品图片:<img src='/bbs/gift/69.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("69")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("70")<>0 then
Response.Write "物品名称:彩色家园<br/>物品图片:<img src='/bbs/gift/70.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("70")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("71")<>0 then
Response.Write "物品名称:环山套房<br/>物品图片:<img src='/bbs/gift/71.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("71")&"个<br/>寄售|送人|使用<br/>"
end if
if rs("72")<>0 then
Response.Write "物品名称:海湾别墅<br/>物品图片:<img src='/bbs/gift/72.jpg' alt='yxxe.net'/><br/>物品数量:"&rs("72")&"个<br/>寄售|送人|使用<br/>"
end if

if rs("64")+rs("65")+rs("66")+rs("67")+rs("68")+rs("69")+rs("70")+rs("71")+rs("72")<=0 then
Response.Write "该类物品你件都没有~真晕*.*<br/>"
end if
end if

end if
        rs.Close
	Set rs=Nothing
%>--------------<br/>
<a href="/bbs/gift/gift.asp?SessionID=<%=SessionID%>">进入社区超市</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>