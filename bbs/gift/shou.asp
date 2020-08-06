<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
kyzc=request.querystring("kyzc")
iduse=session("useid")
wpid=request("wpid")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

sql="Delete FROM market Where CStr(wpsl)='0' "
conn.execute(sql)


if kyzc="" then

set rszx=Server.CreateObject("ADODB.Recordset")
rsplzx="select * from gift Where CStr(id)='"&wpid&"'"
rszx.open rsplzx,conn
if rszx.eof then
response.write "<card id='card1' title='寄售物品'><p>这是什么东西啊?我怎么没见过？<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
yname=rszx("yname")
xyyz=rszx("xyyz")
rszx.close
set rszx=nothing
%>
<card id='card1' title='寄售物品'>
<p>
<img src='/bbs/gift/<%=wpid%>.jpg' alt='wap'/><br/>
寄售物品:<%=yname%>,商店价格:<%=xyyz%>金币<br/>
标价:<input name="csyz"  maxlength="10" size="5" format="*N"/>金币/件<br/>
数量:<input name="wnum"  maxlength="10" size="5" format="*N"/><br/>
<anchor>确定寄售
<go method="post" href="/bbs/gift/shou.Asp?kyzc=market&amp;SessionID=<%=SessionID%>">
<postfield name="csyz" value="$(csyz)"/>
<postfield name="wnum" value="$(wnum)"/>
<postfield name="wpid" value="<%=wpid%>"/>
<postfield name="yname" value="<%=yname%>"/>
</go></anchor><br/>
-----------<br/>
<a href="/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=<%=SessionID%>">进入二手市场</a><br/>

<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p></card></wml>
<%
elseif kyzc="market" then
response.write "<card id='card1' title='寄售物品'><p>"
csyz=request("csyz")
gfjf=request("wnum")
wpid=request("wpid")
yname=request("yname")

if gfjf="" then
response.write "系统提示！寄售数量不能为空!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

if csyz="" then
response.write "系统提示！寄售标价不能为空!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

if wpid="" then
response.write "系统提示！物品ID错误!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

gfjf=clng(request("wnum"))
csyz=clng(request("csyz"))

set rs=Server.CreateObject("ADODB.Recordset")
sql="select wp"&wpid&" from wupin where cstr(ids)='"&iduse& "'"
rs.open sql,conn

if rs.eof then
response.write "系统提示！你还没有"&yname&",拿寄售啊!<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if

if gfjf>rs("wp"&wpid&"") then
            msg="您的"&yname&"不够寄售数量!<br/><anchor><prev/>返回</anchor><br/>"    
   else

   sql="update wupin set wp"&wpid&"=wp"&wpid&"-"&gfjf&" Where CStr(ids)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)

rs.close
set rs=nothing

set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from market order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("rc")=gfjf
rsll("ids")=iduse
rsll("wpid")=wpid
rsll("wpsl")=gfjf
rsll("wpmc")=yname
rsll("money")=csyz
rsll.update
rsll.close
set rsll=nothing
            msg="你的货物:"&yname&" 数量"&gfjf&"件 我们收下了，如果卖出我们将马上将钱给你，恕不另行通知了!<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID="&SessionID&"'>进入二手市场</a><br/>--------------<br/>"    
end if
response.write msg
%>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
<%

elseif kyzc="buy" then

page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=5
end if

response.write "<card id='buy' title='寄售物品'><p>★欢迎您来到城市二手市场，欢迎来选购商品，下面是等着寄售的物品！<br/>"
ky=request.querystring("ky")
if ky="" or ky>4 or ky<1 then
	ky=1
  end if

  select case ky
