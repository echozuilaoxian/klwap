<%if objgbrs("entcont")+objgbrs("ticont")*5-100000>0 then 
Response.write "点<br/>级别:0级" 
Response.write "<br/>升级还差:还没升级"

else if objgbrs("entcont")+objgbrs("ticont")*5-94000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/gl.gif' alt='300级'/>" 
Response.write "<br/>升级还差" & 100000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-88000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='290级'/><img src='/bbs/logo/leve/tylogo.gif' alt=''/><img src='/bbs/logo/leve/tylogo.gif' alt=''/><img src='/bbs/logo/leve/tylogo.gif' alt=''/>" 
Response.write "<br/>升级还差" & 94000-objgbrs("entcont")-objgbrs("ticont")*5
else if objgbrs("entcont")+objgbrs("ticont")*5-82000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='280级'/><img src='/bbs/logo/leve/tylogo.gif' alt=''/><img src='/bbs/logo/leve/tylogo.gif' alt=''/>" 
Response.write "<br/>升级还差" & 88000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-76000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='270级'/><img src='/bbs/logo/leve/tylogo.gif' alt=''/>" 
Response.write "<br/>升级还差" & 82000-objgbrs("entcont")-objgbrs("ticont")*5
else if objgbrs("entcont")+objgbrs("ticont")*5-70000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='260级'/><img src='/bbs/logo/leve/yllogo.gif' alt=''/><img src='/bbs/logo/leve/xx.gif' alt=''/>" 
Response.write "<br/>升级还差" & 76000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-64000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='250级'/><img src='/bbs/logo/leve/yllogo.gif' alt=''/>" 
Response.write "<br/>升级还差" & 70000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-58000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='240级'/><img src='/bbs/logo/leve/xx.gif' alt=''/>" 
Response.write "<br/>升级还差" & 64000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-52000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/tylogo.gif' alt='230级'/>" 
Response.write "<br/>升级还差" & 58000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-46000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/12.gif' alt='220级'/><img src='/bbs/logo/leve/yllogo.gif' alt=''/><img src='/bbs/logo/leve/xx.gif' alt=''/>" 
Response.write "<br/>升级还差" & 52000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-40000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/12.gif' alt='210级'/><img src='/bbs/logo/leve/yllogo.gif' alt=''/>" 
Response.write "<br/>升级还差" & 46000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-34000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/12.gif' alt='200级'/><img src='/bbs/logo/leve/xx.gif' alt=''/>" 
Response.write "<br/>升级还差" & 40000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-31000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/19.gif' alt='190级'/>" 
Response.write "<br/>升级还差" & 34000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-28000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/18.gif' alt='180级'/>" 
Response.write "<br/>升级还差" & 31000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-25000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/17.gif' alt='170级'/>"
Response.write "<br/>升级还差" & 28000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-22000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/16.gif' alt='160级'/>"
Response.write "<br/>升级还差" & 25000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-19000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/15.gif' alt='150级'/>" 
Response.write "<br/>升级还差" & 22000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-16000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/14.gif' alt='140级'/>" 
Response.write "<br/>升级还差" & 19000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-13000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/13.gif' alt='130级'/>" 
Response.write "<br/>升级还差" & 16000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-10000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/12.gif' alt='120'/>" 
Response.write "<br/>升级还差" & 13000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-8000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/11.gif' alt='110级'/>" 
Response.write "<br/>升级还差" & 10000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-7000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/10.gif' alt='100级'/>" 
Response.write "<br/>升级还差" & 8000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-6000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/9.gif' alt='90级'/>" 
Response.write "<br/>升级还差" & 7000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-5000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/8.gif' alt='80级'/>" 
Response.write "<br/>升级还差" & 6000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-4000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/7.gif' alt='70级'/>" 
Response.write "<br/>升级还差" & 5000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-3000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/6.gif' alt='60级'/>" 
Response.write "<br/>升级还差" & 4000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-2000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/5.gif' alt='50级'/>" 
Response.write "<br/>升级还差" & 3000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1500>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/4.gif' alt='40级'/>" 
Response.write "<br/>升职还差" & 2000-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-1000>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/3.gif' alt='30级'/>" 
Response.write "<br/>升级还差" & 1500-objgbrs("entcont")-objgbrs("ticont")*5

else if objgbrs("entcont")+objgbrs("ticont")*5-500>0 then 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/2.gif' alt='20级'/>" 
Response.write "<br/>升级还差" & 1000-objgbrs("entcont")-objgbrs("ticont")*5

else 
Response.write "点<br/>级别:<img src='/bbs/logo/leve/1.gif' alt='10级'/>" 
Response.write "<br/>升级还差" & 500-objgbrs("entcont")-objgbrs("ticont")*5

End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if
End if

%>