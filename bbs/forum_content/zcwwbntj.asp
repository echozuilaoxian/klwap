<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
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
iduse=Session("useid")
lasttlls="313"
lasttls
dim jdshow,ForumID
ForumID=request("ForumID")
jdshow=CLng(Session("showjd"))

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

Response.write "<card id='card1' title='" & dlname & "-名人堂'><p>"

bntj="t"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza where bntj='" & bntj & "' and itid='" & ForumID & "' order by id  desc"
  objgbrs.open ssql,conn,1,1
%>
<%
Response.Write "" & dlname & "名人<br/>------------"
if objgbrs.eof then
    Response.write "<br/>" & dlname & "暂时没有名人名贴！"
Else
  objgbrs.PageSize=jdshow
    page=CLng(Request("page"))
  if page<1 then page=1
     if page>objgbrs.pagecount then page=objgbrs.pagecount
          objgbrs.absolutepage=page
        if page=1 then
             bihao=0
          else
             bihao=page*jdshow-jdshow
        End if
For i=1 to objgbrs.PageSize
    bihaocont=bihaocont+1
tjhm=objgbrs("tjhm")
    hfyl=left(objgbrs("biaoti"),5)
   if len(objgbrs("biaoti"))>5 then
    hfyl=hfyl+"..."
   End if
Response.write "<br/>" & bihao+bihaocont & "." & converttowidebaiti(redtjname) & "ID:" & objgbrs("tjhm") & "<br/>[立于" & objgbrs("retimes") & "]<br/>成名贴:<a href='/BBS/Forum_content/BBS_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & objgbrs("id") & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
  Next
     response.write "<br/>------------<br/>"
If Page<objgbrs.PageCount then
     Response.Write "<a href='zcwwbntj.asp?ForumID=" & ForumID & "&amp;page=" & (page+1) & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if

If page>1 then
     Response.Write "&nbsp;" & "<a href='zcwwbntj.asp?ForumID=" & ForumID & "&amp;page=" & (page-1) & "&amp;SessionID=" & SessionID & "'>上一页</a>"
End if
if objgbrs.RecordCount>objgbrs.PageSize then
     response.write "<br/>"
End if
     response.write "&#40;" &  Page & "&#47;" & objgbrs.PageCount & "&#41;" & "共" & objgbrs.RecordCount & "篇"
if objgbrs.PageCount>1 then
     response.write "<a href='#card2'>按页搜索</a>"
End if
End if
     
Response.write "<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
Response.write "<card id='card2' title='按页搜索'><p><input  name='page' value='1' format='*N'/><anchor>GO<go method='post' href='zcwwbntj.asp?SessionID=" & SessionID & "'><postfield name='ForumID' value='" & ForumID & "'/><postfield name='page' value='$(page)'/></go></anchor></p></card></wml>"
%>





