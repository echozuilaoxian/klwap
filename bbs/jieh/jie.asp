<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="会员求婚">
<p>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids="&ids&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("fying")>0 then
%>
你已经结过婚了.请离婚后再来求婚吧！<br/>-------------
<%else%>
欢迎您来到城市婚姻登记所，您要向你心爱的人求婚吗？首先您要向登记处支付1314个金币做为手续费。 您要确定你求婚的人是单身，最好是先两人私下商量好了再来登记，登记后7天没有被对方接受的系统自动删除。(一旦提交登记，金币将自动扣除。不做退还)
<br/>--------
<br/>求婚对象的ID:
<br/><input type="text" name="reids" format='*N'/>
<br/>爱情表白：
<br/><input type="text" name="biao" value="我爱你!嫁给我好吗?"/>
<br/><anchor>[传递爱意]
<go method="post" href="jiecl.asp?SessionID=<%=SessionID%>">
<postfield name="reids" value="$(reids)"/>
<postfield name="biao" value="$(biao)"/>
</go>
</anchor>
<br/>---------
    <%End if
  conn.close
 set objgbrs=nothing
  set conn=nothing

%>

<br/><anchor><prev/>[快速返回]</anchor>
<br/><a href='/bbs/jieh/index.asp?SessionID=<%=SessionID%>'>[婚姻登记]</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>[我的地盘]</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[社区首页]</a>
</p>
</card>
</wml>