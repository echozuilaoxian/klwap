<%if objgbrs("bzbzz")=0 then
Response.write "无"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/jzjr.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>加入</a>"
end if
end if
if objgbrs("bzbzz")=1 then
 Response.write "<a href='/bbs/djcs.asp?itid=1&amp;wap=" & wap & "'>贴图专区</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;bzbzz=" & objgbrs("bzbzz") & "&amp;wap=" & wap & "'>退</a>"
end if
end if
if objgbrs("bzbzz")=2 then
 Response.write "<a href='/bbs/djcs.asp?itid=2&amp;wap=" & wap & "'>影音游戏</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=3 then
  Response.write "<a href='/bbs/djcs.asp?itid=3&amp;wap=" & wap & "'>游戏地带</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=4 then
  Response.write "<a href='/bbs/djcs.asp?itid=4&amp;wap=" & wap & "'>精彩视频</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=5 then
 Response.write "<a href='/bbs/djcs.asp?itid=5&amp;wap=" & wap & "'>动漫专区</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=6 then
  Response.write "<a href='/bbs/djcs.asp?itid=6&amp;wap=" & wap & "'>短文故乡</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=7 then
 Response.write "<a href='/bbs/djcs.asp?itid=7&amp;wap=" & wap & "'>谈情解爱</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=8 then
  Response.write "<a href='/bbs/djcs.asp?itid=8&amp;wap=" & wap & "'>散文天下</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=9 then
  Response.write "<a href='/bbs/djcs.asp?itid=9&amp;wap=" & wap & "'>职场天地</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=10 then
 Response.write "<a href='/bbs/djcs.asp?itid=10&amp;wap=" & wap & "'>三十不嫁</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=11 then
  Response.write "<a href='/bbs/djcs.asp?itid=11&amp;wap=" & wap & "'>爆笑乐园</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/lt/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=12 then
  Response.write "<a href='/bbs/djcs.asp?itid=12&amp;wap=" & wap & "'>灌水专区</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=13 then
 Response.write "<a href='/bbs/djcs.asp?itid=13&amp;wap=" & wap & "'>交友婚约</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=14 then
  Response.write "<a href='/bbs/djcs.asp?itid=14&amp;wap=" & wap & "'>ＩＴ视界</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=15 then
  Response.write "<a href='/bbs/djcs.asp?itid=15&amp;wap=" & wap & "'>女系氏族</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=16 then
 Response.write "<a href='/bbs/djcs.asp?itid=16&amp;wap=" & wap & "'>传媒江湖</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=17 then
  Response.write "<a href='/bbs/djcs.asp?itid=17&amp;wap=" & wap & "'>舞文弄墨</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=18 then
 Response.write "<a href='/bbs/djcs.asp?itid=18&amp;wap=" & wap & "'>电脑网络</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=19 then
  Response.write "<a href='/bbs/djcs.asp?itid=19&amp;wap=" & wap & "'>关天茶舍</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=20 then
  Response.write "<a href='/bbs/djcs.asp?itid=20&amp;wap=" & wap & "'>经济论坛</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=21 then
 Response.write "<a href='/bbs/djcs.asp?itid=21&amp;wap=" & wap & "'>闲闲书话</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=22 then
  Response.write "<a href='/bbs/djcs.asp?itid=22&amp;wap=" & wap & "'>网罗天下</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=23 then
  Response.write "<a href='/bbs/djcs.asp?itid=23&amp;wap=" & wap & "'>仗剑天涯</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=24 then
  Response.write "<a href='/bbs/djcs.asp?itid=24&amp;wap=" & wap & "'>怪力乱论</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=25 then
  Response.write "<a href='/bbs/djcs.asp?itid=25&amp;wap=" & wap & "'>煮酒论史</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=26 then
  Response.write "<a href='/bbs/djcs.asp?itid=26&amp;wap=" & wap & "'>热血军团</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=27 then
  Response.write "<a href='/bbs/djcs.asp?itid=27&amp;wap=" & wap & "'>一路同行</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=28 then
  Response.write "<a href='/bbs/djcs.asp?itid=28&amp;wap=" & wap & "'>管理前线</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=29 then
  Response.write "<a href='/bbs/djcs.asp?itid=29&amp;wap=" & wap & "'>求歌资询</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=30 then
  Response.write "<a href='/bbs/djcs.asp?itid=30&amp;wap=" & wap & "'>心灵热线</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=31 then
  Response.write "<a href='/bbs/djcs.asp?itid=31&amp;wap=" & wap & "'>奇思妙想</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=32 then
  Response.write "<a href='/bbs/djcs.asp?itid=32&amp;wap=" & wap & "'>国际观察</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=33 then
  Response.write "<a href='/bbs/djcs.asp?itid=33&amp;wap=" & wap & "'>理财赢家</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=34 then
  Response.write "<a href='/bbs/djcs.asp?itid=34&amp;wap=" & wap & "'>议事广场</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=35 then
  Response.write "<a href='/bbs/djcs.asp?itid=35&amp;wap=" & wap & "'>股市论谈</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=36 then
  Response.write "<a href='/bbs/djcs.asp?itid=36&amp;wap=" & wap & "'>篮球公园</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=37 then
  Response.write "<a href='/bbs/djcs.asp?itid=37&amp;wap=" & wap & "'>公仆在线</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=38 then
  Response.write "<a href='/bbs/djcs.asp?itid=38&amp;wap=" & wap & "'>校园文化</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=39 then
  Response.write "<a href='/bbs/djcs.asp?itid=39&amp;wap=" & wap & "'>狂野杂谈</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=40 then
  Response.write "<a href='/bbs/djcs.asp?itid=40&amp;wap=" & wap & "'>青春地图</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=41 then
  Response.write "<a href='/bbs/djcs.asp?itid=41&amp;wap=" & wap & "'>旅游休闲</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=42 then
  Response.write "<a href='/bbs/djcs.asp?itid=42&amp;wap=" & wap & "'>球迷一家</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=43 then
  Response.write "<a href='/bbs/djcs.asp?itid=43&amp;wap=" & wap & "'>汽车时代</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=44 then
  Response.write "<a href='/bbs/djcs.asp?itid=44&amp;wap=" & wap & "'>体育聚焦</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=45 then
  Response.write "<a href='/bbs/djcs.asp?itid=45&amp;wap=" & wap & "'>时尚资讯</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=46 then
  Response.write "<a href='/bbs/djcs.asp?itid=46&amp;wap=" & wap & "'>手机数码</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=47 then
  Response.write "<a href='/bbs/djcs.asp?itid=47&amp;wap=" & wap & "'>法律论坛</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=48 then
  Response.write "<a href='/bbs/djcs.asp?itid=48&amp;wap=" & wap & "'>影视评论</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=49 then
  Response.write "<a href='/bbs/djcs.asp?itid=49&amp;wap=" & wap & "'>我的大学</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=50 then
  Response.write "<a href='/bbs/djcs.asp?itid=50&amp;wap=" & wap & "'>娱乐八卦</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=51 then
  Response.write "<a href='/bbs/djcs.asp?itid=51&amp;wap=" & wap & "'>狂野医院</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=52 then
  Response.write "<a href='/bbs/djcs.asp?itid=52&amp;wap=" & wap & "'>蓦然回首</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=53 then
  Response.write "<a href='/bbs/djcs.asp?itid=53&amp;wap=" & wap & "'>旧爱新欢</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=54 then
  Response.write "<a href='/bbs/djcs.asp?itid=54&amp;wap=" & wap & "'>都市生活</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=55 then
  Response.write "<a href='/bbs/djcs.asp?itid=55&amp;wap=" & wap & "'>生肖血型</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=56 then
  Response.write "<a href='/bbs/djcs.asp?itid=56&amp;wap=" & wap & "'>对联雅座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=57 then
  Response.write "<a href='/bbs/djcs.asp?itid=57&amp;wap=" & wap & "'>光棍一族</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=58 then
  Response.write "<a href='/bbs/djcs.asp?itid=58&amp;wap=" & wap & "'>深夜孤独</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=59 then
  Response.write "<a href='/bbs/djcs.asp?itid=59&amp;wap=" & wap & "'>男左女右</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=60 then
 Response.write "<a href='/bbs/djcs.asp?itid=60&amp;wap=" & wap & "'>双子座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=61 then
  Response.write "<a href='/bbs/djcs.asp?itid=61&amp;wap=" & wap & "'>双鱼座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=62 then
 Response.write "<a href='/bbs/djcs.asp?itid=62&amp;wap=" & wap & "'>水瓶座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=63 then
  Response.write "<a href='/bbs/djcs.asp?itid=63&amp;wap=" & wap & "'>摩羯座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=64 then
 Response.write "<a href='/bbs/djcs.asp?itid=64&amp;wap=" & wap & "'>射手座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=65 then
  Response.write "<a href='/bbs/djcs.asp?itid=65&amp;wap=" & wap & "'>天蝎座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=66 then
 Response.write "<a href='/bbs/djcs.asp?itid=66&amp;wap=" & wap & "'>天秤座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=67 then
  Response.write "<a href='/bbs/djcs.asp?itid=67&amp;wap=" & wap & "'>处女座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=68 then
 Response.write "<a href='/bbs/djcs.asp?itid=68&amp;wap=" & wap & "'>狮子座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=69 then
  Response.write "<a href='/bbs/djcs.asp?itid=69&amp;wap=" & wap & "'>巨蟹座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=70 then
 Response.write "<a href='/bbs/djcs.asp?itid=70&amp;wap=" & wap & "'>金牛座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=71 then
  Response.write "<a href='/bbs/djcs.asp?itid=71&amp;wap=" & wap & "'>白羊座</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=72 then
  Response.write "<a href='/bbs/djcs.asp?itid=72&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if


