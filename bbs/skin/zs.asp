<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="赠送社区秀">
<p>

<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
id=request("id")
%>
<img src="<%=id%>" alt="load..."/>
<br/>赠送社区秀
<br/>--------
<br/>收礼人ID:
<br/><input type="text" name="reids" format='*N'/>
<br/>要说说什么吗：
<br/><input type="text" name="ltlyuan" value="送件社区秀给你"/>
<br/><anchor>确定赠送
<go method="post" href="zscl.asp?SessionID=<%=SessionID%>">
<postfield name="reids" value="$(reids)"/>
<postfield name="id" value="<%=id%>"/>
<postfield name="ltlyuan" value="$(ltlyuan)"/>
</go>
</anchor>
<br/>---------
<br/><a href='/bbs/skin/ccx.asp?SessionID=<%=SessionID%>'>社区秀场</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
赠送等于购买.系统将收取你2000金币。
</p>
</card>
</wml>