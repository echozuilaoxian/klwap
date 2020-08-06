<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnamecp.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="博彩富翁榜" >
<p>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")

  if ky="" or ky>8 or ky<1 then
	ky=8
  end if

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if

iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if
iduse=Session("useid")
set rss=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rss.open rsQL,Conn,1,2
if rss.recordcount<1 then
rss.addnew
rss("ids")=iduse
rss.update
end if
        rss.Close
	Set rss=Nothing

  select case ky
'================================
  case 1
  tip="特码高手"
  tips="特码"
  desc="tmjf"
  StrFont="特码 <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 2
  tip="生肖高手"
  tips="生肖"
  desc="sxjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> 生肖 <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 3
  tip="单双高手"
  tips="单双"
  desc="dsjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> 单双 <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 4
  tip="波色高手"
  tips="波色"
  desc="psjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> 波色 <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 5
  tip="大小高手"
  tips="大小"
  desc="dxjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> 大小 <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 6
  tip="五行高手"
  tips="五行"
  desc="wxjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> 五行 <a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利</a> <br/>"
'================================
  case 7
  tip="赢利高手"
  tips="赢利"
  desc="czjjf-cmrjf"
  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码</a> <a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖</a> <a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双</a> <a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色</a> <a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小</a> <a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行</a> 赢利 <br/>"
'================================
  case 8
  tip="我要下注"

  StrFont="<a href='/BBS/LHC/TOP.Asp?ky=7&amp;SessionID=" & SessionID & "'>赢利高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=1&amp;SessionID=" & SessionID & "'>特码高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=2&amp;SessionID=" & SessionID & "'>生肖高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=3&amp;SessionID=" & SessionID & "'>单双高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=4&amp;SessionID=" & SessionID & "'>波色高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=5&amp;SessionID=" & SessionID & "'>大小高手</a> <br/><a href='/BBS/LHC/TOP.Asp?ky=6&amp;SessionID=" & SessionID & "'>五行高手</a><br/>"
  end select

if kyzc=""  then

if ky<>"8" then
response.write StrFont

  set rs=Server.CreateObject("ADODB.Recordset")
     ssql="select * from cpjf order by "& desc &" desc"
  rs.open ssql,conn,1,1

page=int(request("page"))
n=int(request("n"))
ns=int(request("ns"))
if page="" or page<=0 then
page=1
end if
if ns="" or ns<=0 then
ns=10
end if

a=rs.recordcount
maxp=(a-1)\ns+1
if page>maxp then page=maxp


if a=0 then
response.write("--------------<br/>暂无记录<br/>")
end if

if a>0 then
response.write(""&tip&"-有"&a&"条记录<br/>--------------<br/>")
end if

if a>0 then
rs.Move((page-1)*ns)
dim j
j=1
do while ((not rs.eof) and j<=ns)

tjhm=rs("ids")
%>
第<%=(j+(page-1)*ns)%>名:<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx=<%=tjhm%>&amp;Page=<%=Page%>&amp;ky=<%=ky%>&amp;SessionID=<%=SessionID%>'><%=ubb(redtjname)%></a>
<%if ky<>"7" then
%><%=ubb(tips)%>总中奖:<b><%=ubb(rs(""&desc&""))%></b>金币<br/>
<%Else
Response.write ""&tips&"<b>" & rs("czjjf")-rs("cmrjf") & "</b>金币<br/>"
end if%>
<%
			j = j + 1
rs.movenext 
loop

end if
if maxp>1 then
response.write("--------------<br/>")
end if
if page<maxp then
response.write("<a href='/BBS/LHC/TOP.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page+1&"'>下页</a>&nbsp;")
end if
if page>1 then
response.write("<a href='/BBS/LHC/TOP.Asp?SessionID="&SessionID&"&amp;ky=" & ky & "&amp;page="&page-1&"'>上页</a>")
end if
if maxp>1 then
response.write("("&page&"/"&maxp&"/"&a&")<br/>")
%>
                    <input name="Page<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" maxlength="4" value="<%if Page>=maxp then response.write(Page-1) else response.write(Page+1)%>"/>页<anchor>跳页
		      <go href="/BBS/LHC/TOP.Asp?SessionID=<%=SessionID%>&amp;ky=<%=ky%>" accept-charset='utf-8'>
		            <postfield name="Page" value="$(Page<%=minute(now)%><%=second(now)%>)"/>
		      </go>
		</anchor><br/>
                <%end if

rs.close
set rs=nothing
Else
response.write"博彩富翁排行榜<br/>"
response.write StrFont
end if

Elseif kyzc="yxxe"  then
idsx=request("idsx")
page=request("page")
ky=request("ky")
set rsf=Server.CreateObject("ADODB.Recordset")
rsQf="select * from cpjf where cstr(ids)='"&idsx& "'"
rsf.open rsQf,Conn
if rsf.eof then
Response.write "没有该用户信息<br/>"
else
tjhm=rsf("ids")
%>
<%=ubb(redtjname)%>:的中奖记录<br/><a href='/BBS/reg/useinfo.asp?SessionID=<%=SessionID%>&amp;id=<%=idsx%>'>他的社区资料</a><br/>--------------<br/>
特码中奖:<b><%=ubb(rsf("tmjf"))%></b>金币<br/>
生肖中奖:<b><%=ubb(rsf("sxjf"))%></b>金币<br/>
单双中奖:<b><%=ubb(rsf("dsjf"))%></b>金币<br/>
波色中奖:<b><%=ubb(rsf("psjf"))%></b>金币<br/>
大小中奖:<b><%=ubb(rsf("dxjf"))%></b>金币<br/>
五行中奖:<b><%=ubb(rsf("wxjf"))%></b>金币<br/>
-----<br/>
投注总额:<b><%=ubb(rsf("cmrjf"))%></b>金币<br/>
中奖总额:<b><%=ubb(rsf("czjjf"))%></b>金币<br/>
赢利总额:<b><%=rsf("czjjf")-rsf("cmrjf")%></b>金币<br/>
<%if iduse<>tjhm then%> 
<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx=<%=iduse%>&amp;SessionID=<%=SessionID%>'>我的中奖记录</a><br/>
<%else%>
<anchor><prev/>返回上级面页</anchor><br/>
<%end if%>
<%
end if
rsf.Close
Set rsf=Nothing
end if
%>--------------<br/>
<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing%>