<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
  dim ids,id,page,pages,forumID
  forumID=request("forumID")
  pages=request("pages")
if pages="" or pages<=0 then pages=1
  id=request("id")
  page=request("page")
  ids=Request("ids")

sql="update lthf set rc=rc+1 Where CStr(ids)='" & ids & "'"
conn.Execute(sql)

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&id
objgbrsy.open rspl,conn,1,2

if objgbrsy.eof then
dlnamess="无此帖子"
Else
dlnamess=converttowidebaiti(objgbrsy("biaoti"))
end if
objgbrsy.close
Set objgbrsy= Nothing


  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from lthf Where CStr(ids)='" & ids &"'"
  objgbrs.open ssql,conn,1,2
  if objgbrs.eof then
      response.write "<card id='card1' title='回复列表'><p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if

Response.Write "<card id='card1' title='" & dlnamess & "-" & converttowidebaiti("回复列表")& "'><p>"

if Session("zh")="wap" then
        Response.write "" & converttowidebaiti("游客请:")& "<a href='/bbs/YKSM.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("登陆/注册")& "</a><br/>"
End if

Response.write"" & converttowidebaiti("帖子")& ":<a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?forumID=" & forumID & "&amp;sort=" & sort & "&amp;id=" & id& "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>"&dlnamess&"</a><br/>-------------<br/>"


iduse=Session("useid")
ltname=converttowidebaiti(Session("ltname"))
showwz=CLng(Session("showwz"))

dim pagezz,PageCount,moy
moy=request("moy")
if moy="123" then
pagesize=10000
else
pagesize=showwz
End IF
	pagezz = Request("pagezz")

	IF Not IsEmpty(pagezz) Then
		IF Not IsNumeric(pagezz) Then		
			pagezz=1
		Else
			pagezz=Cint(pagezz)
		End IF
	Else
		pagezz = 1
	End IF

Contents=objgbrs("name")
	StartWords = 1
Lengths=len(Contents)
tjhm=objgbrs("tjhm")
%>

       		<%
                if Lengths>=pagesize and pagezz=1 then
       		Response.Write "<a href='rezcwwcl.asp?forumID=" & forumID & "&amp;pagezz=1&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("ids") & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a>_<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>&#x8BBE;&#x7F6E;</a><br/>"
   		End if%>

       		<%=converttowide(outstr(objgbrs("name"),pagezz))%><br/>-----------<br/>

       		<%
    		if pagezz>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
Response.Write "<a href='rezcwwcl.asp?forumID=" & forumID & "&amp;pagezz=" & pagezz+1 & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("ids") & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if


    		if pagezz<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else         
Response.Write "<a href='rezcwwcl.asp?forumID=" & forumID & "&amp;pagezz=" & pagezz-1 & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("ids") & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>上页</a>"
  End if

		if PageCount<=1 then
		'Response.Write("-------------<br/>")
   		else%>
		(<%=pagezz%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if pagezz>=PageCount then response.write(pagezz-1) else response.write(pagezz+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/bbs/forum_content/rezcwwcl.asp?ForumID=<%=ForumID%>&amp;ID=<%=objgbrs("id")%>&amp;IDs=<%=objgbrs("ids")%>&amp;page=<%=page%>&amp;pages=<%=pages%>&amp;SorT=<%=SorT%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="pagezz" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

if CStr(objgbrs("tjhm"))=CStr(Session("useid")) then
response.write "<a href='rewzjs.asp?forumID=" & forumID & "&amp;ids=" & objgbrs("ids") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;len=" & Length & "&amp;SessionID=" & SessionID & "'>续写</a>|"
                if Lengths>=showwz then
response.write "<a href='hf.asp?forumID=" & forumID & "&amp;ids=" & objgbrs("ids") & "&amp;id=" & objgbrs("id") & "&amp;pagezz=" & pagezz & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编本页") & "</a>|"
response.write "<a href='hf.asp?forumID=" & forumID & "&amp;ids=" & objgbrs("ids") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "&amp;moy=123'>" & converttowidebaiti("编全部") & "</a>|"
		Else
response.write "<a href='hf.asp?forumID=" & forumID & "&amp;ids=" & objgbrs("ids") & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编辑") & "</a>|"
End if
response.write " " & "<a href='redelww.asp?forumID=" & forumID & "&amp;id=" & objgbrs("tjhm") & "&amp;ids=" & objgbrs("ids") & "&amp;idss=" & objgbrs("id") & "&amp;page=" & page & "&amp;debz=t&amp;SessionID=" & SessionID & "'>自删</a>"
End if

if Session("yxxezb")<>"" or Session("yxxexc")<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then
response.write " <a href='redelww.asp?forumID=" & forumID & "&amp;id=" & objgbrs("tjhm") & "&amp;ids=" & objgbrs("ids") & "&amp;idss=" & objgbrs("id") & "&amp;page=" & page & "&amp;debz=t&amp;wap=" & SessionID & "'>删除</a>"
response.write " " & "<a href='redelww.asp?forumID=" & forumID & "&amp;id=" & objgbrs("tjhm") & "&amp;ids=" & objgbrs("ids") & "&amp;idss=" & objgbrs("id") & "&amp;page=" & page & "&amp;debz=f&amp;wap=" & SessionID & "'>留分删</a>"
End if

tjhm=objgbrs("tjhm")
	sqssl="select * from usereg where CStr(id)='" & tjhm & "'"
	set rsSS=conn.execute(sqssl)
	rtjname=rsSS("usename")
set rsSS=nothing

Response.write "<br/>楼主：<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(rtjname) & "ID:" & objgbrs("tjhm") & "</a>"
Response.write "<br/>人气：" & objgbrs("rc") & "<br/>时间：" & objgbrs("times")

response.write "<br/><a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回回复列表</a>"
Response.write "<br/><a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id="& objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回查看原文</a>"
objgbrs.close
Set objgbrs= Nothing

set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&forumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=converttowidebaiti(objgbrssy("name"))
end if
objgbrssy.close
Set objgbrssy= Nothing
Response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & forumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnamse & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
%>
<%
Function outstr(str,pagezz)
	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(pagezz-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if
	outstr=outhtm(str)
end Function%>