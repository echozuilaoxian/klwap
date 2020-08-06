<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的书包"><p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="317"
lasttls
 dim page,objgbrs,ids,ForumID,pages,id
  page=request("page")
ForumID=request("ForumID")
id=request("id")
pages=request("pages")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & iduse & " order by times desc"
  objgbrs.open ssql,conn,3,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & "&amp;ID=" & ID & "&amp;page=" & page & ""
End if
if objgbrs.eof then
    response.write "你暂时没有收藏或者没有上传,快去上传或者到论坛的图铃贴收藏吧"
  else
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
Response.write "你有" & objgbrs.RecordCount & "张图片<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
if objgbrs("bz")="1" then
bz="[相册]"
else
bz=""
End if
Response.write bihao+bihaocont & "." & "<anchor>" &  bz & converttowidebaiti(objgbrs("niayo")) & "<go method='post' href=""Forum_hfimg.asp?ForumID="&ForumID&"&amp;id="&id&"&amp;page="&page&"&amp;SessionID="&SessionID&"""><postfield name='img' value='" & objgbrs("xclink") & "'/><postfield name='imgs' value='(img)" & objgbrs("xclink") & "(/img)'/><postfield name='min' value='" & objgbrs("niayo") & "'/></go></anchor><br/>"
Response.write "<img src='" & objgbrs("xclink") & "' width='25' height='22' alt='图片'/><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='Forum_myimg.asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='Forum_myimg.asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if

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
%>
<br/><a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回查看原文</a><br/>
<a href="/BBS/Forum_Content/ContentlisT.Asp?ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">返回<%=dlname%></a><br/></p></card></wml>
<%
conn.close
set objgbrs=nothing
Set conn = Nothing%>