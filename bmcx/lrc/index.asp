<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head><card title="LRC歌词查询下载">
<%dim sid
sid=request.querystring("sid")%>
<p>
请输入搜索词<br/>
<input name="searchstr" type="text"  value="爱的代价"/>
<br/>
<select name="tp" id="tp">
<option value="1">歌曲名称</option>
<option value="2">歌手名称</option>
</select>
<br/>
<anchor title="远程搜索">远程搜索
<go href="lrc.asp" method="post">
<postfield name="searchstr" value="$(searchstr)" />
<postfield name="p" value="$(tp)" />
<postfield name="sid" value="<%=sid%>" />
</go></anchor><br/>
<a href='lrchelp.asp?sid=<%=sid%>'>什么是LRC歌词？</a><br/>
<a href="/bbs/index.asp?sid=<%=sid%>">社区论坛</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
</p>
</card>
</wml>