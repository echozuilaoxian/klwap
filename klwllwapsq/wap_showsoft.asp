<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<!--#include file="ubbcode1.asp" -->
<!--#include file="gps.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
page=int(request("page"))

if page="" or page<=0 then
page=1
end if

if nt="" or nt<=0 then
nt=5
end if

  dim sort,desc,wheretmp,mytitle,toptmp
  sort=request.querystring("sort")
  if sort="" then
	sort=1
  end if
  select case sort
'================================
  case 1
  wheretmp=" where DATEDIFF('d', ids, now()) < 5880"
  desc="Id"
  tip="网友最新上传照片"
  mytitle="最新上传照片"
  StrFont="最新 <a href='"&name&"?sort=2&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最热</a> <a href='"&name&"?sort=3&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最多评论</a>"
'================================
  case 2
  wheretmp=" where DATEDIFF('d', ids, now()) < 5880"
  desc="downloadcount"
  tip="网友点击最多照片"
  mytitle="点击最多照片"
  StrFont="<a href='"&name&"?sort=1&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最新</a> 最热 <a href='"&name&"?sort=3&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最多评论</a>"
'================================
  case 3
  wheretmp=" where DATEDIFF('d', ids, now()) < 5880"
  desc="re"
  tip="网友评论最多照片"
  mytitle="评论最多照片"
  StrFont="<a href='"&name&"?sort=1&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最新</a> <a href='"&name&"?sort=2&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最热</a> 最多评论"
'================================
  case else
  desc="Id"
  tip="网友最新上传照片"
  mytitle="最新上传照片"
  StrFont="最新 <a href='"&name&"?sort=2&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最热</a> <a href='"&name&"?sort=3&amp;n=" & n & "&amp;ns=" & ns & "&amp;adminmid="&request("adminmid")&"'>最多评论</a>"
  end select
%>
<card id="card1" title="后台管理—<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time) & " " & mytitle %>"><p>
<%

response.write("" & tip & "<br/>")
response.write StrFont
set rs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
  sql="select "&toptmp&" id,explain,title,ids,re,datadir,downloadcount from data " & wheretmp & " order by "& desc &" desc "
  rs.open sql,conn,1,1
a=rs.recordcount
maxp=(a-1)\nt+1
if page>maxp then page=maxp

if a=0 then
response.write("<br/>------------<br/>没有记录<br/>")
end if
if a>0 then
response.write("<br/>第"&page&"页共"&maxp&"页总"&a&"张照片<br/>")
response.write("------------<br/>")
end if
if a>0 then
rs.Move((page-1)*nt)
dim j
j=1
do while ((not rs.eof) and j<=nt)
'========================================================================================
Dim curFile
curFile=Server.mappath(Request.servervariables("PATH_INFO"))
Dim curfilename,filename
cufilename="/"&rs("datadir")
filename=server.MapPath("/")&"\"&cufilename
Dim GetPicSize
Set GetPicSize=new GPS
Set fs=Server.CreateObject("Scripting.FileSystemObject")

Dim PicSuffixName
PicSuffixName=fs.GetExtensionName(filename)
Dim PD '//Picture Dimension
Dim PWidth,PHeight
Select Case PicSuffixName
Case "gif","bmp","jpg","png":

PD=GetPicSize.GetImageSize(filename)
PWidth=PD(1) '//获取图片宽度
PHeight=PD(2) '//获取图片高度
Case "swf"
PD=GetPicSize.GetImageSize(filename)
PWidth=PD(1) '//获取Flash宽度
PHeight=PD(2) '//获取Flash高度
Case Else
End Select
Set fs=Nothing
Set GetPicSize=Nothing

Dim PXWidth,PXHeight
Dim Pp '//Proportion
If PWidth=0 Or PWidth="" Then
PXWidth=0
PXHeight=0
Else
Pp=FormatNumber(PWidth/PHeight,2)
End If
If PWidth>=PHeight Then
If PWidth>=80 Then
PXWidth=80
PXHeight=FormatNumber(80/Pp,0)
Else
PXWidth=PWidth
PXHeight=PHeight
End If
Else
If PHeight>=120 Then
PXHeight=120
PXWidth=FormatNumber(120*Pp,0)
Else
PXWidth=PWidth
PXHeight=PHeight
End If
End If

Response.Write"<a href='admin_wapDISPLAY.asp?sort=" & sort & "&amp;id="&rs("id")&"&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'><img src='" & cufilename & "' width='" & PXWidth& "' height='" &PXHeight& "' /></a><br/><a href='admin_wapDISPLAY.asp?sort=" & sort & "&amp;id="&rs("id")&"&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'>" & (j+(page-1)*nt) & "."&outHTM(rs("title"))&"</a>("&rs("downloadcount")&"/<a href='wap_Admin_zpReviewView.asp?sort=" & sort & "&amp;id="&rs("id")&"&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'>"&rs("re")&"</a>)<a href='admin_delzp.Asp?sort=" & sort & "&amp;id="&rs("id")&"&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page&"&amp;adminmid="&request("adminmid")&"'><b>删除</b></a><br/>"
'========================================================================================
			j = j + 1
rs.MoveNext
loop

end if
if page<maxp then
response.write("<a href='"&name&"?sort=" & sort & "&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page+1&"&amp;adminmid="&request("adminmid")&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='"&name&"?sort=" & sort & "&amp;n=" & n & "&amp;ns="&ns&"&amp;page="&page-1&"&amp;adminmid="&request("adminmid")&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
		<input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="<%=name%>?sort=<%=sort%>&amp;n=<%=n%>&amp;ns=<%=ns%>&amp;Curl=<%=Curl%>&amp;adminmid=<%=request("adminmid")%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if
rs.close
set rs=nothing
conn.close
set conn=nothing

response.write("------------<br/>")
%>
<a href='../up/up.asp'>现在上传相片</a><br/>
<a href="wap_changzhungl.asp?adminmid=<%=request("adminmid")%>">返回文件管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<%=String(2-Len(Month(date)),"0") & Month(date) %>-<%=String(2-len(Day(date)),"0") & Day(date)%>:<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time)%>

</p>
</card>
</wml>