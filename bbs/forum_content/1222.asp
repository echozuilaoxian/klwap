<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"--><wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Dim d01(9)
d01(0)="顶礼，论坛有你更精彩!"
d01(1)="好贴大家顶住，论坛有你更加精彩! "
d01(2)="你是论坛友友福音.顶顶。"
d01(3)="顶辛勤发贴的楼主!"
d01(4)="强烈支持!"
d01(5)="向无私奉献的楼主敬意!"
d01(6)="真诚看帖,真心顶帖!"
d01(7)="感谢楼主无私的分享!"
d01(8)="好帖!大力顶上去! "
Randomize
I=Int(Rnd()*9)
adgg=d01(i)

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
forumID=request("forumID")
page=request("page")
id=Request("id")
   if Clng(forumID)<1 then
       response.end
   End if
%>
<!--#include file="contensxx.asp"-->
<%
  dim ky
  ky=request.querystring("ky")
  select case ky
'================================
  case 1
  tip="精华"
'================================
  case 2
  tip="热点"
'================================
  case 3
  tip="推荐"
'================================
  case 4
  tip="热评"
'================================
  case 6
  tip="全部"
'================================
  case 5
  tip="最新"
  end select

Session("returnuppath")=""
  dim id,page,sort
  page=request("page")
  sort=request("sort")
  showwz=CLng(Session("showwz"))
  id=Request("id")
lasttlls=id
lasttls
  sql="update wuza set rc=rc+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and CStr(itid)='"&ForumID&"'"
  objgbrs.open ssql,conn,1,1
  if objgbrs.eof then
      response.write "<card id='card1' title='&#x67E5;&#x770B;&#x8D34;&#x5B50;'><p>&#x6587;&#x7AE0;ID&#x9519;&#x8BEF;&#xFF0C;&#x4F60;&#x6240;&#x67E5;&#x770B;&#x7684;&#x6587;&#x7AE0;&#x53EF;&#x80FD;&#x5DF2;&#x7ECF;&#x88AB;&#x5220;&#x9664;&#x3002;<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" &converttowidebaiti(dlname)& "</a></p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
	iduse=Session("useid")
	ltname=converttowidebaiti(Session("ltname"))
   if objgbrs("jh")="t" then
     jh="[精]"
    else
     jh=""
   End if
   if objgbrs("pic")="k" then
     pics="[图]"
    else
     pics=""
   End if
   if objgbrs("pic")="l" then
     ljj="[链]"
    else
     ljj=""
   End if
   if objgbrs("pic")="r" then
     ruan="[附件]"
    else
     ruan=""
   End if
   if objgbrs("lzdname")="y" then
     yyy="[隐]"
    else
     yyy=""
   End if

   if objgbrs("bntjyy2")="k" then
     tou="[投]"
    else
     tou=""
   End if

   if objgbrs("lijin")="k" then
     lis="[礼]"
    else
     lis=""
   End if

   if objgbrs("maimai")="k" then
     mai="[卖]"
    else
     mai=""
   End if

 if objgbrs("tj")="t" then
     tj="[荐]"
    else
     tj=""
   End if
 if objgbrs("hd")="t" then
     hd="[活]"
    else
     hd=""
   End if
 if objgbrs("bntj")="t" then
   bntj="[名]"
    else
     bntj=""
   End if
 if objgbrs("bntjyy1")="t" then
    bnt="[锁]"
    else
     bnt=""
   End if
   if objgbrs("times")="2100-10-10 12:12:12" then
     zd="[顶]"
    else
     zd=""
   end if
if objgbrs("times")="2000-10-10 12:12:12" then
     sd="[底]"
 else 
 sd=""
End if
 if objgbrs("a")="t" then
      ggg="[告]"
    else
     ggg=""
   End if
    	tjhm=objgbrs("tjhm")
    	hfyl=left(objgbrs("biaoti"),80)
   	if len(objgbrs("biaoti"))>80 then
    		hfyl=hfyl+"..."
   	End if
