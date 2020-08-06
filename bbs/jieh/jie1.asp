<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="会员求婚">
<p>
<img src="/bbs/logo/JH.gif"  alt="求婚"/><br/>
<%
dim id,name
id=request("id")
tjhm=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>您有" & lycount & "条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
End if
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "" & converttowidebaiti(gfdsa) & "你好!<br/>你确定要向[" & converttowidebaiti(redtjname) & "ID:" & id & "]求婚吗?"%>
<br/>--------
<br/>爱情表白：
<br/><input type="text" name="biao" value="我爱你!嫁给我好吗?"/>
<br/><anchor>[确定求婚]
<go method="post" href="jiecl.asp?SessionID=<%=SessionID%>"><%
Response.write "<postfield name='reids' value='"&id&"'/>"%>
<postfield name="biao" value="$(biao)"/>
</go>
</anchor>
<br/>-----------
<br/><anchor><prev/>[快速返回]</anchor>
<br/><a href='/bbs/jieh/index.asp?SessionID=<%=SessionID%>'>[婚姻登记]</a>
<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=2&amp;SessionID=<%=SessionID%>'>[征婚论坛]</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>
注：须向登记处支付1314个金币做为手续费。 确定你求婚的人是单身，最好是先两人私下商量好了再来登记，登记后1天没有被对方接受的系统自动删除。(一旦提交登记，金币将自动扣除。不做退还)
</p>
</card>
</wml>