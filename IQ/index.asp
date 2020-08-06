<!--#include file="conn.asp"-->
<%user=request.QueryString("user")%>
<% if user="" then user="http://wap.twowap.cn"
if left(user,7)<>"http://" then
user=""&user
end if
call closeconn()
response.write "<wml>"&vbnewline&"<card title=""脑筋急转弯"">"
response.write "<p>"
%>
<% 
page=server.urlencode(request("page"))
if page="" then page="1"
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://c.lxyes.com/iq/index.aspx?CD=44300&page="&request("page")&"&total="&request("total")&""
'&total="&request("total")&"
wstr=getHTTPPage(url)
start=Instr(wstr,"<p>")
over=Instr(wstr,"</go></anchor>")+19
body=mid(wstr,start,over-start)
'------------------------------------------------
body = replace(body,"<p align=""left"">","")'这是把<p align=""left"">替换成空
body = replace(body,"<p align=""center"">","")
body = replace(body,"</p>","")
body = replace(body,"<p>","")'取消</p><p>
body = replace(body,".aspx",".asp")
body = replace(body,"img/soft2.gif","http://down.lxyes.com/img/soft2.gif")
body = replace(body,"http://post.lxyes.com/mark/index.asp?&amp;cd=44300&amp;lxt=ce99af59a401c24echqvgtgff&amp;trand=974086994&amp;a=1","")
body = replace(body,"alt=""智能软件""/>","alt=""智能软件""/><!--")
body = replace(body,"播放器</a>","播放器</a>-->")
body = replace(body,"http://down.lxyes.com/ztlist.asp","ztlist.asp")
body = replace(body,"http://post.lxyes.com/mark/","")
body = replace(body,"http://down.lxyes.com/type.asp","type.asp")
body = replace(body,"http://down.lxyes.com/list.asp","list.asp")
body = replace(body,"img/wangbiao.gif","http://down.lxyes.com/img/wangbiao.gif")
'body = replace(body,"<a href=""http://post.lxyes.com/mark/index.asp?&amp;cd=44300&amp;trand=124142026&amp;a=1"">[热]进入新版网标频道</a>","-----------------")
body = replace(body,"http://down.lxyes.com/detail.asp","detail.asp")
body = replace(body,"收藏","")
body = replace(body,"http%3a%2f%2fc.lxyes.com%2fiq%2f","")
body = replace(body,"专题</a>|","专题</a><!--")
body = replace(body,"[火]进入新下载中心频道</a>","-->")
'--------------------------------------------------
Response.write body
%>
<a href="/index.asp">网站首页</a>
</p>
</card>
</wml>
