<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="在线用户"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="158"
lasttls
  dim page,objgbrs
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where Cstr(name)<>'' order by startime desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
 Response.write "&#x6CA1;&#x6709;会员在线&#x8BB0;&#x5F55;，不包括游客<br/>"
else

objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?6=8"
End if
Response.write "在线会员" & objgbrs.RecordCount & "人"
%>,<!--#INCLUDE VIRTUAL="/bbs/ykzx.asp"--><br/>----------------<br/>
<%

if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
ids=objgbrs("ids")


if objgbrs("lasttll")>0 and objgbrs("lasttll")<=130 then
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from sclt where id="&objgbrs("lasttll")
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此版块"
else
bkmc=rse("name")
end if
lasttlbz="位置:<a href='/bbs/forum_content/contentlist.asp?ForumID="&objgbrs("lasttll")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(bkmc)&"</a>"
rse.close
Set rse= Nothing

elseif objgbrs("lasttll")>1000 then
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&objgbrs("lasttll")
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlnamess="无此帖子"
Else
dlnamess=objgbrsy("biaoti")

end if
lasttlbz="看帖子:<a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID="&objgbrsy("itid")&"&amp;Page=1&amp;ID="&objgbrs("lasttll")&"&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(dlnamess)&"</a>"
objgbrsy.close
Set objgbrsy= Nothing


else
Select Case objgbrs("lasttll")
 Case "0"
  lasttlbz="位置:(社区首页)"
 Case "300"
  lasttlbz="位置:<a href='/bbs/Xqrj/Index.asp?SessionID=" & SessionID & "'>[心情日记]</a>"
 Case "301"
  lasttlbz="位置:[精帖专区]"
 Case "302"
  lasttlbz="位置:[荐帖专区]"
 Case "303"
  lasttlbz="位置:[查看热门帖子]"
 Case "304"
  lasttlbz="位置:[热帖专区]"
 Case "305"
  lasttlbz="位置:[查看最新帖子]"
 Case "306"
  lasttlbz="位置:[全坛精华帖子]"
 Case "307"
  lasttlbz="位置:[查看精华帖子]"
 Case "308"
  lasttlbz="位置:[全文查看帖子]"
 Case "309"
  lasttlbz="位置:[查看公告帖子]"
 Case "310"
  lasttlbz="位置:[看斑竹推荐帖]"
 Case "311"
  lasttlbz="位置:[查看帖子]"
 Case "312"
  lasttlbz="位置:[全坛推荐帖子]"
 Case "313"
  lasttlbz="位置:[查看名人堂]"
 Case "314"
  lasttlbz="位置:[引用回复]"
 Case "315"
  lasttlbz="位置:[全坛热门帖子]"
 Case "316"
  lasttlbz="位置:[献花成功]"
 Case "317"
  lasttlbz="位置:[图片收藏夹]"
 Case "318"
  lasttlbz="位置:[扔蛋成功]"
 Case "319"
  lasttlbz="位置:[管理帖子]"
 Case "320"
  lasttlbz="位置:[回复列表]"
 Case "321"
  lasttlbz="位置:[社区彩票]"
 Case "322"
  lasttlbz="位置:[巡逻练历]"
 Case "323"
  lasttlbz="位置:[家园资料]"
 Case "324"
  lasttlbz="位置:[宠物资料]"
 Case "325"
  lasttlbz="位置:[修改生日]"
 Case "326"
  lasttlbz="位置:[修改昵称资料]"
 Case "327"
  lasttlbz="位置:[修改资料]"
 Case "328"
  lasttlbz="位置:[查看聊室积分]"
 Case "329"
  lasttlbz="位置:[汇款转帐]"
 Case "330"
  lasttlbz="位置:[汇款记录]"
 Case "331"
  lasttlbz="位置:[过户记录]"
 Case "332"
  lasttlbz="位置:[财富排行]"
 Case "333"
  lasttlbz="位置:[学分排行]"
 Case "334"
  lasttlbz="位置:[头衔排行]"
 Case "335"
  lasttlbz="位置:[我的地盘]"
 Case "336"
  lasttlbz="位置:[房间开关]"
 Case "337"
  lasttlbz="位置:[管理团队]"
 Case "132"
  lasttlbz="位置:[会员资料]"
 Case "133"
  lasttlbz="位置:[经验说明]"
 Case "134"
  lasttlbz="位置:[回复文章]"
 Case "135"
  lasttlbz="位置:(热门精文)"
 Case "136"
  lasttlbz="位置:[最喜爱文章]"
 Case "137"
  lasttlbz="位置:[最佳人气贴]"
 Case "138"
  lasttlbz="位置:[续写文章]"
 Case "139"
  lasttlbz="位置:[发表文章]"
 Case "140"
  lasttlbz="位置:[我的文章]"
 Case "141"
  lasttlbz="位置:[论坛文章]"
 Case "142"
  lasttlbz="位置:[续贴]"
 Case "143"
  lasttlbz="位置:[精华专区]"
 Case "144"
  lasttlbz="位置:[全部文章]"
 Case "145"
  lasttlbz="位置:[最新文章]"
 Case "146"
  lasttlbz="位置:[最新文章]"
 Case "147"
  lasttlbz="位置:[搜索文章]"
 Case "148"
  lasttlbz="位置:[复制文章]"
 Case "149"
  lasttlbz="位置:[编辑文章]"
 Case "150"
  lasttlbz="位置:[同城论坛文章]"
 Case "151"
  lasttlbz="位置:[部落家族文章]"
 Case "152"
  lasttlbz="位置:[捉鱼游戏]"
 Case "153"
  lasttlbz="位置:[竞技中心]"
 Case "154"
  lasttlbz="位置:[同城交友]"
 Case "156"
  lasttlbz="位置:[社区学校]"
 Case "157"
  lasttlbz="位置:[金币过户]"
 Case "158"
  lasttlbz="位置:[在线用户]"
 Case "159"
  lasttlbz="位置:[管理员资料]"
 Case "161"
  lasttlbz="位置:[我要捐款]"
 Case "162"
  lasttlbz="位置:[人民银行]"
 Case "163"
  lasttlbz="位置:[体力排行]"
 Case "164"
  lasttlbz="位置:[信息中心]"
 Case "165"
  lasttlbz="位置:[聊室排行]"
 Case "166"
  lasttlbz="位置:[魅力排行]"
 Case "167"
  lasttlbz="位置:[收件箱]"
 Case "168"
  lasttlbz="位置:[发件箱]"
 Case "169"
  lasttlbz="位置:[名人堂]"
 Case "170"
  lasttlbz="位置:[族员群发]"
 Case "171"
  lasttlbz="位置:[监狱记录]"
 Case "172"
  lasttlbz="位置:[版主列表]"
 Case "173"
  lasttlbz="位置:[发帖排行]"
 Case "174"
  lasttlbz="位置:[查找会员]"
 Case "175"
  lasttlbz="位置:[宠物生命排行]"
 Case "176"
  lasttlbz="位置:[宠物热情排行]"
 Case "177"
  lasttlbz="位置:[聊管列表]"
 Case "178"
  lasttlbz="位置:[族长列表]"
 Case "179"
  lasttlbz="位置:[发表评论]"
 Case "180"
  lasttlbz="位置:[编辑帖子]"
 Case "181"
  lasttlbz="位置:[网友相册]"
 Case "190"
  lasttlbz="位置:<a href='/bbs/yxxe/index.asp?SessionID=" & SessionID & "'>[热血江湖]</a>"
 Case "520"
  lasttlbz="位置:[URL发图片贴]"
 Case "666"
  lasttlbz="位置:[社区首页]"
 Case "2000"
  lasttlbz="位置:[帮派聊天室]"
