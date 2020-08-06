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
<card id="card1" title="同级同事"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
idn=request.querystring("idn")
iduse=Session("useid")
lasttlls="33"
lasttls
  dim page,objgbrs
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where zhiye='"&idn&"' order by id"
  objgbrs.open ssql,conn,1,3
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?7=0"
End if
Response.write "共有" & objgbrs.RecordCount & "名用户在该职业<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "</a><br/>"
Response.write "当前职业:"
if objgbrs("gongzuo")=0 then
Response.write "失业<br/>"
end if
if objgbrs("zhiye")=1 then
Response.write "<a href='sylist1.asp?n=1&amp;SessionID=" & SessionID & "'>收发室职员</a><br/>"
end if
if objgbrs("zhiye")=2 then
Response.write "<a href='sylist1.asp?n=2&amp;SessionID=" & SessionID & "'>行政助理</a><br/>"
end if
if objgbrs("zhiye")=3 then
Response.write "<a href='sylist1.asp?n=3&amp;SessionID=" & SessionID & "'>区域推销员</a><br/>"
end if
if objgbrs("zhiye")=4 then
Response.write "<a href='sylist1.asp?n=4&amp;SessionID=" & SessionID & "'>低级主管</a><br/>"
end if
if objgbrs("zhiye")=5 then
Response.write "<a href='sylist1.asp?n=5&amp;SessionID=" & SessionID & "'>项目经理</a><br/>"
end if
if objgbrs("zhiye")=6 then
Response.write "<a href='sylist1.asp?n=6&amp;SessionID=" & SessionID & "'>高级经理</a><br/>"
end if
if objgbrs("zhiye")=7 then
Response.write "<a href='sylist1.asp?n=7&amp;SessionID=" & SessionID & "'>业务总监</a><br/>"
end if
if objgbrs("zhiye")=8 then
Response.write "<a href='sylist1.asp?n=8&amp;SessionID=" & SessionID & "'>副总裁</a><br/>"
end if
if objgbrs("zhiye")=9 then
Response.write "<a href='sylist1.asp?n=9&amp;SessionID=" & SessionID & "'>首席执行官</a><br/>"
end if
if objgbrs("zhiye")=10 then
Response.write "<a href='sylist1.asp?n=10&amp;SessionID=" & SessionID & "'>商业大亨</a><br/>"
end if
if objgbrs("zhiye")=11 then
Response.write "<a href='entlist1.asp?n=1&amp;SessionID=" & SessionID & "'>侍者</a><br/>"
end if
if objgbrs("zhiye")=12 then
Response.write "<a href='entlist1.asp?n=2&amp;SessionID=" & SessionID & "'>群众演员</a><br/>"
end if
if objgbrs("zhiye")=13 then
Response.write "<a href='entlist1.asp?n=3&amp;SessionID=" & SessionID & "'>跑龙套演员</a><br/>"
end if
if objgbrs("zhiye")=14 then
Response.write "<a href='entlist1.asp?n=4&amp;SessionID=" & SessionID & "'>主角替身</a><br/>"
end if
if objgbrs("zhiye")=15 then
Response.write "<a href='entlist1.asp?n=5&amp;SessionID=" & SessionID & "'>新人影星</a><br/>"
end if
if objgbrs("zhiye")=16 then
Response.write "<a href='entlist1.asp?n=6&amp;SessionID=" & SessionID & "'>一般影星</a><br/>"
end if
if objgbrs("zhiye")=17 then
Response.write "<a href='entlist1.asp?n=7&amp;SessionID=" & SessionID & "'>电视名星</a><br/>"
end if
if objgbrs("zhiye")=18 then
Response.write "<a href='entlist1.asp?n=8&amp;SessionID=" & SessionID & "'>影视大腕</a><br/>"
end if
if objgbrs("zhiye")=19 then
Response.write "<a href='entlist1.asp?n=9&amp;SessionID=" & SessionID & "'>演艺明星</a><br/>"
end if
if objgbrs("zhiye")=20 then
Response.write "<a href='entlist1.asp?n=10&amp;SessionID=" & SessionID & "'>超级巨星</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
Response.write ""
If pages<objgbrs.PageCount then
Response.Write "<a href='same.asp?idn="&idn&"&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='same.asp?idn="&idn&"&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
response.write "<input  name='pages' value='2' size='2' format='*N'/>页<anchor>跳页<go method='post' href='/bbs/job/same.asp?idn="&idn&"&amp;SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor>"
End if
  if page=<1 or page>1 then
  End if
Response.Write "<br/>------------<br/>"
  if idn>0 and idn<10 then
Response.Write "<a href='/bbs/job/sy.asp?SessionID=" & SessionID & "'>返回商业广场</a><br/>"
 Else
Response.Write "<a href='/bbs/job/ent.asp?SessionID=" & SessionID & "'>返回娱乐圈</a><br/>"
  End if
Response.write "<a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>



