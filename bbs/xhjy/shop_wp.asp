<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>

<card id="card1" title="种子公司"><p>=查看花种=<br/>
<% 
Server.ScriptTimeout=999
iduse=Session("useid")
wapgywz="查看花种"
wapgydz=Request.ServerVariables("PATH_INFO")
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?shopid=" & shopid & "&amp;did=" & did & "&amp;"
End if
  did=request("did")
   shopid=request("shopid")
  fls=request("fls")
sql="update shop_bay set dj_time='"&now()&"' Where bay_id=" & shopid &" and wpid="&did
  Application.Lock
  conn.execute sql
  Application.Unlock
 dim pages,srs
  set srs=Server.CreateObject("ADODB.Recordset")
  sql="select * from shop_bay WHERE shop_id=" & shopid & " and wpid="&did
  srs.open sql,conn,1,1
if srs.eof then
    response.write "错误,没有该物品<br/>"
  else
Response.write "编号(" & srs("wpid") & ")<br/>物品:" & srs("wpname") & "<br/>售价:"
if srs("hots")=1 then
Response.write srs("wpjg") & "金币<br/>等级要求:" & srs("zbdj") & "级"
else
Response.write srs("wpjg") & "金币"
end if
Response.write "<br/>剩余:" & srs("wpsl") & "件<br/>作用:" & srs("wpzy") & "<br/>---><a href='Shop_wpIng.asp?shopid=" & shopid&"&amp;fls=" & fls&"&amp;did=" & srs("wpid") & "&amp;SessionID="&SessionID&"'>购买</a>"

end if
Response.write "<br/><a href='shop_hy.asp?SessionID="&SessionID&"'>返回种子公司</a><br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a>"

%>

</p></card></wml>



