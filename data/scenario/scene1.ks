[_tb_system_call storage=system/_scene1.ks]

[cm  ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Amber_Light_on_the_Dashboard.mp3"  fadein="true"  ]
[bg  time="1000"  method="crossfade"  storage="tennis_school_sunset.png"  ]

; ; --- ここで左上にDAY8の日付画像を表示 ---
; [free name="date_img" layer="fix"] 
; [image storage="default/day0_icon.png" layer="fix" page="fore" x="20" y="20" name="date_img" width="100"]
; ; ------------------------------------
; 好感度表示
[debug_init]

[tb_show_message_window  ]
[tb_start_text mode=4 ]
#エリオット
よし、今日はここまで[p]
#少年たち
エリオットコーチ、また来週！[p]
#エリオット
ああ。今日教えたショット、忘れるなよ[p]
#
担当クラスの少年たちを見送り、ボールカゴを片付ける。[p]
#
地元のクラブで子供たちにテニスを教えるようになって、もうしばらく経つ。[p]
UCLAのロースクールに通うかたわら、学費と生活費の足しに始めたアルバイトだった。[p]
#
授業との両立は楽じゃないけど、子供たちともそれなりにうまくやれている。[r]
この仕事も、案外気に入っていた。[p]
#
片付けを終えたところで、不意に着信音が鳴った。[p]
#
画面に表示された名前は――[p]
#
『NANJIRO ECHIZEN』[p]
[_tb_end_text]

[tb_start_text mode=4 ]
#エリオット
……南次郎さん？[p]

#南次郎
よう。お前、まだガキにテニス教えてんだって？[p]

#エリオット
ええ。ロースクールの学費もありますから[p]

#南次郎
じゃ、ちょうどいい。ひとつ頼まれてくれ[p]

#エリオット
？[p]

#南次郎
俺が留守にする間、うちのチビのコーチやってくれねーか？[p]

#エリオット
息子さんの？[p]

#南次郎
おう。九歳。期間は四週間[p]

#エリオット
……どうして俺に？[p]

#南次郎
倫子の推薦。お前なら安心だってよ[p]

#エリオット
倫子さんが……[p]

#
倫子さんとは、ロースクールの教授を通じて知り合った。[r]
国際弁護士として活躍する彼女は、俺が将来進みたい道の先輩でもある。[p]
#
その縁で、夫である越前南次郎さんとも何度か顔を合わせていた。[r]
テニスをやっている人間なら、知らない者はいない――[r]
『サムライ南次郎』。[p]
#
世界の頂点まであと一歩というところで突然引退した、伝説的な選手だ。[r]
俺自身、あの引退を惜しんだファンの一人だった。[p]
#
その南次郎さんから、息子のコーチを頼まれるなんて。[p]
#
四週間。[r]
それくらいなら――。[p]


[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[bg  time="1000"  method="crossfade"  storage="home_day.png"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[tb_start_text mode=4 ]
――数日後。[p]

#南次郎
リョーマ。こいつが明日からお前の練習見てくれるコーチ[p]
[_tb_end_text]

[chara_show  name="リョーマ"  time="1000"  wait="false"  storage="chara/1/ryoma_magao.png"  width="974"  height="1364"  left="27"  top="-104"  reflect="false"  ]
[tb_start_text mode=4 ]
#リョーマ
…………[p]

#エリオット
エリオットだ。よろしく[p]

#
南次郎の隣に立っていたのは、思っていたよりも小柄な少年だった。[r]
同じ年頃の子供たちより、頭ひとつ――とまではいかないが、少し小さい。[p]
#
けれど、真っ先に目を引いたのはその大きな瞳だった。[r]茶色とも、金色ともつかない、明るい琥珀色。[p]
#
少年はその目で、俺を値踏みするようにじっと見上げている。[r]上目遣いのせいもあって、ほとんど睨まれているようだった。[p]
#
――ずいぶん意志の強そうな子だ。[p]
[_tb_end_text]

[chara_mod  name="リョーマ"  time="600"  cross="true"  storage="chara/1/ryoma_jitome.png"  ]
[tb_start_text mode=4 ]
#リョーマ
……俺、コーチなんていらないんだけど[p]

#南次郎
俺がスペイン行ってる間だけだ[r]一人じゃまともな練習になんねーだろ[p]

#リョーマ
じゃあ親父が行くのやめればいいじゃん[p]

#南次郎
そう拗ねんなって[r]一ヶ月くらい、いい子で待ってらんねえのか？[p]

#リョーマ
……別に拗ねてない[p]

#南次郎
へーへーそーですかっと[p]

#リョーマ
……[p]
[_tb_end_text]

[chara_mod  name="リョーマ"  time="600"  cross="true"  storage="chara/1/ryoma_fukigen.png"  ]
[tb_start_text mode=4 ]
#
リョーマの眉間に皺が寄る。[r]どうやら子供扱いされるのが、相当気に入らないらしい。[p]

#南次郎
んで、エリオット[r]話した通り、こいつの練習見てもらうのは週２回な[p]
#エリオット
ええ[p]
#南次郎
学校終わったら迎えに行って、そのままクラブ連れてってやってくれ[r]終わったら家まで送り届けりゃいい[p]
#エリオット
分かりました[p]
#リョーマ
一人で行けるけど[p]
#南次郎
な〜にいっちょ前なこと言ってんだ[r]
こっちじゃ九歳のガキ一人で出歩かせるわけにもいかねーんだよ[r]
おとなしく送ってもらえ[p]
#リョーマ
……子供扱いすんなよ[p]
#南次郎
子供だろーが[p]
#リョーマ
…………[p]

#
また露骨に機嫌が悪くなった。[r]
どうやら地雷を踏むのは、そう難しくないらしい。[p]
#南次郎
ま、細けえことは明日からでいいだろ[r]今日は顔合わせだけな[p]
#エリオット
分かりました[p]
#南次郎
リョーマ。明日からちゃんと言うこと聞けよ[p]
#リョーマ
それはこの人がちゃんと強かったらね[p]

#エリオット
……[p]
#南次郎
カッカッカッ！　だとよ[p]
#
なるほど。[r]九歳の子供にしては、ずいぶんな言い草だ。[r]けれど、不思議と腹は立たなかった。[p]
むしろ――少しだけ興味が湧いた。[p]
#エリオット
じゃあ、明日確かめてみるかい？[p]
[_tb_end_text]

[tb_start_text mode=4 ]
#リョーマ
……[p]
[_tb_end_text]

[chara_mod  name="リョーマ"  time="600"  cross="true"  storage="chara/1/ryoma_odoroki.png"  ]
[wait  time="1500"  ]
[tb_start_text mode=4 ]
#
琥珀色の目が、わずかに見開かれる。[p]
[_tb_end_text]

[chara_mod  name="リョーマ"  time="600"  cross="true"  storage="chara/1/ryoma_tokuige.png"  ]
[tb_start_text mode=4 ]
#
それから、ほんの少しだけ口元が上がった。[p]
[_tb_end_text]

[tb_start_text mode=4 ]
#リョーマ
いいよ[p]
#エリオット
決まりだな[p]
#南次郎
おーおー。仲良くやれそうじゃねえか[p]
#リョーマ
別に[p]
#
そう言って、リョーマはさっさと家の中に入っていった。[p]

[_tb_end_text]

[chara_hide  name="リョーマ"  time="1000"  wait="true"  pos_mode="true"  ]
[tb_start_text mode=4 ]
四週間。[p]
その間だけ、あの子のテニスを見る。[p]


小さな背中を見送りながら、俺は明日の予定を頭の中で組み直す。[p]


それが、このときの俺にとってのすべてだった。[p]
[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[stopse  time="1000"  buf="0"  fadeout="true"  ]
[jump  storage="part1_day1.ks"  target=""  ]
