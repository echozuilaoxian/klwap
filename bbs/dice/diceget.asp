<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<card title="幸运彩球设置"><p>
<%
if myid <> 1 then
call error("权限不足！")
end if

dim dicename,hello,pay1,pay2,paysmall,paybig,payds,payss,paybz,paylu,dicetimes,TP
dicename=request("dicename")
hello=request("hello")
paysmall=request("paysmall")
paybig=request("paybig")
payds=request("payds")
payss=request("payss")
paybz=request("paybz")
dicetimes=request("dicetimes")
pay1=request("pay1")
pay2=request("pay2")
paylu=request("paylu")
TP=request("TP")
if TP<>"" then

if dicename="" then
  Call Error("系统名称不能为空！")
  end if
if len(dicename)>200 then
  Call Error("系统名称最多200字！")
  end if
  
if hello="" then
  Call Error("欢迎语不能为空！")
  end if
if len(hello)>30 then
  Call Error("欢迎语最多30字！")
  end if
  
if paysmall="" or paybig="" or payds="" or payss="" or paybz="" or pay1="" or pay2="" or dicetimes="" or paylu="" then
Call Error("各项不能为空！")
end if
  
 if dicetimes="" or IsNumeric(dicetimes)=False then
 Call Error("循环时间不对！")
 end if
 if abs(int(dicetimes))>59 then
 Call Error("循环时间最多59分！")
 end if
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select * from diceadmin where id=1",ydzqconn,1,2
rs("dicename")=dicename
rs("hello")=hello
rs("paysmall")=paysmall
rs("paybig")=paybig
rs("payds")=payds
rs("payss")=payss
rs("paybz")=paybz
rs("dicetimes")=dicetimes
rs("paylu")=paylu
rs("pay1")=pay1
rs("pay2")=pay2
rs.update
rs.close
set rs=nothing
response.write"幸运彩球设置成功！<br/>"
else
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select * from diceadmin where id=1",ydzqconn,1,1
 Response.Write "系统名称:"
 Response.Write "<input name=""dicename"&tt&""" value="""&rs("dicename")&"""/><br/>"
 Response.Write "欢迎语:"
 Response.Write "<input name=""hello"&tt&""" value="""&rs("hello")&"""/><br/>"
 Response.Write "买小赔率:1赔"
 Response.Write "<input name=""paysmall"&tt&""" value="""&rs("paysmall")&"""/><br/>"
 Response.Write "买大赔率:1赔"
 Response.Write "<input name=""paybig"&tt&""" value="""&rs("paybig")&"""/><br/>"
 Response.Write "买单赔率:1赔"
 Response.Write "<input name=""payds"&tt&""" value="""&rs("payds")&"""/><br/>"
 Response.Write "买双赔率:1赔"
 Response.Write "<input name=""payss"&tt&""" value="""&rs("payss")&"""/><br/>"
 Response.Write "买合数赔率:1赔"
 Response.Write "<input name=""paybz"&tt&""" value="""&rs("paybz")&"""/><br/>"
 
 Response.Write "游戏循环时间（分）"
 Response.Write "<input name=""dicetimes"&tt&""" value="""&rs("dicetimes")&"""/><br/>"
 
 Response.Write "最小下注"
 Response.Write "<input name=""pay1"&tt&""" value="""&rs("pay1")&"""/><br/>"
 Response.Write "最大下注"
 Response.Write "<input name=""pay2"&tt&""" value="""&rs("pay2")&"""/><br/>"
 
 Response.Write "每次奖金抽水"
 Response.Write "<input name=""paylu"&tt&""" value="""&rs("paylu")&"""/>%<br/>"
 
rs.close
set rs=nothing

conn.close
set conn=nothing
ydzqconn.close
set ydzqconn=nothing
Response.Write "<anchor>[提交设置]"
Response.Write "<go href=""diceget.asp?SessionID=" & SessionID &""" method=""post"" accept-charset='utf-8'>"
Response.Write "<postfield name=""dicename"" value=""$(dicename"&tt&")""/>"
Response.Write "<postfield name=""hello"" value=""$(hello"&tt&")""/>"
Response.Write "<postfield name=""paysmall"" value=""$(paysmall"&tt&")""/>"
Response.Write "<postfield name=""paybig"" value=""$(paybig"&tt&")""/>"
Response.Write "<postfield name=""payds"" value=""$(payds"&tt&")""/>"
Response.Write "<postfield name=""payss"" value=""$(payss"&tt&")""/>"
Response.Write "<postfield name=""paybz"" value=""$(paybz"&tt&")""/>"
Response.Write "<postfield name=""dicetimes"" value=""$(dicetimes"&tt&")""/>"
Response.Write "<postfield name=""paylu"" value=""$(paylu"&tt&")""/>"
Response.Write "<postfield name=""pay1"" value=""$(pay1"&tt&")""/>"
Response.Write "<postfield name=""pay2"" value=""$(pay2"&tt&")""/>"
Response.Write "<postfield name=""TP"" value=""ok""/>"
Response.Write "</go></anchor><br/>"
end if
Response.Write "<a href='diceset.asp?SessionID=" & SessionID &"'>返回上级</a>"
%>
<!--#include file="fanhui.asp"-->
</p></card>
</wml>