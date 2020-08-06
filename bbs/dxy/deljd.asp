<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="删除挑战">
<p>
<%
id=Request("id")
if id="" or Isnumeric(id)=False then
call error("ID无效！")
end if

set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where useid=" & myid & " and op=0 and id="&id&" order by id desc"
  objgbrs.open ssql,ydzqconn,1,3
if objgbrs.eof then
response.write "出错了，本次挑战已经结束！"
Else

 
   sql="update usereg set usejf=usejf+ " & objgbrs("num") & "  Where id=" & myid
  conn.Execute(sql)
objgbrs.delete
objgbrs.update
response.write "删除挑战成功！"
end if
objgbrs.close
set objgbrs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>
<br/>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>