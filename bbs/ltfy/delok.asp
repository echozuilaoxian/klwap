<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="ccnn.inc"-->
<!--#include file="admin.asp"-->
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
id=request.QueryString("id")
p=request.QueryString("p")
idid=request.QueryString("idid")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where id=" & id
rs.open rsstr,conn,1,2

if rs.eof then
     response.write "<card id='card1' title='删除案件'><p align='left'>ID错误！</p></card></wml>"
     response.end
   else
rs.delete
rs.update
rs.close
end if
idd="0"
  ltlyuan="通知书：法官(url=/bbs/reg/useinfo.asp?id="& iduse &")"& gfdsa &"ID:"& iduse &"(/url)撤消你在(url=/bbs/ltfy/index.asp?SessionID=)社区法院(/url)的起诉并已删除。"  
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(idid) & ","
  sql=sql & sqlstr(0) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
%>
<card id='card1' title='删除案件' ontimer='index.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;p=<%=p%>'><timer value='15'/>
<p>
删除成功，正在返回...<br/>
----------<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml> 
<%
end if
conn.close
set conn=nothing
%>