'================================
  case 1
  wheretmp=" where DATEDIFF('d', Times, now()) < 16440*60"
  desc=" id desc"
  tip="物品寄售"
  StrFont="默认排序|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=2&amp;SessionID="&SessionID&"'>按高价排序</a><br/><a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=4&amp;SessionID="&SessionID&"'>我的寄售</a>|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=3&amp;SessionID="&SessionID&"'>按低价排序</a><br/>"
  case 2
  wheretmp=" where DATEDIFF('d', Times, now()) < 16440*60"
  desc=" money desc"
  tip="物品寄售"
  StrFont="<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=1&amp;SessionID="&SessionID&"'>默认排序</a>|按高价排序<br/><a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=4&amp;SessionID="&SessionID&"'>我的寄售</a>|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=3&amp;SessionID="&SessionID&"'>按低价排序</a><br/>"
  case 3
  wheretmp=" where DATEDIFF('d', Times, now()) < 16440*60"
  desc=" money asc"
  tip="物品寄售"
  StrFont="<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=1&amp;SessionID="&SessionID&"'>默认排序</a>|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=2&amp;SessionID="&SessionID&"'>按高价排序</a><br/><a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=4&amp;SessionID="&SessionID&"'>我的寄售</a>|按低价排序<br/>"
  case 4
  wheretmp=" where cstr(ids)="&iduse&" "
  desc=" id desc"
  tip="我寄售的"
  StrFont="<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=1&amp;SessionID="&SessionID&"'>默认排序</a>|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=2&amp;SessionID="&SessionID&"'>按高价排序</a><br/>我的寄售|<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;ky=3&amp;SessionID="&SessionID&"'>按低价排序</a><br/>"
  end select
response.write StrFont
response.write "------------<br/>"
set rsc=Server.CreateObject("ADODB.Recordset")
rspl="select * from market "&wheretmp&" order by "&desc&""
rsc.open rspl,conn,1,1
a=rsc.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("暂无寄售记录<br/>")
end if

if a>0 and page=1 then
response.write(""&tip&"共"&a&"条记录<br/>")
end if

if a>0 then
rsc.Move((page-1)*ns)
dim j
j=1
do while ((not rsc.eof) and j<=ns)

tjhm=rsc("ids")
%>
<%=(j+(page-1)*ns)%>:<img src="/bbs/gift/<%=rsc("wpid")%>.jpg" alt="wap"/><br/>

物品名称:<%=rsc("wpmc")%><br/>
出售数量:<%=rsc("rc")%><br/>
剩余数量:<%=rsc("wpsl")%><br/>
物品价格:<%=rsc("money")%><br/>
出售人:<%=ubb(redtjname)%>(ID:<%=tjhm%>)<br/>
<anchor>购买
		<go href="/BBS/GifT/shou.Asp?kyzc=purchase&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsc("id")%>" />
		<postfield name="ky" value="<%=ky%>" />
		<postfield name="page" value="<%=page%>" />
		</go>
		</anchor>
<%
if tjhm=iduse then
%>
<anchor>改价
		<go href="/BBS/GifT/shou.Asp?kyzc=xiu&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsc("id")%>" />
		<postfield name="ky" value="<%=ky%>" />
		<postfield name="page" value="<%=page%>" />
		</go>
		</anchor>
<%end if%>
<br/>
<%
			j = j + 1
rsc.movenext 
loop

