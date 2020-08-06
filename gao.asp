<%
Dim ad01(4)
ad01(0)="<a href='http://ad.winclick.cn/126790.wap?kong=video'>玉女心精</a>"
ad01(1)="<a href='http://ad.winclick.cn/126790.wap?kong=video'>潘金莲传</a>"
ad01(2)="<a href='http://ad.winclick.cn/126790.wap?kong=video'>新金瓶梅</a>"
ad01(3)="<a href='http://ad.winclick.cn/126790.wap?kong=video'>灯草和尚</a>"
ad01(4)="<a href='http://ad.winclick.cn/126790.wap?kong=video'>青楼名妓</a>"
Randomize
I=Int(Rnd()*5)
ad=ad01(i)
Response.Write(ad)
%>