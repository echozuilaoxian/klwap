<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="投票系统"><p>
<%

 wap=request.querystring("wap") 
ON ERROR RESUME NEXT
Set rec=Server.CreateObject("ADODB.Recordset")
dim SQL
SQL="SELECT * FROM biaoti"
rec.Open SQL,conn,3,3
rec.movefirst
  response.write converttowidebaiti(rec.fields("biaoti")) & "<br/>--------<br/>"
   dim num
   num=0
   rec.movenext

   Do While Not Rec.EOF
   num=num+1
response.write num & ".<a href='topaocl.asp?rd=" & num & "&amp;wap=" & wap & "'>" & converttowidebaiti(rec.fields("biaoti")) & "</a><br/>"
     Rec.MoveNext
   Loop
conn.close
set rec=nothing
set cnn=nothing
%>
<a href='/bbs/pin/tjwzbb.asp?wap=<%=wap%>'>[发表评论]</a>
<br/><a href="/bbs/pin/zcwwbb.asp?itid=1&amp;wap=<%=wap%>">[查看评论]</a>
<br/><a href='view.asp?wap=<%=wap%>'>[查看结果]</a>

<br/>注：本调查可由会员以支付金币的方式委托社区进行，您可将拟好的题目与答案选项留言告知管理员，通过甚或即可进行!投票调查时间二天，资费1000金币，由管理员自行扣取哦~~
<br/>--------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>[社区首页]</a><br/><a href='/index.asp?wap=<%=wap%>'>[狂野首页]</a>
<% if Session("Counter")="pass_numbers_55556666" then
response.write "<br/>--------<br/><a href='set.asp?wap=" & wap & "'>[修改投票]</a><br/><br/>"
end if
%>
</p>
</card>
</wml>





