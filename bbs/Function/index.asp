<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="YxxE_Net.asp"-->
<!--#include file="redtjnamecp.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim kyzc
  kyzc=request.querystring("kyzc")

  if kyzc="" then kyzc="main"
if kyzc="main" then
%>
<card id="main" title="社区五星级酒店" >
<p>
<a href='/BBS/Function/Index.Asp?kyzc=ding&amp;SessionID=<%=SessionID%>'>预定酒席</a><br/>
<%
  set rsg=Server.CreateObject("ADODB.Recordset")
     qsss="select * from yxxe order by id desc"
  rsg.open qsss,myc,1,1
page=int(request("page"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

a=rsg.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("--------------<br/>暂无记录<br/>")
end if

if a>0 then
response.write("共有"&a&"个酒席<br/>在城市大酒店中，你可以定酒席，请你的亲朋好友来这参加你定下的酒席。不同的酒席，参加者所得到的东西是不同的，当然参加的人数也是不一样的，参加酒席的人必须魅力大于零才能参加!<br/>--------------<br/>")
end if

if a>0 then
rsg.Move((page-1)*ns)
dim j
j=1
do while ((not rsg.eof) and j<=ns)

tjhms=rsg("ids")
%>
<%=(j+(page-1)*ns)%>.宴请者:<a href='/BBS/reg/useinfo.asp?id=<%=ubb(tjhms)%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjnames)%></a>宴会名:《<a href='/BBS/Function/Index.Asp?id=<%=rsg("id")%>&amp;kyzc=xiang&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'><%=ubb(rsg("biaoti"))%></a>》<a href='/BBS/Function/Index.Asp?id=<%=rsg("id")%>&amp;kyzc=rj&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'>入席</a><%
if rsg("rens")=0 then
response.write("已经满座:★")
Else
response.write("剩余座位:"&rsg("rens")&"")
end if
%>
开宴时间:<%=ubb(rsg("kjtime"))%>
<%
if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then%>
<a href='/BBS/Function/Index.Asp?id=<%=rsg("id")%>&amp;kyzc=del&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'>删除</a>
<%end if%>
<br/>
<%
			j = j + 1
rsg.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Function/Index.Asp?SessionID=<%=SessionID%>&amp;kyzc=<%=kyzc%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rsg.close
set rsg=nothing

response.write("--------------<br/><a href='/bbs//public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/>")

Elseif kyzc="xiang"  then

page=request("page")
idsss=request("id")
  set rse=Server.CreateObject("ADODB.Recordset")
     qsse="select * from yxxe where Id="&idsss
  rse.open qsse,myc,1,2
if rse.eof then 
response.write("<card id='main' title='ID错误'><p>ID错误!<br/>")
else
tjhm=rse("ids")
%>
<card id="main" title="<%=ubb(redtjname)%>的宴席" >
<p>
宴请者:<a href='/BBS/reg/useinfo.asp?id=<%=ubb(tjhm)%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjname)%></a>(id:<%=ubb(tjhm)%>)<br/>
宴会名:<%=ubb(rse("biaoti"))%><br/>
<%
if rse("rens")=0 then
response.write("宴状态:已经满座<br/>")
Else
response.write("宴状态:剩余座位:<b>"&rse("rens")&"</b><br/>")
%>
<a href='/BBS/Function/Index.Asp?id=<%=rse("id")%>&amp;kyzc=rj&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'>参与宴席</a><br/>
<%end if%>
开宴时间:<%=ubb(rse("kjtime"))%><br/>
<%
response.write("参加宴席的朋友<br/>")


if rse("grid")<>"" then 

votei=split(ubb(rse("grid")),"\")
for i=0 to ubound(votei)
if votei(i)<>"" then 
tjhms=votei(i)
%>
<%=i+1%>.<a href='/BBS/reg/useinfo.asp?id=<%=tjhms%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjnames)%></a><br/>
<%

end if

next

else
response.write("还没有人参加该宴席<br/>")
end if
end if
response.write("--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;page="&page&"'>返回社区酒店</a><br/>")

rse.close
set rse=nothing

Elseif kyzc="del"  then
page=request("page")
idss=request("id")
  set rsf=Server.CreateObject("ADODB.Recordset")
     qssf="select * from yxxe where Id="&idss
  rsf.open qssf,myc,1,2
if rsf.eof then 
response.write("<card id='main' title='ID错误'><p>ID错误!<br/>")
else
tjhm=rsf("ids")
%>
<card id="main" title="删除-<%=ubb(redtjname)%>的宴席" >
<p>确认删除<%=ubb(redtjname)%>的宴席吗?删除后不可恢复<br/>
<a href='/BBS/Function/Index.Asp?id=<%=rsf("id")%>&amp;kyzc=delok&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'>确认</a><br/><br/>
<a href='/BBS/Function/Index.Asp?id=<%=rsf("id")%>&amp;kyzc=xiang&amp;SessionID=<%=SessionID%>&amp;page=<%=page%>'>取消</a><br/>

<%
response.write("--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;page="&page&"'>返回社区酒店</a><br/>")
end if

rsf.close
set rsf=nothing

Elseif kyzc="delok"  then

ids=request("id")
page=request("page")

sql="delete from yxxe Where CStr(Id)='" & ids & "'"
  myc.Execute(sql)
%>
<card id="main" title="删除成功" >
<p>删除成功！<br/>

<%
response.write("--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;page="&page&"'>返回社区酒店</a><br/>")


Elseif kyzc="rj"  then
%>
<card id="main" title="社区酒店" >
<p>
<%
page=request("page")
id=request("id")
  set rsy=Server.CreateObject("ADODB.Recordset")
     qssy="select * from yxxe where Id="&id
  rsy.open qssy,myc,1,2
rens=rsy("rens")

if rsy.eof then 
response.write("ID错误!<br/>")

elseif rens=0 or rens<= 0   then
response.write("对不起，本桌的宴席已经满座啦，还是到别的宴席去吃吧。<br/>--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main&amp;page="&page&"'>返回社区酒店</a><br/>")

else

if rsy("grid")<>"" then
votei=split(ubb(rsy("grid")),"\")
for i=0 to ubound(votei)
if votei(i)<>"" then
if cint(votei(i))=cint(Session("useid")) then
novote="true"
end if
end if
next
end if

if novote<>"true" then
'---开始增加----
rsy("rens")=rsy("rens")-1
rsy("grid")=rsy("grid")&Session("useid")&"\"
'---结束增加----
rsy.update
Rsy.close
set rsy=nothing
  sql="update usereg set usejf=usejf+50,ml=ml+1,tili=tili+1 where CStr(id)='" & Session("useid") & "'"
  conn.Execute(sql)
response.write("谢谢您来参加我的宴会，你增加了体力和力量，为了表示感谢另外送你少许礼金，请笑纳。<br/>--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main&amp;page="&page&"'>返回社区酒店</a><br/>")
else
response.write("对不起，您已经参加过本桌的宴席，怎么又来吃一次？还是到别的宴席去吃吧。<br/>--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main&amp;page="&page&"'>返回社区酒店</a><br/>")
end if
end if

Elseif kyzc="ding"  then

%>
<card id="main" title="社区酒店" >
<p>
<%

  set rsi=Server.CreateObject("ADODB.Recordset")
     qssi="select * from jiudian"
  rsi.open qssi,myc,1,1
pages=int(request("pages"))
nss=int(request("nss"))
if pages="" or pages<=0 then
pages=1
end if
if nss="" or nss<=0 then
nss=10
end if

aa=rsi.recordcount
maxps=(aa-1)\nss+1
if pages>maxps then pages=maxps

if aa=0 then
response.write("暂无记录<br/>")
end if
if aa>0 then
response.write("酒席订购列表<br/>--------------<br/>")
rsi.Move((pages-1)*nss)
dim jj
jj=1
do while ((not rsi.eof) and jj<=nss)
%>
<%=(jj+(pages-1)*nss)%>.名称:<%=ubb(rsi("biaoti"))%>;<%=ubb(rsi("rens"))%>人参加;<%=ubb(rsi("txt"))%>;<%=ubb(rsi("ks"))%>金币<br/>
<%
response.write("<a href='/BBS/Function/Index.Asp?idds="&rsi("id")&"&amp;SessionID=" & SessionID & "&amp;kyzc=save&amp;pages="&pages&"'>预定酒席</a><br/>")

			jj = jj + 1
rsi.movenext 
loop

end if
if maxps>1 then
response.write("--------------<br/>")
end if
if pages<maxps then
response.write("<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;pages="&pages+1&"'>下页</a>&nbsp;")
end if
if pages>1 then
response.write("<a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=" & kyzc & "&amp;pages="&pages-1&"'>上页</a>")
end if
if maxps>1 then
response.write("("&pages&"/"&maxps&"/"&aaa&")<br/>")
%>
                    <input name="Pages<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Pages>=maxps then response.write(Pages-1) else response.write(Pages+1)%>"/>页<anchor>跳页
		      <go href="/BBS/Function/Index.Asp?SessionID=<%=SessionID%>&amp;kyzc=<%=kyzc%>" accept-charset='utf-8'>
		            <postfield name="Pages" value="$(Pages<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
rsi.close
set rsi=nothing

response.write("--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main'>返回社区酒店</a><br/>")

Elseif kyzc="save"  then
%>
<card id="main" title="预定酒席" >
<p>
<%
idds=request("idds")
pages=request("pages")
  set rst=Server.CreateObject("ADODB.Recordset")
     qsst="select * from jiudian where Id="&idds
  rst.open qsst,myc,1,2

if rst.eof then 
response.write("ID错误!<br/>")
Else
renshu=rst("rens")
biaoti=rst("biaoti")
ksss=rst("ks")

if ssusejf<ksss then
	response.write "对不起，操作不成功，原因：你的现金不够，去银行取点钱再来吧。预定《"&biaoti&"》酒席;需要<u>"&ksss&"</u>金币,你手头只有<u>"&ssusejf&"</u>枚金币,还差"&ksss-ssusejf&"枚金币<br/>--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main'>返回社区酒店</a><br/>"    
Else
'---开始增加----
set rsw=Server.CreateObject("ADODB.Recordset")
rspl="select * from [yxxe] order by id desc"
rsw.open rspl,myc,1,2
rsw.addnew
rsw("ids")=Session("useid")
rsw("rens")=renshu
rsw("biaoti")=biaoti
rsw.update
rsw.close
set rsw=nothing
  sql="update usereg set usejf=usejf-"&ksss&" where CStr(id)='" & Session("useid") & "'"
  conn.Execute(sql)

	response.write "恭喜您，您的酒宴已经预定成功，快请您的亲朋好友来参加吧。<br/>--------------<br/><a href='/BBS/Function/Index.Asp?SessionID=" & SessionID & "&amp;kyzc=main'>返回社区酒店</a><br/>"
end if
end if

end if
%>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
myc.close
set myc=nothing%>