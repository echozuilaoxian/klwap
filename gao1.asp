<%
Dim ad01(4)
ad01(0)="<a href='http://ad.winclick.cn/126790.wap?kong=nba'>返回免费程序</a>"
ad01(1)="<a href='http://ad.winclick.cn/126790.wap?kong=nba'>返回免费空间</a>"
ad01(2)="<a href='http://ad.winclick.cn/126790.wap?kong=nba'>返回国产玉女</a>"
ad01(3)="<a href='http://ad.winclick.cn/126790.wap?kong=nba'>返回免费域名</a>"
ad01(4)="<a href='http://ad.winclick.cn/126790.wap?kong=nba'>返回另类专区</a>"
Randomize
I=Int(Rnd()*5)
ad=ad01(i)
Response.Write(ad)
%>