[_tb_system_call storage=system/_part1_day2.ks]


; 好感度表示


[debug_init]

*base0

[playbgm  volume="100"  time="1000"  loop="true"  storage="Sunny_Afternoon_Driveway.mp3"  fadein="true"  ]
[bg  time="0"  method="crossfade"  storage="school.png"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[tb_show_message_window  ]
[tb_start_text mode=4 ]
#
――三日後。[p]

#
二度目のレッスンの日。[r]
いつものように、約束の十五分前には学校へ着いた。[p]
#
人を待たせるのが好きじゃない。[r]
それに、九歳の子供を校門の前で一人待たせるわけにもいかない。[p]
#
しばらくすると、見覚えのある白い帽子が校門から出てきた。[p]
#エリオット
リョーマ！[p]
#
こちらに気づいたリョーマが、まっすぐ車へ向かってくる。[p]
#リョーマ
……来たんだ[p]
#エリオット
もちろん。[r]
約束しただろ？[p]
#リョーマ
ふーん[p]
#
それだけ言うと、リョーマはもう俺には構わず、駐車場へ向かって歩き出した。[p]
#
昨日一度乗っただけなのに、俺の車の場所もしっかり覚えているらしい。[p]
#リョーマ
早く行こ[p]

#
車へ向かう途中、リョーマがふと足を止めた。[p]

#
視線の先には、自動販売機がある。[p]
#エリオット
喉乾いた？[p]
#リョーマ
別に[p]
#エリオット
飲みたいなら買ってく？[p]
#リョーマ
レッスン前だからいい[p]
#エリオット
へえ[p]
#リョーマ
なに？[p]
#エリオット
ちゃんと考えてるんだなと思って[p]
#リョーマ
当たり前じゃん[p]

#
そう言いながらも、視線がもう一度自動販売機へ向かう。[p]

[_tb_end_text]

[glink  color="black"  storage="part1_day2.ks"  size="20"  text="何が飲みたかった？"  target="*choice1_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="炭酸は身体に悪いぞ"  target="*choice1_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="じゃあ行こうか"  target="*choice1_3"  width="max"  autopos="true"  ]
[s  ]
*choice1_1

[tb_start_text mode=4 ]
#エリオット
何が飲みたかった？[p]
#リョーマ
……ファンタ[p]
#エリオット
ファンタ？[p]
#リョーマ
グレープ[p]
#エリオット
好きなの？[p]
#リョーマ
まあね[p]

#
そう答えて、さっさと歩き出す。[p]
ファンタグレープ。[r]どうやら覚えておいて損はなさそうだ。[p]

#
【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]

[jump  storage="part1_day2.ks"  target="*base"  ]
*choice1_2

[tb_start_text mode=4 ]
#エリオット
炭酸は身体に悪いぞ[p]
#リョーマ
……[p]
#エリオット
スポーツするなら水かスポーツドリンクのほうが――[p]
#リョーマ
飲むなんて言ってないじゃん[p]
#エリオット
それはそうだけど[p]
#リョーマ
行こ[p]

#
余計なお世話だったらしい。[p]

#
【好感度 －1】[p]
[_tb_end_text]

[love value="-1"]

[jump  storage="part1_day2.ks"  target="*base"  ]
*choice1_3

[tb_start_text mode=4 ]
#エリオット
じゃあ行こうか[p]
#リョーマ
うん[p]

#
そのまま車へ向かう。[p]

#
結局、何を見ていたのかは分からなかった。[p]

#
【好感度 ±0】[p]
[_tb_end_text]

[love value="0"]

[jump  storage="part1_day2.ks"  target="*base"  ]
*base

[playbgm  volume="100"  time="1000"  loop="true"  storage="Courtside_Afternoon.mp3"  fadein="true"  ]
[bg  time="1000"  method="crossfade"  storage="tennis_school_day.png"  ]
[tb_start_text mode=4 ]
#
――テニスクラブ。[p]

#
今日は前回指摘したところを確認することから始めた。[p]
#エリオット
まずはバックから見せて[p]
#リョーマ
うん[p]

#
ボールを出す。[p]

#
一球。[p]
二球。[p]
三球。[p]
#エリオット
……[p]

#
前回より打点が前になっている。[p]
#エリオット
直してきた？[p]
#リョーマ
言われたから[p]
#エリオット
三日で？[p]
#リョーマ
三日もあったじゃん[p]

#
当然のことのように言う。[p]

#
やっぱり、この子は少し変わっている。[r]もちろん、いい意味で。[p]
#エリオット
じゃあ今日は、その先やろうか[p]
#リョーマ
その先？[p]
#エリオット
打てるようになったなら、次はどこに打つか[p]

#
コートの反対側を指す。[p]
#エリオット
俺を動かしてみて[p]
#リョーマ
……[p]

#
琥珀色の目が、少しだけ楽しそうに細くなる。[p]
#リョーマ
いいよ[p]

#
ラリーを始める。[p]

#
右。[p]
左。[p]
また右。[p]

#
昨日より明らかに、俺の位置を見ている。[p]

#
そして数球目。[p]

#
予想していた方向とは逆へ、ボールが飛んだ。[p]
#エリオット
……！[p]
#リョーマ
へへ[p]

#
初めて見る顔だった。[p]

#
得意げに笑うと、九歳らしく見える。[p]

[_tb_end_text]

[glink  color="black"  storage="part1_day2.ks"  size="20"  text="今のは上手かった"  target="*choice2_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="もう一回やってみて"  target="*choice2_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="でもまだ読めるな"  target="*choice2_3"  width="max"  autopos="true"  ]
[s  ]
*choice2_1

