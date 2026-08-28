[_tb_system_call storage=system/_day1.ks]
; 好感度表示
[debug_init]
[bg  time="0"  method="crossfade"  storage="school.png"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[tb_show_message_window  ]
[tb_start_text mode=4 ]
#
――翌日。[p]

#
約束の時間より少し早く学校の前に着いた。[r]校門から出てくる子供たちを眺めながら、昨日会ったばかりの少年を探す。[p]
しばらくして、人の波の中に見覚えのある顔を見つけた。[p]
#エリオット
リョーマ[p]
#リョーマ
……[p]

#
俺に気づいたリョーマは、一瞬だけ足を止めた。[r]昨日と同じ琥珀色の目が、じっとこちらを見る。[p]
#エリオット
迎えに来たよ[p]
#リョーマ
見ればわかる[p]
#エリオット
……[p]

#
愛想はない。[r]どうやら昨日だけ機嫌が悪かったわけではなさそうだ。[p]

#
リョーマは俺の横を通り過ぎ、そのまま車へ向かって歩き出した。[p]
#リョーマ
早く行こう[p]
#エリオット
車、分かるの？[p]
#リョーマ
あれでしょ[p]

#
指さされた先には、確かに俺の車がある。[p]
#
2001年式のスバル・アウトバック。[r]
ダークグリーンとゴールドのツートンカラーが気に入って、ロースクールに入る前に中古で買ったものだ。[p]
#
高級車ではないけれど、丈夫で荷物もよく載る。[r]
後ろにはいつもラケットやボールカゴを積んでいるから、コーチの仕事にも都合がいい。[p]

#エリオット
よく分かったな[p]
#リョーマ
昨日乗ってきてたじゃん[p]

#
よく見ているらしい。[p]
[_tb_end_text]

[glink  color="black"  storage="day1.ks"  size="20"  text="ちゃんと覚えてたんだな"  target="*choice1"  x="0"  y="0"  width="350"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="勝手に先に行くなよ"  target="*choice2"  autopos="true"  x="0"  y="0"  width="350"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="賢いな"  target="*choice3"  width="350"  autopos="true"  ]
[s  ]
*choice1

[tb_start_text mode=4 ]
#エリオット
ちゃんと覚えてたんだな[p]
#リョーマ
それくらい覚えてるよ[p]

#
少しだけ得意そうに見える。[p]

#
【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]
[jump  storage="day1.ks"  target="*base"  ]
*choice2

[tb_start_text mode=4 ]
#エリオット
勝手に先に行くなよ[p]
#リョーマ
……子供じゃないんだから[p]

#
また機嫌を損ねたらしい。[p]

#
【好感度 －1】[p]
[_tb_end_text]

[love value="-1"]
[jump  storage="day1.ks"  target="*base"  ]
*choice3

[tb_start_text mode=4 ]
#エリオット
賢いな[p]
#リョーマ
……[p]
#エリオット
？[p]
#リョーマ
そういう言い方、子供みたいだからやめて[p]

#

どうやら褒め方にも注文があるらしい。[p]

#
【好感度 ±0】[p]
[_tb_end_text]

[love value="0"]
[jump  storage="day1.ks"  target="*base"  ]
*base

[bg  time="1000"  method="crossfade"  storage="tennis_school_day.png"  ]
[tb_start_text mode=4 ]
#
――テニスクラブ。[p]

#

簡単なアップを済ませ、まずはラリーを見ることにした。[p]

#

最初は、九歳の子供相手だと思っていた。[p]

#

けれど――。[p]
#エリオット
……[p]

#

ボールが深い。[r]それだけじゃない。[p]

#

俺の打った球をただ返しているわけじゃない。[r]次にどこへ打てば俺が動くか、考えながら打っている。[p]

#

身体は小さい。[r]それなのに、ラケットを握っている間だけは昨日よりずっと大きく見えた。[p]
#リョーマ
ねえ[p]
#エリオット
ん？[p]
#リョーマ
さっきから全然本気で打ってないでしょ[p]
#エリオット
……[p]
#リョーマ
もっとちゃんと打ってよ[p]

#

息を弾ませながら、まっすぐこちらを見る。[p]

#

――なるほど。[r]南次郎がわざわざ練習相手を用意するわけだ。[p]

[_tb_end_text]

[glink  color="black"  storage="day1.ks"  size="20"  text="じゃあ少しだけ本気でいく"  target="*choice2_1"  x="0"  y="0"  width="350"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="まずフォームを直そう"  target="*choice2_2"  autopos="true"  x="0"  y="0"  width="350"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="九歳相手に本気は出せない"  target="*choice2_3"  width="350"  autopos="true"  ]
[s  ]
*choice2_1

[tb_start_text mode=4 ]
#エリオット
じゃあ、少しだけ本気でいく[p]
#リョーマ
少しだけ？[p]
#エリオット
返せたらもう少し上げるよ[p]
#リョーマ
……言ったね[p]

#

さっきまでより明らかに楽しそうな顔をした。[p]

#

次の球を強めに打ち込む。[p]

#

リョーマは一歩踏み込み――きれいに打ち返した。[p]
#エリオット
……！[p]
#リョーマ
まだまだだね[p]

#

思わず笑ってしまった。[p]

#
【好感度 ＋2】[p]
[_tb_end_text]

[love value="2"]
[jump  storage="day1.ks"  target="*base2"  ]
*choice2_2