End Select

end if
if objgbrs("name")="&#x6E38;&#x5BA2;" then
Response.write bihao+bihaocont & "社区游客(ID:" & objgbrs("ids") & ")" & lasttlbz&"<br/>"
if Session("useid")="1" or Session("useid")="2" then
%>
IP:<anchor title="submit"><%=objgbrs("ip")%>
<go href="http://wap.ip138.com/ip.asp" method="post">
<postfield name="ip" value="<%=objgbrs("ip")%>"></postfield>
</go>
</anchor>|<anchor title="submit">封锁
<go href="/Sql/admin_Sql.asp" method="post">
<postfield name="SessionID" value="<%=SessionID%>"></postfield>
<postfield name="shuoji" value="<%=objgbrs("ip")%>"></postfield>
</go>
</anchor><br/>
<%
end if
else
Response.write bihao+bihaocont & "." & "<a href='useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("name")) & "ID:" & objgbrs("ids") & "</a>" & lasttlbz & "<br/>"
if Session("useid")="1" or Session("useid")="2" then
%>
IP:<anchor title="submit"><%=objgbrs("ip")%>
<go href="http://wap.ip138.com/ip.asp" method="post">
<postfield name="ip" value="<%=objgbrs("ip")%>"></postfield>
</go>
</anchor>|<anchor title="submit">封锁
<go href="/Sql/admin_Sql.asp" method="post">
<postfield name="SessionID" value="<%=SessionID%>"></postfield>
<postfield name="shuoji" value="<%=objgbrs("ip")%>"></postfield>
</go>
</anchor><br/>
<%
end if
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
if objgbrs.PageCount>1 then
Response.write "----------------<br/>"
end if
If pages<objgbrs.PageCount then
Response.Write "<a href='ckzxhy.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='ckzxhy.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上一页</a>"
End if
if objgbrs.PageCount>1 then
response.write "&#40;" & pages & "&#47;" & objgbrs.PageCount & "&#41;<br/>"
response.write "<input  name='pages' value='2' size='3' format='*N'/>页<anchor>跳页<go method='post' href='ckzxhy.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/></go></anchor><br/>"
End if
  if page=<1 or page>1 then
  End if
  End if
Response.Write "----------------<br/><a href='/BBS/useTOP20.asp?sort=2&amp;SessionID=" & SessionID & "'>最新注册用户</a><br/>"
Response.Write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