if objgbrs("bzbzz")=73 then
  Response.write "<a href='/bbs/djcs.asp?itid=73&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if


if objgbrs("bzbzz")=74 then
  Response.write "<a href='/bbs/djcs.asp?itid=74&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if


if objgbrs("bzbzz")=75 then
  Response.write "<a href='/bbs/djcs.asp?itid=75&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=76 then
  Response.write "<a href='/bbs/djcs.asp?itid=76&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=77 then
  Response.write "<a href='/bbs/djcs.asp?itid=77&amp;wap=" & wap & "'>家园公告</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=78 then
  Response.write "<a href='/bbs/djcs.asp?itid=78&amp;wap=" & wap & "'>公共聊吧</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=79 then
  Response.write "<a href='/bbs/djcs.asp?itid=79&amp;wap=" & wap & "'>社区客服</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=80 then
  Response.write "<a href='/bbs/djcs.asp?itid=80&amp;wap=" & wap & "'>版主交流</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=81 then
  Response.write "<a href='/bbs/djcs.asp?itid=81&amp;wap=" & wap & "'>社区活动</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=82 then
  Response.write "<a href='/bbs/djcs.asp?itid=82&amp;wap=" & wap & "'>新手乐园</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=83 then
  Response.write "<a href='/bbs/djcs.asp?itid=83&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=84 then
  Response.write "<a href='/bbs/djcs.asp?itid=84&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=85 then
  Response.write "<a href='/bbs/djcs.asp?itid=85&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=86 then
  Response.write "<a href='/bbs/djcs.asp?itid=86&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=87 then
  Response.write "<a href='/bbs/djcs.asp?itid=87&amp;wap=" & wap & "'>待审</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=88 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=88&amp;wap=" & wap & "'>吉林</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=89 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=89&amp;wap=" & wap & "'>陕西</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=90 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=90&amp;wap=" & wap & "'>儋州</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=91 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=91&amp;wap=" & wap & "'>贵州</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=92 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=92&amp;wap=" & wap & "'>柳州</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=93 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=93&amp;wap=" & wap & "'>武汉</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=94 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=94&amp;wap=" & wap & "'>昆明</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=95 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=95&amp;wap=" & wap & "'>青岛</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=96 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=96&amp;wap=" & wap & "'>南京</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=97 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=97&amp;wap=" & wap & "'>拉萨</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=98 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=98&amp;wap=" & wap & "'>西安</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=99 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=99&amp;wap=" & wap & "'>深圳</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=100 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=100&amp;wap=" & wap & "'>北京</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=101 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=101&amp;wap=" & wap & "'>重庆</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=102 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=102&amp;wap=" & wap & "'>上海</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=103 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=103&amp;wap=" & wap & "'>天津</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=104 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=104&amp;wap=" & wap & "'>四川</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=105 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=105&amp;wap=" & wap & "'>广东</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=106 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=106&amp;wap=" & wap & "'>广西</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=107 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=107&amp;wap=" & wap & "'>河北</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=108 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=108&amp;wap=" & wap & "'>河南</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=109 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=109&amp;wap=" & wap & "'>云南</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=110 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=110&amp;wap=" & wap & "'>安徽</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=111 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=111&amp;wap=" & wap & "'>江西</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=112 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=112&amp;wap=" & wap & "'>湖北</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=113 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=113&amp;wap=" & wap & "'>湖南</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=114 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=114&amp;wap=" & wap & "'>甘肃</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=115 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=115&amp;wap=" & wap & "'>宁夏</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=116 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=116&amp;wap=" & wap & "'>西藏</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=117 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=117&amp;wap=" & wap & "'>福建</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=118 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=118&amp;wap=" & wap & "'>辽宁</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=119 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=119&amp;wap=" & wap & "'>山西</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=120 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=120&amp;wap=" & wap & "'>吉林</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=121 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=121&amp;wap=" & wap & "'>江苏</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=122 then
 Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=122&amp;wap=" & wap & "'>浙江</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=123 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=123&amp;wap=" & wap & "'>山东</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=124 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=124&amp;wap=" & wap & "'>温州</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=125 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=125&amp;wap=" & wap & "'>香港</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if

if objgbrs("bzbzz")=126 then
  Response.write "<a href='/bbs/tcjy/tcjy.asp?itid=126&amp;wap=" & wap & "'>其他</a>"
if objgbrs("id")=Session("useid") then
Response.write " <a href='/bbs/public/tcjz.asp?id=" & objgbrs("id") & "&amp;wap=" & wap & "'>退</a>"
end if
end if
%>