Response.Write"<card id='card1' title='" & converttowidebaiti(hfyl) & "'><p>"
if lycount>0 then
      Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;Sort=" & Sort & ""
End if
Response.Write"&#x4E3B;&#x9898;:<b><u>" & converttowidebaiti(ggg) & converttowidebaiti(zd) & converttowidebaiti(yyy) & converttowidebaiti(jh) & converttowidebaiti(tj) & converttowidebaiti(hd) & converttowidebaiti(bntj) & converttowidebaiti(pics) & converttowidebaiti(ljj) & converttowidebaiti(ruan) & converttowidebaiti(tou) & converttowidebaiti(lis) & converttowidebaiti(mai) 
Response.Write converttowidebaiti(objgbrs("biaoti")) & "</u></b><br/>"

                Response.write "&#x697C;&#x4E3B;:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "ID:" & objgbrs("tjhm") & frionline &"</a><br/>"
                Response.write "<img src='/bbs/forum_content/xh.gif'  alt='&#x82B1;'/>" & objgbrs("rcx") & "&nbsp;<img src='/bbs/forum_content/rd.gif'  alt='&#x86CB;'/>" & objgbrs("hfcontd") & "<br/>"
   		Response.write "" & objgbrs("retimes")
                Response.write "<br/>-------------<br/>"
dim spage,PageCount,moy
moy=request("moy")
if moy="123" then
pagesize=100000
else
pagesize=showwz
End IF


    set fso=server.CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(Server.MapPath("File/File/"&id&".txt"),1)  
    Do  While  Not  f.AtEndOfStream    
    aaacc=f.ReadAll
    loop
    f.close
    set f=nothing
    set fso=nothing



	Spage = Request("Spage")

	IF Not IsEmpty(Spage) Then
		IF Not IsNumeric(Spage) Then		
			Spage=1
		Else
			Spage=Cint(Spage)
		End IF
	Else
		Spage = 1
	End IF

i=request("i")
if isnull(i) or i="" then i=0
Contents=aaacc
	StartWords = 1
Lengths=len(Contents)
tjhm=objgbrs("tjhm")

