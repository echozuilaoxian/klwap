
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<card title="水果机设置"><p>
<%
if myid <> 1 then
call error("权限不足！")
end if

dim applename,hello,paynum,appletimes,TP,pcent
applename=request("applename")
hello=request("hello")
paynum=request("paynum")
appletimes=request("appletimes")
paylu=request("paylu")
pcent=request("pcent")
TP=request("TP")
if TP<>"" then

if applename="" then
  Call Error("系统名称不能为空！")
  end if
if len(applename)>30 then
  Call Error("系统名称最多30字！")
  end if
  
if hello="" then
  Call Error("欢迎语不能为空！")
  end if
if len(hello)>30 then
  Call Error("欢迎语最多30字！")
  end if
  
if paynum="" or IsNumeric(paynum)=False then
Call Error("限制下注次数错误！")
end if
  
 if appletimes="" or IsNumeric(appletimes)=False then
 Call Error("循环时间不对！")
 end if
 if abs(int(appletimes))>59 then
 Call Error("循环时间最多59分！")
 end if
 if paylu="" or IsNumeric(paylu)=False then
 Call Error("抽水设置不对！")
 end if
 if pcent="" or IsNumeric(pcent)=False then
 Call Error("每注金额设置不对！")
 end if
 
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select * from appleadmin where id=1",ydzqconn,1,3
rs("applename")=applename
rs("hello")=hello
rs("paynum")=paynum
rs("appletimes")=appletimes
rs("paylu")=paylu
rs("pcent")=pcent
rs.update
rs.close
set rs=nothing
response.write"水果机设置成功！<br/>"
else
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select * from appleadmin where id=1",ydzqconn,1,1
 Response.Write "系统名称:"
 Response.Write "<input name=""applename"&tt&""" value="""&rs("applename")&"""/><br/>"
 Response.Write "欢迎语:"
 Response.Write "<input name=""hello"&tt&""" value="""&rs("hello")&"""/><br/>"
 Response.Write "每人每场可以下注次数"
 Response.Write "<input name=""paynum"&tt&""" value="""&rs("paynum")&"""/><br/>"

 Response.Write "游戏循环时间（分）"
 Response.Write "<input name=""appletimes"&tt&""" value="""&rs("appletimes")&"""/><br/>"
 
 Response.Write "每次奖金抽水"
 Response.Write "<input name=""paylu"&tt&""" value="""&rs("paylu")&"""/>%<br/>"
 
 Response.Write "每注金额(无投注时更改)"
 Response.Write "<input name=""pcent"&tt&""" value="""&rs("pcent")&"""/><br/>"
 
rs.close
set rs=nothing

conn.close
set conn=nothing
ydzqconn.close
set ydzqconn=nothing
Response.Write "<anchor>[提交设置]"
Response.Write "<go href=""appleget.asp?SessionID="&SessionID&""" method=""post"" accept-charset='utf-8'>"
Response.Write "<postfield name=""applename"" value=""$(applename"&tt&")""/>"
Response.Write "<postfield name=""hello"" value=""$(hello"&tt&")""/>"
Response.Write "<postfield name=""paynum"" value=""$(paynum"&tt&")""/>"
Response.Write "<postfield name=""appletimes"" value=""$(appletimes"&tt&")""/>"
Response.Write "<postfield name=""paylu"" value=""$(paylu"&tt&")""/>"
Response.Write "<postfield name=""pcent"" value=""$(pcent"&tt&")""/>"
Response.Write "<postfield name=""TP"" value=""ok""/>"
Response.Write "</go></anchor><br/>"
end if
Response.Write "<a href='appleset.asp?SessionID="&SessionID&"'>返回上级</a>"
%>
<!--#include file="fanhui.asp"-->
</p></card>
</wml>