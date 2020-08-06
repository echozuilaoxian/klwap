<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='摇摇乐_帮助说明'>  
<p>

<%Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>1:系统会(随机)先开出个固定的中奖号码,假如您摇出的号码和系统(随机)号码一致,那恭喜您中奖了!不一致则没有中奖<br/>
2:系统下注机会为1000,超过1000注后还没有人中奖游戏自动进入下一期,奖金80%自动累计，系统每期增加80000金币压盘<br/>
3:假如您中奖了,奖金的80%归您所有(系统收取10%税费),10%保底累计到一下期<br/>
4.每注1000金币<br/>
<!--#INCLUDE VIRTUAL="/bbs/game/game.inc"-->
</p>
</card>
</wml>