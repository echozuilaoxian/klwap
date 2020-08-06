<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<%Session.CodePage=65001%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
dim fyzx,check1,id1,pczb,pcdj
 fyzx=untowide(request("fyzx"))
pcdj=untowide(request("pcdj"))
pczb=untowide(request("pczb"))
 check1=request("check1")
id1=request("id")
 p=request("p")
 idid=request("idid")
if fyzx="" then
     response.write "<card id='card1' title='执行判决'><p align='left'>"
     response.write "判决词必须填写！<br/><br/>----------<br/><a href='reedit.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id1 & "&amp;p=" & p & "'>返回重写</a>"
%>
<br/><!--#include file="aa.asp"-->
<%
  response.write "</p></card></wml>"
     response.end

  else

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from urls where id=" & id1
rs.open rsstr,conn,1,2
rs("pczb")=pczb
rs("pcdj")=pcdj
rs("fyzx")=fyzx
rs("check")=check1
rs.Update
idd="0"
  ltlyuan="你在法院的申诉法官(url=/bbs/reg/useinfo.asp?id=" & iduse & "&SessionID=)" & gfdsa & "ID:" & iduse & "(/url)已经受理,详情可以到[url=/bbs/ltfy/index.asp?SessionID=]社区法院[/url]查看."  
  sql="insert into guestbook(ids,reids,niayo)values ("
  sql=sql & sqlstr(idid) & ","
  sql=sql & sqlstr(0) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  response.write "<card id='card1' title='执行判决' ontimer='view.asp?SessionID=" & SessionID & "&amp;ids=" & ids & "&amp;id=" & id1 & "&amp;p=" & p & "'><timer value='15'/><p>"
  response.write "成功执行，正在返回...<br/><br/>----------"
%>
<br/><!--#include file="aa.asp"-->
<%
  response.write "</p></card></wml>"

end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>