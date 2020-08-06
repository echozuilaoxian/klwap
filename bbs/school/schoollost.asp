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
<card id="card1" title="弃学学生"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
idn=request.querystring("idn")
iduse=Session("useid")
lasttlls="156"
lasttls
  dim page,objgbrs
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where nianji>'0' and xf<0 order by id"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
Response.write"嘿嘿，还没有人退学<br/>"
Response.write "<br/>------------<br/><a href='/bbs/school/ph.asp?SessionID="&SessionID&"'>返回排行榜</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&now&"</p></card></wml>"
objgbrs.close
set objgbrs=nothing
response.end
end if
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "8=8"
End if
Response.write "共有" & objgbrs.RecordCount & "名用户弃学<br/>"
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "</a><br/>"
Response.write "年级:"
if objgbrs("nianji")=0 then
Response.write "未读过书<br/>"
end if
if objgbrs("xf")=-1 then
Response.write "曾读小学一年级<br/>"
end if
if objgbrs("nianji")=1 and objgbrs("xf")>=0 then
Response.write "小学一年级<br/>"
end if
if objgbrs("xf")=-2 then
Response.write "曾读小学二年级<br/>"
end if
if objgbrs("nianji")=2 and objgbrs("xf")>=0 then
Response.write "小学二年级<br/>"
end if
if objgbrs("xf")=-3 then
Response.write "曾读小学三年级<br/>"
end if
if objgbrs("nianji")=3 and objgbrs("xf")>=0 then
Response.write "小学三年级<br/>"
end if
if objgbrs("xf")=-4 then
Response.write "曾读小学四年级<br/>"
end if
if objgbrs("nianji")=4 and objgbrs("xf")>=0 then
Response.write "小学四年级<br/>"
end if
if objgbrs("xf")=-5 then
Response.write "曾读小学五年级<br/>"
end if
if objgbrs("nianji")=5 and objgbrs("xf")>=0 then
Response.write "小学五年级<br/>"
end if
if objgbrs("xf")=-6 then
Response.write "曾读小学六年级<br/>"
end if
if objgbrs("nianji")=6 and objgbrs("xf")>=0 then
Response.write "小学六年级<br/>"
end if
if objgbrs("xf")=-7 then
Response.write "曾读初一<br/>"
end if
if objgbrs("nianji")=7 and objgbrs("xf")>=0 then
Response.write "初一<br/>"
end if
if objgbrs("xf")=-8 then
Response.write "曾读初二<br/>"
end if
if objgbrs("nianji")=8 and objgbrs("xf")>=0 then
Response.write "初二<br/>"
end if
if objgbrs("xf")=-9 then
Response.write "曾读初三<br/>"
end if
if objgbrs("nianji")=9 and objgbrs("xf")>=0 then
Response.write "初三<br/>"
end if
if objgbrs("xf")=-10 then
Response.write "曾读高一<br/>"
end if
if objgbrs("nianji")=10 and objgbrs("xf")>=0 then
Response.write "高一<br/>"
end if
if objgbrs("xf")=-11 then
Response.write "曾读高二<br/>"
end if
if objgbrs("nianji")=11 and objgbrs("xf")>=0 then
Response.write "高二<br/>"
end if
if objgbrs("xf")=-12 then
Response.write "曾读高三<br/>"
end if
if objgbrs("nianji")=12 and objgbrs("xf")>=0 then
Response.write "高三<br/>"
end if
if objgbrs("xf")=-13 then
Response.write "曾读大一<br/>"
end if
if objgbrs("nianji")=13 and objgbrs("xf")>=0 then
Response.write "大一<br/>"
end if
if objgbrs("xf")=-14 then
Response.write "曾读大二<br/>"
end if
if objgbrs("nianji")=14 and objgbrs("xf")>=0 then
Response.write "大二<br/>"
end if
if objgbrs("xf")=-15 then
Response.write "曾读大三<br/>"
end if
if objgbrs("nianji")=15 and objgbrs("xf")>=0 then
Response.write "大三<br/>"
end if
if objgbrs("xf")=-16 then
Response.write "曾读大四<br/>"
end if
if objgbrs("nianji")=16 and objgbrs("xf")>=0 then
Response.write "大四<br/>"
end if
if objgbrs("xf")=-17 then
Response.write "硕士生<br/>"
end if
if objgbrs("nianji")=17 and objgbrs("xf")>=0 then
Response.write "硕士<br/>"
end if
if objgbrs("xf")=-18 then
Response.write "博士生<br/>"
end if
if objgbrs("nianji")=18 and objgbrs("xf")>=0 then
Response.write "博士<br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
Response.write ""
If pages<objgbrs.PageCount then
Response.Write "<a href='/bbs/school/schoollost.asp?idn="&idn&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='/bbs/school/schoollost.asp?idn="&idn&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
response.write "<input  name='pages' value='2' size='2' format='*N'/><anchor>跳页<go method='post' href='/bbs/school/schoollost.asp?SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>"
End if
  if page=<1 or page>1 then
  End if

Response.write "<br/>------------<br/><a href='/bbs/school/ph.asp?SessionID="&SessionID&"'>返回排行榜</a><br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&now&"</p></card></wml>"
conn.close
set objgbrs=nothing
set conn=nothing
%>