[tb_start_text mode=4 ]
#エリオット
その前に、バックのフォームを少し直そう[p]
#リョーマ
フォーム？[p]
#エリオット
打点が近い。もう半歩早く入ったほうがいい[p]
#リョーマ
……[p]

#

不満そうな顔をするかと思ったが、リョーマは素直に構え直した。[p]
#エリオット
そう。そこ[p]

#

もう一球。[p]

#

今度はさっきより鋭い球が返ってくる。[p]
#リョーマ
……ほんとだ[p]

#

小さく呟いて、もう一度ラケットを構えた。[p]

#

【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]
[jump  storage="day1.ks"  target="*base2"  ]
*choice2_3

[tb_start_text mode=4 ]
#エリオット
九歳相手に本気は出せないよ[p]
#リョーマ
……[p]

#

表情が変わった。[p]
#リョーマ
もういい[p]
#エリオット
リョーマ？[p]
#リョーマ
親父と一緒じゃん[p]

#

明らかに打球が荒くなる。[p]

#

どうやら、言ってはいけないことを言ったらしい。[p]

#

【好感度 －2】[p]
[_tb_end_text]

[love value="-2"]
[jump  storage="day1.ks"  target="*base2"  ]
*base2

[bg  time="1000"  method="crossfade"  storage="_car_twilight.png"  ]
[tb_start_text mode=4 ]
#

――レッスン終了後。[p]

#

リョーマを助手席に乗せ、越前家へ向かう。[p]

#

行きよりもずっと静かだった。[p]
疲れているのかと思ったが、窓の外を眺めながら指先で何度もスイングの形を確認している。[p]
#エリオット
さっき教えたやつ？[p]
#リョーマ
……うん[p]
#エリオット
気になる？[p]
#リョーマ
次やるときまでに直したい[p]

#

本当にテニスが好きなんだろう。[p]

#

九歳でここまで熱心な子は、クラブでもそう多くない。[p]

[_tb_end_text]

[glink  color="black"  storage="day1.ks"  size="20"  text="テニス、好きなんだな"  target="*choice3_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="南次郎さんに勝ちたい？"  target="*choice3_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day1.ks"  size="20"  text="今日は疲れただろ。寝ててもいいよ"  target="*choice3_3"  width="max"  autopos="true"  ]
[s  ]
*choice3_1

[tb_start_text mode=4 ]
#エリオット
テニス、好きなんだな[p]
#リョーマ
……別に[p]
#エリオット
別に？[p]
#リョーマ
普通[p]

#

そう言いながら、まだ指は動いている。[p]

#

説得力がない。[p]
#エリオット
そっか[p]
#リョーマ
……なに笑ってんの[p]
#エリオット
別に[p]
#リョーマ
……[p]

#

少しだけ睨まれた。[p]

#

【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]
[jump  storage="day1.ks"  target="*base3"  ]
*choice3_2

[tb_start_text mode=4 ]
#エリオット
南次郎さんに勝ちたい？[p]

#

指の動きが止まった。[p]
#リョーマ
……勝つよ[p]
#エリオット
いつか？[p]
#リョーマ
いつかじゃない[p]

#

窓の外を向いたまま、リョーマは言う。[p]
#リョーマ
絶対、勝つ[p]

#

昨日見たのと同じ、強い目だった。[p]
#エリオット
……そうか[p]

#

その答えは、嫌いじゃない。[p]

#

【好感度 ＋2】[p]
[_tb_end_text]



[love value="2"]

[jump  storage="day1.ks"  target="*base3"  ]
*choice3_3

[tb_start_text mode=4 ]
#エリオット
今日は疲れただろ[r]家に着くまで寝ててもいいよ[p]
#リョーマ
……[p]
#エリオット
？[p]
#リョーマ
だから、子供扱いしないでって言ってるじゃん[p]
#エリオット
あ[p]

#

昨日聞いたばかりだった。[p]

#

どうやら俺まで同じ地雷を踏んだらしい。[p]

#

【好感度 －1】[p]
[_tb_end_text]

[love value="-1"]
[jump  storage="day1.ks"  target="*base3"  ]
*base3

[bg  time="1000"  method="crossfade"  storage="home_night.png"  ]
[tb_start_text mode=4 ]
#

車を越前家の前に停める。[p]
#エリオット
着いたよ[p]
#リョーマ
うん[p]

#
リョーマはシートベルトを外し、ドアに手をかける。[r]そのまま降りるのかと思ったが、一度だけこちらを振り返った。[p]

#リョーマ
次、いつ？[p]
#エリオット
次？[p]
#リョーマ
レッスン[p]
#エリオット
三日後だよ[p]
#リョーマ
ふーん[p]

#

短く答えて、車を降りる。[p]
#エリオット
リョーマ[p]
#リョーマ
なに[p]
#エリオット
また三日後、迎えに行くからね[p]
#リョーマ
……[p]

#

ほんの一瞬だけ迷ってから。[p]
#リョーマ
またね[p]

#

小さな背中が家の中へ消えていった。[p]

#

――１日目、終了。[p]

#

まだ、俺はあの子のことをほとんど知らない。[p]

#

ただひとつ分かったのは――[r]
あの小さな身体の中には、俺が思っていた以上に大きな負けん気が詰まっているらしい、ということだった。[p]

[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[jump  storage="day2.ks"  target=""  ]