if objgbrs("lzdname")="y" then
	dim rs
	set rs=Server.CreateObject("ADODB.Recordset")
	sql="select tjhm from lthf where cstr(id)='" & id & "' and cstr(tjhm)='"&iduse&"'"
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	Response.write "&#x3010;&#x7CFB;&#x7EDF;&#x63D0;&#x793A;&#x3011;:<u>&#x4EE5;&#x4E0B;&#x5185;&#x5BB9;&#x9690;&#x85CF;,&#x9700;&#x8981;&#x4F60;&#x56DE;&#x590D;&#x540E;&#x624D;&#x80FD;&#x67E5;&#x770B;</u><br/>-----------<br/>"
	else
		rs.close
		Set rs=nothing%>
       		<%
                if Lengths>=pagesize and Spage=1 then
       		Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a>_<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>&#x8BBE;&#x7F6E;</a><br/>"
   		End if%>
       		<%=converttowide(outstr(Contents,Spage))%><br/>-----------<br/>

       		<%if objgbrs("retimes")<>objgbrs("xiugaitime") and Spage=pagecount then
       		Response.Write ""&converttowidebaiti("作者于")&""&objgbrs("xiugaitime")& ""&converttowidebaiti("编辑过帖子")&"<br/>-------------<br/>"
   		End if%>
       		<%
    		if Spage>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
       		Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage+1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
   		end if

    		if Spage<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else        
       			Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage-1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
   		end if
		if PageCount<=1 then
		'Response.Write("-------------<br/>")
   		else%>
		(<%=Spage%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Spage>=PageCount then response.write(Spage-1) else response.write(Spage+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=objgbrs("id")%>&amp;page=<%=page%>&amp;SorT=<%=SorT%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="Spage" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
       		end if

else
                if Lengths>=pagesize and Spage=1 then
       		Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;sort=" & sort & "&amp;SessionID=" & SessionID & "&amp;moy=123'>(&#x5168;&#x6587;" &Lengths& "&#x5B57;)</a>_<a href='/bbs/public/shownum.asp?sspage=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "&amp;ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;id=" & id & "&amp;spage=" & spage & "&amp;page=" & page & "'>&#x8BBE;&#x7F6E;</a><br/>"
   		End if%>

       		<%=converttowide(outstr(aaacc,Spage))%><br/>

<%response.write "<br/><a href='File/File/"&id&".txt'>下载本贴TXT文件</a><br/>"%>
<%if objgbrs("vote")<>"" then 
if objgbrs("vote")<>"" then vote=split(converttowide(objgbrs("vote")),"\")
if objgbrs("addvote")<>"" then addvote=split(converttowide(objgbrs("addvote")),"\")
if objgbrs("voteid")<>"" then voteid=split(converttowide(objgbrs("voteid")),"\")
Response.Write "-------------<br/>"
if objgbrs("voteid")<>"" then
for i=0 to ubound(voteid)
if voteid(i)<>"" then
if cint(voteid(i))=session("useid") then votesa="true"
end if
next
end if
for i=0 to ubound(addvote)
if addvote(i)<>"" then
votecoun=votecoun+cint(addvote(i))
end if
next
if votesa<>"true" then%>
<%
for i=0 to ubound(vote)
if vote(i)<>"" then %>
<%=i+1%>.<%=vote(i)%> <a href='/BBS/Forum_content/forum_votesave.asp?voteid=<%=i%>&amp;id=<%=id%>&amp;forumID=<%=forumID%>&amp;Page=<%=page%>&amp;Sort=<%=sort%>&amp;SessionID=<%=SessionID%>&amp;Spage=<%=spage%>'><%=converttowidebaiti("投票")%></a><br/>
<%end if
next%>
<%end if
if votesa="true" then%>
<%=converttowidebaiti("投票结果:共")%><b><%=votecoun%></b><%=converttowidebaiti("票")%><br/>
<%for i=0 to ubound(vote)
if vote(i)<>"" then 
if votecoun<>0 then%>
<%=i+1%>.<%=vote(i)%>:<b><%=addvote(i)%></b><%=converttowidebaiti("票")%><b><%=round(cint(addvote(i))*100/votecoun,0)%>%</b><br/>
<%
end if
end if
next%>
					<%end if%>
					<%end if%>
-------------<br/>
       		<%if objgbrs("retimes")<>objgbrs("xiugaitime") and Spage=pagecount then
       		Response.Write ""&converttowidebaiti("作者于")&""&objgbrs("xiugaitime")& ""&converttowidebaiti("编辑过帖子")&"<br/>-------------<br/>"
   		End if%>
<%
    		if Spage>=PageCount then
        	'Response.Write ("&#x4E0B;&#x9875;")        
   		 else
       		Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage+1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0B;&#x9875;</a>"
   		end if

    		if Spage<=1 then
        	'Response.Write ("&#x4E0A;&#x9875;")
    		else        
       			Response.Write "<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;Spage=" & Spage-1 & "&amp;ID=" & objgbrs("id") & "&amp;Page=" & page & "&amp;SorT=" & sort & "&amp;SessionID=" & SessionID & "'>&#x4E0A;&#x9875;</a>"
   		end if
		if PageCount<=1 then
		'Response.Write("-------------<br/>")
   		else%>
		(<%=Spage%>/<%=PageCount%>/<%=Lengths%>)<br/>

	         <%end if%>
		<%if PageCount>1 then%>
		<input name="p<%=minute(now)%><%=second(now)%>" title="&#x9875;&#x7801;" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Spage>=PageCount then response.write(Spage-1) else response.write(Spage+1)%>"/>&#x9875;
		<anchor>&#x8DF3;&#x9875;
		      <go href="/bbs/forum_content/BBs_receipt_ByContent.Asp?ForumID=<%=ForumID%>&amp;ID=<%=objgbrs("id")%>&amp;page=<%=page%>&amp;SorT=<%=SorT%>&amp;SessionID=<%=SessionID%>" accept-charset='utf-8'>
		            <postfield name="Spage" value="$(p<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
if CStr(objgbrs("tjhm"))=CStr(Session("useid")) then
response.write "<a href='/BBS/Forum_content/Forum_wzjs.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;len=" & Lengths & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续贴") & "</a>|"
response.write "<a href='/BBS/Wapcs/Tjwzimgjz.Asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("续传") & "</a>|"
                if Lengths>=showwz then
response.write "<a href='/BBS/Forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;Spage=" & Spage & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编本页") & "</a>|"
response.write "<a href='/BBS/Forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "&amp;moy=123'>" & converttowidebaiti("编全部") & "</a>|"
		Else
response.write "<a href='/BBS/Forum_content/Forum_Xgwz.asp?forumID=" & forumID & "&amp;id=" & objgbrs("id") & "&amp;Spage=" & Spage & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("编辑") & "</a>|"
End if
 if objgbrs("hfcont")>50 or objgbrs("jh")="t" then
       response.write "" & converttowidebaiti("自删")&"<br/>"
  else
       response.write "<a href='/BBS/Forum_ContenT/Forum_DelWw.asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;ids=" & objgbrs("tjhm") & "&amp;page=" & page & "&amp;debz=t" & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("自删")&"</a><br/>"
 End if
End if

end if
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from lthf where id='" & id & "' order by times desc"
objgbrs.open ssql,conn,1,3
aaa=objgbrs.RecordCount
if objgbrs.eof then
Response.write "&#x6682;&#x65E0;&#x56DE;&#x590D;"
else
Response.Write"<a href='/BBS/Forum_content/Receiptlist.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x770B;&#x56DE;&#x590D;:" & aaa & "&#x6761;</a><br/>"
Response.write "&#x6700;&#x65B0;&#x56DE;&#x590D;:"

bihao=0
For k=1 to 3
bihaocont=bihaocont+1
ids=objgbrs("ids")
Content=left(objgbrs("name"),60)
if len(objgbrs("name"))>60 then
Content=Content+"(url=/BBS/Forum_content/Rezcwwcl.asp?ForumID="&ForumID&"&ID="&id&"&ids="&ids&"&Page="&page&"&SessionID="&SessionID&")详...(/url)"
End if
tjhm=objgbrs("tjhm")
Response.Write "<br/>"
Response.Write objgbrs.RecordCount-CLng(bihao+bihaocont)+1 & ""&converttowidebaiti("楼:")&""
Response.write "<a href='/BBS/reg/useinfo.asp?id=" & objgbrs("tjhm") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a>:" & converttowide(UBBCodes(Content))
Response.write"(" & String(2-Len(Month(objgbrs("times"))),"0") & Month(objgbrs("times")) & "-" & String(2-len(Day(objgbrs("times"))),"0") & Day(objgbrs("times")) & " &nbsp;" & String(2-Len(hour(objgbrs("times"))),"0") & hour(objgbrs("times"))  & ":" & String(2-Len(minute(objgbrs("times"))),"0") & minute(objgbrs("times")) & ")"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
Application.Lock
conn.Execute(ssql)
Application.Unlock

set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,1
tjhm=objgbrs("tjhm")
 if objgbrs("times")="2000-10-10 12:12:12" then
Response.write "<br/>[&#x5E16;&#x5B50;&#x56FA;&#x5E95;]"
else
 if objgbrs("bntjyy1")="t" then
Response.write "<br/>[&#x5E16;&#x5B50;&#x9501;&#x5B9A;]"
else
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&"&amp;page="&page&"&amp;ForumID="&ForumID&""
        Response.write "<br/>-------------<br/>&#x7ACB;&#x5373;<a href='/BBS/UseLogiN.Asp?SessionID=" & SessionID & "'>&#x767B;&#x9646;</a>"
      else
kyaa1="我顶!"
kyaa2="支持!"
kyaa3="反对!"
%>
<br/>-------------<br/>
&#x5FEB;&#x901F;&#x56DE;&#x590D;
<br/><anchor>&#x6211;&#x9876;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa1)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>&#x25C6;<anchor>&#x652F;&#x6301;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa2)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>&#x25C6;<anchor>&#x53CD;&#x5BF9;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="<%=converttowidebaiti(kyaa3)%>"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>
<br/><input type="text" name="name<%=minute(now)%><%=second(now)%>" maxlength="300" value="<%=converttowidebaiti(adgg)%>" size="12"/>
<anchor>&#x56DE;&#x590D;<go method="post" href='/bbs/forum_content/forum_receipt.Asp?SessionID=<%=SessionID%>'><postfield name="name" value="$(name<%=minute(now)%><%=second(now)%>)"/><%
 if objgbrs("times")="2000-10-10 12:12:12" then
       Response.write ""
  else
 if objgbrs("bntjyy1")="t" then
       Response.write ""
  else
       Response.write "<postfield name='id' value='" & id & "'/>"
       Response.write "<postfield name='page' value='" & page & "'/>"
       Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
 end if
 end if
%></go></anchor>
<%
Response.Write "<br/><a href='TopicActionFlower.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8D60;&#x9001;&#x9C9C;&#x82B1;</a>"
Response.Write "<br/><a href='TopicActionEgg.Asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x7838;&#x4ED6;&#x9E21;&#x86CB;</a>"
Response.Write "<br/><a href='reselimg.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8868;&#x60C5;&#x56DE;&#x590D;</a>"
Response.Write "<br/><a href='Forum_myimg.asp?ForumID=" & ForumID & "&amp;ID=" & id & "&amp;Page=" & page & "&amp;SessionID=" & SessionID & "'>&#x56FE;&#x6587;&#x56DE;&#x590D;</a>"
end if
end if
end if
if Session("zh")="wap" then
'response.write "&#x7BA1;&#x7406;&#x4E3B;&#x5E16;"
  else
response.write "<br/><a href='Forum_AdminTopic.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x7BA1;&#x7406;&#x4E3B;&#x5E16;</a>"
end if


set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

Response.write "<br/>-------------<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=" & ForumID & "&amp;sort=" & sort & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" & converttowidebaiti(dlname) & "</a>"
if ky<>"" then
Response.write "<br/><a href='Top.asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;Ky=" & ky & "&amp;SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;" & converttowidebaiti(tip) & "&#x5E16;&#x5B50;</a>"
end if
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>&#x8FD4;&#x56DE;&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>"
%>
<small><% 
dim kkwap,distime
kkwap=""
KYAA=right(""&WeekDayName(DatePart("w",Now)),1)
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write converttowidebaiti(KYAA)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small>
</p></card></wml>
<%
objgbrs.close
Set objgbrs=nothing
conn.close
set conn=nothing
Function frionline()
  page=request("page")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
  objgbrr.open ssql,conn
  if not objgbrr.eof then
  frionline="<img src='/bbs/forum_content/online_m.gif'  alt='&#x5728;&#x7EBF;'/>"
  else
  frionline="<img src='/bbs/forum_content/offline.gif'  alt='&#x79BB;&#x7EBF;'/>"
  end if
  set objgbrr=nothing
End function

%>
<%
Function outstr(str,spage)
	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(spage-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if
	outstr=outhtm(str)
end Function

Public Function ReadTextFile(ByVal Fname,ByVal Folder_Name)
  Dim M_fso,FnameN,Fnr
Folder_Name="File"
  ReadTextFile=""
  Set M_fso = CreateObject("Scripting.FileSystemObject")
 If M_fso.FolderExists(Server.Mappath("File/"&Folder_Name))=False Then
  Call xkon_Error("读取信息失败")
 End If
  Set FnameN= M_fso.OpenTextFile(Server.Mappath("File/"&Folder_Name&"/"&ID&".Txt"),1,True)
   Fnr=FnameN.ReadAll
  FnameN.Close
  Set M_fso = Nothing
  ReadTextFile=Fnr
End Function
%>