<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================

'============================================================ 
%>
<% Response.ContentType="text/vnd.wap.wml" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn.asp" -->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%id=request.QueryString("id")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from sms where ID="&id
rs.open sql,conn,1,3
%>
<card title="<%=ubb1(rs("title"))%>"><p> 
<%dim ids,p
p=cint(request.QueryString("p"))
ids=cint(request.QueryString("class"))
set rsnum7=Server.CreateObject("ADODB.Recordset")
rssnum7="select * from [twapp]"
rsnum7.open rssnum7,conn,1,1
wznum=rsnum7("wznum")
rsnum7.close   
set rsnum7=nothing

If Not rs.eof	Then
Dim gopage,PS,conlen,page,pagecount,ys,startc
Content=rs("test")
rs("hit")=rs("hit")+1
rs.update()
end if
Response.Write	"<anchor>上级<prev/></anchor> "
Response.Write	"<a href='list.asp?class="&ids&"&amp;hk="&hk&"'>栏目</a> "
Response.Write	"<a href='/index.asp?hk="&hk&"'>首页</a><br/>"
Response.Write	""&ubb1(rs("title"))&"<br/>"
Response.Write	"作者:"&ubb1(rs("user"))&"<br/>"
Response.Write	"日期:"&ubb1(rs("date"))&"<br/>"
Response.Write	"人气:"&ubb1(rs("hit"))&"<br/>"
if rs("pic")<>"" then
Response.Write	"<img src='"&rs("pic")&"' alt='load...'/><br/>"
end if
if request.querystring("o")<>1 then
dim pageWordNum,StartWord,Content,Length,PageAll,i,ii
pageWordNum=clng(wznum)
StartWord = 1
Content=rs("test")
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
ii=clng(request("ii"))
i=clng(request("i"))
if ii<>0 then i=ii-1
if isnull(i) or i="" then i=0

	dim ccc,sss
	ccc=instr(content,"||")
	if ccc>0 then
	sss=split(content,"||")
	PageAll=ubound(sss)+1
		if i>PageAll-1 then i=PageAll-1
	content = sss(i)

	else
		if clng(i)>int(PageAll) then i=PageAll-1
	Content = mid(Content,StartWord+i*PageWordNum,PageWordNum)
	end if
response.write("-----------<br/>" & ubb2(content) & "")
if 0<=i<PageAll then
       Response.Write "<br/>"
end if
   if cint(i)<cint(PageAll)-1 then
       Response.Write "<a href='view.asp?class="&ids&"&amp;id=" &  rs("id") & "&amp;i=" & i+1 & "&amp;p=" & p & "&amp;hk="&hk&"'>下页</a>"
   End if
   if cint(i)>0 then 
   Response.Write "&nbsp;" & "<a href='view.asp?class="&ids&"&amp;id=" &  rs("id") & "&amp;i=" & i-1 & "&amp;p=" & p & "&amp;hk="&hk&"'>上页</a>"
		if  i<pageall-1 then Response.Write "&nbsp;<a href='view.asp?class="&ids&"&amp;id=" &  rs("id") & "&amp;i=100&amp;p=" & p & "&amp;hk="&hk&"'>尾页</a>"
   End if
if PageAll>1 then
response.write ("&nbsp;<a href='view.asp?id=" &  rs("id") & "&amp;class="&ids&"&amp;p="&p&"&amp;hk="&hk&"&amp;o=1'>全文</a>")
       response.write "(" & i+1 & "/" & PageAll & ")"
%>
<br/>第<input name="i<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="2" value="<%response.write(i+2)%>" maxlength="2"/>
<anchor>跳页
    <go href="view.asp?id=<%=id%>&amp;class=<%=ids%>&amp;p=<%=p%>&amp;hk=<%=hk%>" accept-charset='utf-8'>
        <postfield name="ii" value="$(i<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor>
<%
end if
else
response.write("-----------<br/>" &ubb2(content) & "")
response.write ("<br/><a href='view.asp?id=" &  rs("id") & "&amp;class="&ids&"&amp;p="&p&"&amp;hk="&hk&"'>分页查看内容</a>")
end if 
rs.close
set rs=nothing
set rs1=server.createobject("adodb.recordset")
sql="select top 1 ID,test,title,classid from sms where id<"&id&" order by id desc"
rs1.open sql,conn,1,1
Response.Write	("<br/>")
if rs1.recordcount>0 then
%>
下一篇:<a href="view.asp?id=<%=rs1("id")%>&amp;class=<%=rs1("classid")%>&amp;hk=<%=hk%>&amp;p=<%=p%>"><%=ubb(rs1("title"))%></a><br/>
<%
end if
set rs2=server.createobject("adodb.recordset")
sql="select top 1 ID,test,title,classid from sms where id>"&id&" order by id asc"
rs2.open sql,conn,1,1
if rs2.recordcount>0 then
%>
上一篇:<a href="view.asp?id=<%=rs2("id")%>&amp;class=<%=rs2("classid")%>&amp;hk=<%=hk%>&amp;p=<%=p%>"><%=ubb(rs2("title"))%></a>
<%end if%>
<br/><input type="text" name="pl" title="输入内容" value="" maxlength="500"/><br/>
<anchor title="确定">发表评论
<go method="post" href="plpl.asp?id=<%=id%>&amp;class=<%=ids%>&amp;hk=<%=hk%>&amp;p=<%=p%>">
<postfield name="pl" value="$(pl)"/>
</go></anchor>|<a href='pl.asp?id=<%=id%>&amp;class=<%=ids%>&amp;hk=<%=hk%>&amp;p=<%=p%>'>看评论</a>
<br/>
<%set rs2=Server.CreateObject("ADODB.Recordset")
rsstr="select * from pl where smsid="&id&" order by id desc"
rs2.open rsstr,conn,1,1
if rs2.eof then 
response.write("还没有任何评论！<br/>")
else
rs2.Move(0)
dim gp
gp=1
do while ((not rs2.EOF) and gp <=3)%>
<%=gp%>楼:<%=UBB(left(rs2("pl"),15))%><br/>
<%
rs2.MoveNext
gp=gp+1
loop
end if
rs2.close
set rs2=nothing 
%>
==随机推荐==<br/>
<% Dim a
a=1
Do While a<=5
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="Select top 5 * from sms where classid="&ids
rs1.open sql1,conn,1,1
if rs1.eof then 
response.write("还没有文章呀！<br/>")
else
 randomize
sjj=int(rnd()*rs1.recordcount)+1
rs1.absoluteposition=sjj %>
<a href='view.asp?id=<%=rs1("ID")%>&amp;class=<%=ids%>&amp;hk=<%=hk%>&amp;p=<%=p%>'><%=UBB(rs1("title"))%></a><br/>
<%
end if
a=a+1
Loop
rs1.close
set rs1=nothing 
conn.close   
set conn=nothing
%>
－－－－－<br/> 
<%if p<>"" then%>
<a href='list.asp?class=<%=ids%>&amp;page=<%=p%>&amp;hk=<%=hk%>'>返回列表</a><br/>
<%end if%>
<a href='list.asp?class=<%=ids%>&amp;hk=<%=hk%>'>返回栏目</a><br/>
<a href='/index.asp?hk=<%=hk%>'>返回首页</a>
</p>
</card>
</wml> 