end if
if maxp>1 then
response.write("-----------<br/>")
end if
if page<maxp then
response.write("<a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;ky="&ky&"&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;ky="&ky&"&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/bbs/gift/shou.Asp?SessionID=<%=SessionID%>&amp;ky=<%=ky%>&amp;kyzc=buy" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rsc.close
set rsc=nothing
%>
-----------<br/>
<a href="/BBS/Gift/Gift.Asp?SessionID=<%=SessionID%>">进入社区超市</a><br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
<%

elseif kyzc="purchase" then
response.write "<card id='purchase' title='购买二手物品'><p>"
ids=request("id")
page=request("page")
ky=request("ky")
set rsss=Server.CreateObject("ADODB.Recordset")
rsspl="select * from market Where CStr(id)="&ids
rsss.open rsspl,conn,1,2
if rsss.eof and rsss.bof then
	response.write "本店没有寄售这个物品啊，请正确选择?<br/>"
response.write "</p></card></wml>"
response.end
end if

wpis=rsss("wpid")
idss=rsss("ids")
money=rsss("money")
wpmc=rsss("wpmc")
wpsl=rsss("wpsl")

wpsl=clng(wpsl)
money=clng(money)

if wpsl=0 or wpsl<= 0   then
response.write("系统提示！对不起，出售者寄售在这里的物品已经没了...你来晚了。<br/>--------------<br/><a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;page="&page&"&amp;ky="&ky&"'>返回继续选购</a><br/>")
response.write "</p></card></wml>"
response.end
end if

   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<money then
	response.write "对不起! 金币不足无法购买！物品：<u>"&wpmc&"</u>出售价格：<u>"&money&"</u>金币,你手头只有<u>"&objgbrs("usejf")&"</u>枚金币,还差"&money-objgbrs("usejf")&"枚金币.<a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;ky="&ky&"&amp;page="&page&"'>返回继续选购</a><br/>"
    objgbrs.close
 set objgbrs=nothing

response.write "</p></card></wml>"
response.end
end if


sql="update market set wpsl=wpsl-1 where cstr(id)="&ids
  conn.Execute(sql)
sql="update usereg set usejf=usejf+"&money&" where cstr(id)="&idss
  conn.Execute(sql)

sql="update wupin set wp"&wpis&"=wp"&wpis&"+1 where cstr(ids)="&iduse
  conn.Execute(sql)
sql="update usereg set usejf=usejf-"&money&" where cstr(id)="&iduse
  conn.Execute(sql)


msg="购买物品成功！您花"&money&"金币购买了"&wpmc&".请到我的地盘&gt;我的物品中查看以及应用！<br/>"
    rsss.close
 set rsss=nothing

	response.write msg

%>
-----------<br/>
<a href="/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=<%=SessionID%>&amp;ky=<%=ky%>&amp;page=<%=page%>">返回交易市场</a><br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>
<%
elseif kyzc="xiu" then

response.write "<card id='purchase' title='修改物品价格'><p>"
ids=request("id")
page=request("page")
ky=request("ky")
set rsst=Server.CreateObject("ADODB.Recordset")
rsspt="select * from market Where CStr(id)="&ids
rsst.open rsspt,conn,1,2
if rsst.eof and rsst.bof then
	response.write "本店没有寄售这个物品啊，请正确选择?<br/>"
response.write "</p></card></wml>"
response.end
end if
idss=rsst("ids")

if idss<>iduse then
response.write("系统提示！对不起，该物品不是你de.请勿乱来。<br/>--------------<br/><a href='/bbs/gift/shou.Asp?SessionID="&SessionID&"&amp;kyzc=buy&amp;page="&page&"&amp;ky="&ky&"'>返回继续选购</a><br/>")
response.write "</p></card></wml>"
response.end
end if

%>
修改我物品:<%=rsst("wpmc")%><br/>
标价:<input name="csyz<%=minute(now)%><%=second(now)%>"  maxlength="10" size="5" format="*N" value="<%=rsst("money")%>"/>金币/件<br/>
<anchor>改价
		<go href="/BBS/GifT/shou.Asp?kyzc=gai&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rsst("id")%>" />
		<postfield name="csyz" value="$(csyz<%=minute(now)%><%=second(now)%>)"/>
		<postfield name="page" value="<%=page%>" />
		<postfield name="ky" value="<%=ky%>" />
		</go>
		</anchor><br/>

-----------<br/>
<a href="/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=<%=SessionID%>&amp;ky=<%=ky%>&amp;page=<%=page%>">返回交易市场</a><br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>
<%
    rsst.close
 set rsst=nothing

elseif kyzc="gai" then

ids=request("id")
page=request("page")
ky=request("ky")
csyz=request("csyz")

response.write "<card id='purchase' title='修改物品价格'><p>"

set rssw=Server.CreateObject("ADODB.Recordset")
rspls="select * from market Where CStr(id)='"&ids&"' and CStr(ids)="&iduse
rssw.open rspls,conn,1,2
if rssw.eof then 
response.write("没有该物品!<br/>")
else
if csyz<>"" then rssw("money")=csyz
rssw.update

wpmc=rssw("wpmc")
rssw.close
set rssw=nothing
end if
%>
成功修改我的物品 <%=wpmc%> 的价格!<br/>
-----------<br/>
<a href="/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=<%=SessionID%>&amp;ky=<%=ky%>&amp;page=<%=page%>">返回交易市场</a><br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>
<%
end if
conn.close
 set conn=nothing%>