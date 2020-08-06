<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="转让操作">
<p>温馨提示:确定自己已经收款
<%SessionID=request.querystring("SessionID")%>
<br/>接收人ID:<input type="text" name="reids" format='*N' size="4"/><anchor>确定
<go method="post" href="qccl.asp?SessionID=<%=SessionID%>">
<postfield name="reids" value="$(reids)"/>
</go>
</anchor>
<br/>---------
<br/><a href='index.asp?SessionID=<%=SessionID%>'>回交易市场</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>我的地盘</a>-<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>