[tb_start_text mode=4 ]
#エリオット
今のは上手かった[p]
#リョーマ
でしょ[p]

#
素直に感心した。[p]
#エリオット
でも次は取るよ[p]
#リョーマ
じゃあ、もっと取れないとこ打つから[p]

#
すぐに構え直す。[p]

#
褒められることより、次の一本のほうが大事らしい。[p]

#
【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]

[jump  storage="part1_day2.ks"  target="*base2"  ]
*choice2_2

[tb_start_text mode=4 ]
#エリオット
今の、もう一回やってみて[p]
#リョーマ
言われなくても[p]

#
すぐに次のボールを要求してくる。[p]

#
さっきと同じコース――と思わせて、今度は逆。[p]
#エリオット
……なるほど[p]
#リョーマ
どう？[p]
#エリオット
悪くない[p]
#リョーマ
悪くない、ね[p]

#
少し不満そうだ。[r]けれど、楽しそうでもある。[p]

#
【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]

[jump  storage="part1_day2.ks"  target="*base2"  ]
*choice2_3

[tb_start_text mode=4 ]
#エリオット
でも、まだ読めるな[p]
#リョーマ
……[p]
#エリオット
打つ前に目が動いてる[p]
#リョーマ
……じゃあ、次は見ない[p]

#
むっとした顔で構え直す。[p]

#
どうやら火をつけてしまったらしい。[p]

#
【好感度 ±0】[p]
[_tb_end_text]

[love value="0"]

[jump  storage="part1_day2.ks"  target="*base2"  ]
*base2

[playbgm  volume="100"  time="1000"  loop="true"  storage="Amber_Light_on_the_Dashboard.mp3"  fadein="true"  ]
[bg  time="1000"  method="crossfade"  storage="_car_twilight.png"  ]
[tb_start_text mode=4 ]
#

――レッスン終了後。[p]

#

クラブを出るころには、すっかり日が暮れていた。[p]

#

車へ戻る途中、自動販売機の前で足を止める。[p]
#エリオット
リョーマ[p]
#リョーマ
なに[p]
#エリオット
飲み物買ってくるよ[r]もちろんリョーマの分も[p]
#リョーマ
……じゃあ、お願い[p]

#

さて――。[p]

[_tb_end_text]

[glink  color="black"  storage="part1_day2.ks"  size="20"  text="ファンタグレープ"  target="*choice3_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="スポーツドリンク"  target="*choice3_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="part1_day2.ks"  size="20"  text="缶コーヒー"  target="*choice3_3"  width="max"  autopos="true"  ]
[s  ]
*choice3_1

[tb_start_text mode=4 ]
#

自動販売機から紫色の缶を取り出す。[p]

#

車に戻り、助手席のリョーマへ差し出した。[p]
#エリオット
はい[p]
#リョーマ
……ファンタ[p]
#エリオット
グレープ好きなんだろ？[p]
#リョーマ
……[p]

#

リョーマは缶と俺の顔を交互に見る。[p]
#リョーマ
覚えてたんだ[p]
#エリオット
朝聞いたばっかりだからね[p]
#リョーマ
……ふーん[p]

#

興味なさそうに答えながら、さっそくプルタブを開けている。[p]

#

一口飲んで。[p]

#

ほんの少し、口元が緩んだ。[p]
#リョーマ
ありがと[p]
#エリオット
どういたしまして[p]

#

どうやら正解だったらしい。[p]

#

【好感度 ＋2】[p]
[_tb_end_text]

[love value="2"]

[jump  storage="part1_day2.ks"  target="*base3"  ]
*choice3_2

[tb_start_text mode=4 ]
#

スポーツドリンクを一本買って車へ戻る。[p]
#エリオット
はい[p]
#リョーマ
ありがと[p]

#

受け取って、すぐに蓋を開ける。[p]

#

レッスン後なら、これが無難だろう。[p]

#

ただ、特別嬉しそうというわけでもない。[p]

#

【好感度 ±0】[p]
[_tb_end_text]

[love value="0"]

[jump  storage="part1_day2.ks"  target="*base3"  ]
*choice3_3

[tb_start_text mode=4 ]
#
自分の分と一緒に、アイスコーヒーの缶を２本買う。[p]
#エリオット
はい[p]

#リョーマ
……コーヒー[p]
#エリオット
ごめん、嫌いだった？[p]
#リョーマ
別に。飲めるし[p]

#
そう言って受け取る。[p]

#

一口だけ啜ると、しぶい顔になっている。[r]
子ども扱いは嫌いでも、どうやらコーヒーは苦手なようだ。[p]


#
【好感度 -2】[p]
[_tb_end_text]

[love value="-2"]

[jump  storage="part1_day2.ks"  target="*base3"  ]
*base3

[bg  time="1000"  method="crossfade"  storage="home_night.png"  ]
[tb_start_text mode=4 ]
#

――帰りの車内。[p]

#

助手席で飲み物を飲みながら、リョーマは窓の外を眺めている。[p]

#

前回より、車の中の沈黙が気にならなくなった。[p]
#リョーマ
ねえ[p]
#エリオット
ん？[p]
#リョーマ
次も、今日の続きやる？[p]
#エリオット
やりたい？[p]
#リョーマ
……[p]

#

少し考えてから、こちらを見る。[p]
#リョーマ
やる[p]
#エリオット
じゃあ決まり[p]

#

信号が青に変わる。[p]

#

まだ二日目。[p]

#

それでも昨日よりほんの少しだけ、この子との距離が縮まったような気がした。[p]

[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[stopse  time="1000"  buf="0"  fadeout="true"  ]
[jump  storage="part1_day3.ks"  target=""  ]
