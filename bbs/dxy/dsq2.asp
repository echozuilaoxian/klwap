<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="斗西游挑战">
<p>
<img src='dxy.gif' alt=''/><br/>
您目前共有<%=myjb%><%=getcent%><br/>
请输入下注额:
<br/><input name="num" value="10" size='3' format="*N" maxlength="5"/>
<br/>
我的西游:<br/>
<anchor>妖怪
    <go href="pk_jdg.asp?TP=1&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
    </go>
</anchor>.
<anchor>悟空
    <go href="pk_jdg.asp?TP=2&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="num" value="$(num)"/>
    </go>
</anchor>.
<anchor>唐僧
    <go href="pk_jdg.asp?TP=3&amp;SessionID=<%=SessionID%>" method="post" accept-charset="utf-8"> 
        <postfield name="num" value="$(num)"/>
    </go>
</anchor><br/>
*游戏规则:<br/>
唐僧大于悟空,悟空大于妖怪,妖怪大于唐僧;<br/>
最大下注为10000<%=getcent%> <br/>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>