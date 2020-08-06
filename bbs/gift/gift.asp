<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="车房超市" >
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
set rs13=Server.CreateObject("ADODB.Recordset")
strsQL="select ids from wupin where cstr(ids)='"&iduse& "'"
rs13.open strsQL,Conn,1,2
if rs13.recordcount<1 then
rs13.addnew
rs13("ids")=iduse
rs13.update
end if
        rs13.Close
	Set rs13=Nothing

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if
%>
<img src="/bbs/huo11.gif" alt=""/><a href="/BBS/xz/xz.Asp?SessionID=<%=SessionID%>">勋章商城</a><br/>
<%
if kyzc="" then
  select case ky

'================================
  case 9
  tip="汽车公司"
  StrFont="<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=" & SessionID & "'>二手市场</a>|<a href='/bbs/gift/gift.asp?ky=10&amp;SessionID=" & SessionID & "'>地产公司</a><br/>"
'================================
  case 10
  tip="地产公司"
  StrFont="<a href='/BBS/GifT/shou.Asp?kyzc=buy&amp;SessionID=" & SessionID & "'>二手市场</a>|<a href='/bbs/gift/gift.asp?ky=9&amp;SessionID=" & SessionID & "'>汽车公司</a><br/>"
 end select
response.write StrFont

page=int(request("page"))
n=int(request("n"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=5
end if

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from gift Where CStr(fenlei)='"&ky&"' order by id asc"
rs.open rspl,conn,1,1
a=rs.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp

if a=0 then
response.write("------------<br/>该类暂无记录<br/>")
end if

if a>0 then
response.write(""&tip&"-有"&a&"条记录<br/>")
end if

if a>0 then
rs.Move((page-1)*ns)
dim j
j=1
do while ((not rs.eof) and j<=ns)
%>
<%=(j+(page-1)*ns)%>:<img src="/bbs/gift/<%=rs("id")%>.jpg" alt="wap"/><br/>
<%=ubb(rs("yname"))%>,<%=ubb(rs("xyyz"))%>金币<br/>
<anchor>购买
		<go href="/BBS/GifT/GifT.Asp?kyzc=go&amp;SessionID=<%=SessionID%>" method="post">
		<postfield name="id" value="<%=rs("id")%>" />
		<postfield name="page" value="<%=page%>" />
		<postfield name="ky" value="<%=ky%>" />
		</go>
		</anchor><br/>
<%
			j = j + 1
rs.movenext 
loop

end if
if page<maxp then
response.write("<a href='/bbs/gift/gift.asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/bbs/gift/gift.asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/bbs/gift/gift.asp?SessionID=<%=SessionID%>&amp;ky=<%=ky%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rs.close
set rs=nothing


elseif kyzc="go" then 

ids=request("id")
page=request("page")
ky=request("ky")
set rsss=Server.CreateObject("ADODB.Recordset")
rsspl="select * from gift Where CStr(id)="&ids
rsss.open rsspl,conn,1,2
if rsss.eof and rsss.bof then
	response.write "本店没有这个物品啊，请正确选择?<br/>"
else
xyyz=rsss("xyyz")
xyyzs=clng(xyyz/2)
yname=rsss("yname")

   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<xyyz then
	response.write "对不起! 金币不足无法购买！物品：<u>"&yname&"</u>价格：<u>"&xyyz&"</u>金币,你手头只有<u>"&objgbrs("usejf")&"</u>枚金币,还差"&xyyz-objgbrs("usejf")&"枚金币.<a href='/bbs/gift/gift.asp?SessionID="&SessionID&"&amp;ky="&ky&"&amp;page="&page&"'>返回继续选购</a><br/>"
    objgbrs.close
 set objgbrs=nothing

else

sql="update wupin set wp"&ids&"=wp"&ids&"+1 where cstr(ids)="&iduse
  conn.Execute(sql)
sql="update usereg set usejf=usejf-"&xyyz&" where cstr(id)="&iduse
  conn.Execute(sql)
msg="购买物品成功！您花"&xyyz&"金币购买了"&yname&".请到我的地盘&gt;我的物品中查看以及应用！<br/><a href='/bbs/gift/gift.asp?SessionID="&SessionID&"&amp;ky="&ky&"&amp;page="&page&"'>继续选购</a><br/>"
    rsss.close
 set rsss=nothing

	response.write msg
end if
end if
end if
%>
----------<br/>

<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>