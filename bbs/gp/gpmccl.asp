<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id='main' title='股票交易'><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
ltnames=Session("ltname")
 dim name,memo,id,ltname
  id=request("id")
  ltname=request("ltname")
  name=trim(request("name"))
  name=left(name,5)
  memo=trim(request("memo"))
  stockcode=request("stockcode")
if name="" or name=0 then
     response.write "卖出数量不能为空或为0！"
    else
if id="" or ltname="" or memo="" then
     response.write "系统不能识别你的身份，请返回后重新操作"
    else

keyword=server.urlencode(request("keyword"))
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
 t = GetBody(Path)
End function
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("MSXML2.XMLHTTP")
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8") 
set http=nothing 
if err.number<>0 then err.Clear 
end function 
Function BytesToBstr(body,Cset) 
dim objstream 
set objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function 
 stockcode=request("stockcode")
  sid=request("sid")
  feeflag=request("feeflag")

Dim Url,Html,start,over,body,wstr,str,stockcode

Url="http://wap.csc108.com/toll.php?toll=2:1&stockcode="&stockcode&"&feefla="&feefla&"&sid="&sid&""
wstr=getHTTPPage(url)           
start=Instr(wstr,"最新:")+0
over=Instr(wstr,"均价")
body=mid(wstr,start,over-start)
body = replace(body,"php","asp")
body = replace(body,"最新:","")
body = replace(body,"<br/>","")
body = replace(body,"			","")

Response.write "当前价格:"&body&"金币<br/>"
dim bodys,bass
name=Clng(name)
bodys=int(body*Clng(name))
bass=int(bodys*0.001)
dim rs
set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gpmr where CStr(idd)='" & iduse &"' and CStr(gpid)='"&stockcode&"' order by id desc"
  rs.open ssql,conn
if rs("jysl")<name then
   Response.write "该股票你没有持这么多"
else
 sql="update gpmr set jysl=jysl-" & name & " Where CStr(gpid)='" & stockcode & "' and CStr(idd)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
  sql="update usereg set bank=bank+" & (bodys-bass) & " Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
 sql="update usereg set mybbwj=mybbwj-" &name& " Where CStr(id)='" & iduse & "'"
 Application.Lock
            conn.execute(sql)
sql="insert into gpmc(idd,roomname,gpid,gpsl,ltname,gpjg)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(memo) & ","
  sql=sql & sqlstr(stockcode) & ","
  sql=sql & sqlstr(name) & ","
sql=sql & sqlstr(ltnames) & ","
sql=sql & sqlstr(body) & ")"
  Application.Lock
  conn.execute sql
      Application.Unlock
dong="卖出了"&name&"股"
 SQL="insert into sjzk(ids,idss,zname,bname,dong,bu,lasttlls)values("
            SQL=SQL & sqlstr(iduse) & ","
           SQL=SQL & sqlstr(1) & ","
           SQL=SQL & sqlstr(stockcode) & ","
          SQL=SQL & sqlstr(ltnames) & ","
          SQL=SQL & sqlstr(dong) & ","
          SQL=SQL & sqlstr(memo) & ","
          SQL=SQL & sqlstr(200) & ")"
          Application.Lock
          conn.execute SQL
sql="Delete FROM sjzk WHERE lasttlls=200 and DATEDIFF('s', timed, now()) > 720*60*3"
conn.Execute sql
response.write "成功卖出"&name&"股,已经自动加入" & (bodys-bass) & "金币到你的银行账户(包含0.001的手续费)！"
end if
end if
end if
set rs=nothing
conn.close
set conn=nothing
%>
<!--#include file="bb.asp" -->

</p>
</card>
</wml>