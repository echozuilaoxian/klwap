<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
'
' 
'============================================================ 
%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp" -->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="设置注册ID">
<p>
<%
lid=request.querystring("lid")
size=request("size")
set rs=server.createobject("adodb.recordset")
sql="select top 1 id from usereg order by id desc"
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	maxid=0
Else
maxid=rs("id")
end If
xid=maxid+1

If lid=1 Then 
   If size>= xid Then 
   conn.execute "insert into usereg(id) values("&size&")"
   response.write "设置成功,注册ID将从<b>"&size+1&"</b>开始.<br/>"
   conn.execute "delete from [usereg] where [id]="&size
   Else
   response.write "填写有误,请重新写入...<br/>"
   response.write "<a href='?adminmid="&request("adminmid")&"'>重填</a><br/>"
   End If 
   else
%>
<b>使用说明:</b><br/>
1.如果你想设置从1000开始注册,那么在下面的文本框填写999就可以了<br/>
2.此功能只能往上增加,不能递减:例如你一旦设置了从1000开始注册,就不能再设置小于1000的数值了<br/>
3.本功能会自动查询最后一个注册用户,并在下面输入框中自动填入正确的最小默认值,你填写的数字不能小于框中的默认值<br/>
4.此ID字段的数据类型为"自动编号",不保证所做操作绝对正确.
<br/>----------<br/>
输入开始ID:<br/>
<input name="size" value="<%=xid%>" format="*N"/><br/>
<anchor>确定设置
    <go href="?adminmid=<%=request("adminmid")%>&amp;lid=1" method="post" accept-charset="utf-8">
        
         <postfield name="size" value="$(size)"/>
    </go>
</anchor><br/>----------<br/>
<%End If 
rs.close
Set rs=nothing%>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapadmin_index.asp?adminmid=<%=request("adminmid")%>">返回首页管理</a><br/>
报时:<%=time%>
</p>
</card>
</wml>