[_tb_system_call storage=system/_part1_day4.ks]

*base0
[set_chapter id="part1_day4"]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Sunny_Afternoon_Driveway.mp3"  ]
[bg  time="0"  method="crossfade"  storage="school.png"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[tb_show_message_window  ]
[tb_start_text mode=4 ]
#
──四日目。[p]
#
待ち合わせ場所へ着くと、リョーマはもうそこにいた。[r]
[chara_part_reset name="Ryoma"]
[chara_show  name="Ryoma"  time="1000"  wait="true"  left="326"  top="-54" ]
いつものように、約束の十五分前だ。[p]
#
けれど今日は、ベンチにも座らず、ラケットバッグを背負ったまま立っている。[p]
#
こちらの車を見つけると、すぐに歩き出した。[p]

#エリオット
待たせた？[p]

#リョーマ
別に。今来たとこ[p]

#
そう答えながら助手席に乗り込む。[r]
[bg  time="1000"  method="crossfade"  storage="car_day.png"  ]
たぶん、嘘だ。[p]
#
助手席に乗り込んでシートベルトを締めたリョーマは、ラケットバッグを膝の上に抱えたまま、こちらを見た。[p]

#エリオット
今日はずいぶんやる気だね[p]

[face_jito]
#リョーマ
いつもやる気あるけど[p]

#エリオット
じゃあ、今日はいつも以上に？[p]

#リョーマ
……まあね[p]

#
エンジンをかける。[r]
いつもならすぐに窓の外を見るのに、今日はまだこちらを見ている。[p]

#エリオット
何か言いたいことがある？[p]

#リョーマ
今日さ[p]

#エリオット
うん[p]

#リョーマ
俺と試合してよ[p]

#
迷いのない言葉だった。[p]

#エリオット
試合なら、いつも練習の最後にしてるだろ[p]

[chara_part  name="Ryoma" mayuge="ryoma_mayuge_ikari" time="600"]
#リョーマ
あんなの試合じゃない[p]

#
リョーマの指が、ラケットバッグの肩紐を強く握る。[p]

#リョーマ
俺が打ちやすいところに返して、取れそうにない球は打たない。[r]
アンタ、ずっと手加減してるじゃん[p]

#エリオット
君は9歳で、俺はコーチだ[p]

#リョーマ
だから何？[p]

#
間髪を入れずに返された。[p]

#リョーマ
9歳だから負けてもしょうがないって思ってるなら、最初からそう言えばいいじゃん[p]

#エリオット
そういう意味じゃないよ[p]

#リョーマ
じゃあ、今日は本気でやって[p]

#
その目は、挑発しているというよりも、何かを確かめようとしているように見えた。[p]
#
前回話した、兄のこと。[r]
強くなれば、いつか世界の頂点で会えると信じている相手。[p]
#
もしかするとリョーマは、自分が今どこにいるのかを知りたがっているのかもしれない。[p]

; #エリオット
; 本気でやったら、たぶん君が負ける[p]

; #リョーマ
; やってみなきゃ分かんないでしょ[p]

; #エリオット
; 負けても、途中でやめない？[p]

; #リョーマ
; やめるわけないじゃん[p]

; #
; 助手席から、まっすぐな視線が向けられる。[p]

; #リョーマ
; 俺、アンタに勝ちたい[p]

; #
; 父親でも、兄でもなく。[r]
; 初めて、俺自身がリョーマの倒したい相手として選ばれた。[p]
; #
; コーチとして喜ぶべきなのか、それとも困るべきなのか。[r]
; 少し考えてから、俺は車を発進させた。[p]

[_tb_end_text]

[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="分かった。本気でやろう"  target="*choice1_1"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="どうして急に？"  target="*choice1_2"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="9歳の子に本気は出せない"  target="*choice1_3"  width="max"  autopos="true"  ]
[s  ]
*choice1_1


;------------------------------
;「分かった。本気でやろう」
;好感度+2
;------------------------------


[love value="2"]

[tb_start_text mode=4 ]

#エリオット
分かった。本気でやろう[p]

[chara_part  name="Ryoma" mayuge="ryoma_mayuge_ue" eye="ryoma_eye_odoroki" time="600"]

#
そう答えた途端、リョーマの目がわずかに見開かれた。[p]

#リョーマ
……ほんとに？[p]

#エリオット
君が望んだんだろ[p]

#リョーマ
そうだけど。[r]
どうせまた、子ども相手だからって断ると思ってた[p]

#エリオット
そこまで言われて、引き下がるわけにはいかないな[p]

[face_bishou eye="ryoma_eye_default_yoko"]
#リョーマ
ふーん[p]

#
澄ました顔で窓の外を向く。[r]
けれど、口元には隠しきれない笑みが浮かんでいた。[p]

#リョーマ
あとで言い訳しても遅いから[p]

#エリオット
それはこっちの台詞だよ[p]

#
リョーマは返事の代わりに、膝の上のラケットバッグを抱き直した。[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base"  ]
*choice1_2


;------------------------------
;「どうして急に？」
;好感度+1
;------------------------------


[love value="1"]

[tb_start_text mode=4 ]
#エリオット
どうして急に？[p]

#リョーマ
急じゃないよ[p]

#エリオット
前から俺と試合したかった？[p]

#リョーマ
……まあね[p]

#
リョーマは窓の外へ顔を向けた。[r]
けれど、ラケットバッグの肩紐を握る指には力が入ったままだ。[p]

#リョーマ
アンタがどのくらい強いのか、まだちゃんと知らないし[p]

#エリオット
俺の強さを確かめたいの？[p]

#リョーマ
それもあるけど[p]

#
そこで言葉を切り、リョーマはこちらを振り返った。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
俺が今、どのくらい強いのか知りたい[p]

#
前回、リョーマが話してくれた兄のことを思い出す。[r]
強くなれば、いつか世界の頂点で会えると信じている相手。[p]
#
ただ勝ちたいだけではないのだろう。[r]
自分がそこへ近づけているのか、確かめたいのだ。[p]

#エリオット
分かった。今日は試合をしよう[p]

[chara_part  name="Ryoma" mayuge="ryoma_mayuge_ue" eye="ryoma_eye_odoroki" time="600"]
#リョーマ
本気で？[p]

#エリオット
本気で[p]

[face_bishou]
#リョーマ
ならいいけど[p]

#
素っ気なく答えながらも、その声は少し弾んでいた。[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base"  ]
*choice1_3


;------------------------------
;「9歳の子に本気は出せない」
;好感度-1
;------------------------------


[love value="-1"]

[minus_count]

[tb_start_text mode=4 ]
#エリオット
9歳の子に本気は出せない[p]

[face_ikari mayuge="ryoma_mayuge_default" eye="ryoma_eye_ikari_yoko"]
#
リョーマの表情から、すっと熱が消えた。[p]

#リョーマ
……あっそ[p]

#
短く答え、ラケットバッグを抱えたまま窓の外を向く。[p]

#エリオット
体格も経験も違う。[r]
同じ条件の試合にはならないだろ[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
だから、負けても仕方ないって？[p]

#エリオット
そうは言ってない[p]

#リョーマ
同じじゃん[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_mu" time="600"]
#
それきり、リョーマは黙り込んだ。[r]
車内に、エンジンの低い音だけが残る。[p]
#
信号が赤に変わり、車を止める。[r]
助手席を見ると、リョーマは唇を噛んでいた。[p]

#リョーマ
俺が子どもだから、怖くないんでしょ[p]

#エリオット
リョーマ[p]

#リョーマ
じゃあ、俺が絶対に取れない球、打ってみてよ[p]

#
挑発的な言葉とは裏腹に、その横顔は傷ついているように見えた。[p]

#リョーマ
それでも追いつくから[p]

#
そこまで言わせてしまったことに、胸が痛んだ。[r]
俺は小さく息を吐き、ハンドルを握り直した。[p]

#エリオット
……分かった。今日は本気でやる[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
今さら変えなくていいけど[p]

#エリオット
君が9歳だからじゃない。[r]
ひとりの選手として、君の挑戦を受ける[p]

#
リョーマはすぐには答えなかった。[r]
やがて、こちらを見ないまま小さく呟いた。[p]

#リョーマ
最初から、そう言えばいいじゃん[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base"  ]
*base
[chara_hide  name="Ryoma"  time="600" ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Courtside_Afternoon.mp3"  ]
[bg  time="1000"  method="crossfade"  storage="tennis_school_day.png"  ]
[tb_start_text mode=4 ]
#
──テニスクラブ。[p]

[face_default_cap time="0"]
[chara_show  name="Ryoma"  time="1000"  wait="true"  left="326"  top="-54" ]
#
コートに着いてからも、リョーマは落ち着かなかった。[p]
#
ストレッチを終え、ショートラリーを始める。[r]
いつもより打点が前で、球足も速い。[p]

#エリオット
力が入りすぎてる[p]

[face_ira_cap ]
#リョーマ
入ってない[p]

#エリオット
試合のことばかり考えてるだろ[p]

#リョーマ
別に[p]

#
そう答えた直後、リョーマのボールがベースラインを大きく越えた。[p]

#エリオット
ほら[p]

#リョーマ
……今のは風[p]

#エリオット
今日はほとんど吹いてないよ[p]

#リョーマ
うるさい[p]

#
ボールを拾いに行く背中からも、苛立ちが伝わってくる。[r]
俺はラケットを肩に担ぎ、その小さな背中へ声をかけた。[p]

#エリオット
先に試合をする？[p]

[face_odorki_cap]
#
リョーマが振り返る。[p]

#リョーマ
いいの？[p]

#エリオット
このままじゃ、練習にならないからね[p]

[face_bishou_cap]
#リョーマ
俺はどっちでもいいけど[p]

#
そう言いながら、もうボールを選び始めている。[r]
ずいぶん分かりやすい。[p]

#エリオット
四ゲーム先取。ノーアドバンテージでやろう[p]

#リョーマ
普通の一セットじゃないの？[p]

#エリオット
今日は時間が限られてるからね[p]

[face_tokui_cap]
#リョーマ
いいよ。[r]
絶対、決着つけるから[p]
[_tb_end_text]

[playbgm  volume="100"  time="1000"  loop="true"  storage="Gallop_at_the_Limit.mp3"  ]
[tb_start_text mode=4 ]
[face_default_cap mayuge="ryoma_mayuge_kiri"]
#
トスに勝ったリョーマが、迷わずサーブを選ぶ。[r]
ベースラインに立った瞬間、その表情から子どもらしさが消えた。[p]

#リョーマ
いくよ[p]

#
身体を反らし、小さな手からボールが放たれる。[r]
左利き特有の回転がかかったサーブが、ワイドへ逃げていく。[p]
#
コースも、回転も悪くない。[r]
9歳の選手が打つ球としては、間違いなく優れている。[p]
#
だからこそ、注文どおりに返した。[p]
#
踏み込み、まだ上がりきる前のボールを叩く。[r]
リターンがリョーマの横を抜け、コートの隅へ突き刺さった。[p]

[chara_part  name="Ryoma" eye="ryoma_eye_odoroki" time="600"]
#リョーマ
……っ[p]

#エリオット
[ruby text="ラブ・フィフティーン" x="35px"]０−１５[p]

[face_ira_cap ]
#
リョーマが無言で次のボールを取り出す。[p]
#
二本目は、センターへのフラットサーブ。[r]
一歩で回り込み、今度はバック側へ返す。[p]
#
リョーマは追いついた。[r]
崩れた体勢のままボールを持ち上げ、深く返してくる。[p]
#
その判断は正しい。[r]
けれど、次の球には届かなかった。[p]

#エリオット
[ruby text="ラブ・サーティ" x="35px"]０−３０[p]

#
いつもの練習なら、追いつける場所へ返していた。[r]
ラリーが続くように、少し速度を落としていた。[p]
#
今日は、それをしない。[p]
#
リョーマが守ったコースとは反対へ打つ。[r]
浅い球が来れば前へ出る。[r]
浮いたボールは、迷わず叩く。[p]
#
ポイントを取るために、最も確実な球を選び続けた。[p]

#エリオット
ゲーム。[ruby text="ワン・ラブ" x="20px"]１−０[p]

#
コートチェンジはない。[r]
リョーマはその場でラケットを握り直し、こちらを睨んだ。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
まだ最初のゲームじゃん[p]

#エリオット
そうだね[p]

#
次は俺のサービスゲーム。[r]
[chara_part  name="Ryoma" mouse="ryoma_mouse_mu" time="600"]
リョーマはベースラインよりも後ろに下がった。[p]
#
彼なら、俺が練習のときとは違うサーブを打ってくることに気づいている。[r]
それでも、その目から闘志は消えていなかった。[p]
#
俺はボールを二度つき、息を整えた。[p]
#
テニスを始めたのは、リョーマとそう変わらない年齢だった。[r]
ジュニア時代には州大会を勝ち上がり、大学へ進んでからも選手としてコートに立っていた。[p]
#
プロを目指せるほどの選手ではなかった。[r]
それでも、9歳の子どもに合わせてきたこれまでの球が、俺の限界ではない。[p]
#
ボールを上げる。[r]
身体を反らし、最も高い位置で叩いた。[p]

#
乾いた音が、コートに響いた。[p]
[chara_part  name="Ryoma" eye="ryoma_eye_odoroki" time="600"]
#
リョーマが反応したときには、ボールはすでにサービスラインの内側で跳ねていた。[r]
伸ばされたラケットの先を抜け、そのままフェンスへ突き刺さる。[p]

#エリオット
[ruby text="フィフティーン・ラブ" x="35px"]１５−０[p]

#
リョーマはフェンスに転がったボールを一度だけ振り返り、すぐに構え直した。[p]

[face_ira_cap ]
#リョーマ
もう一本[p]

#
次のポイント。[r]
今度はトスが上がった瞬間に反応した。[p]
#
けれど、ラケットを振り始めるより早く、ボールがサービスラインの内側で跳ねる。[r]
高く弾んだボールは、そのまま背後のフェンスへ突き刺さった。[p]

#エリオット
[ruby text="サーティ・ラブ" x="35px"]３０−０[p]
#
三ポイント目。[r]
俺がトスを上げると、リョーマの身体が沈んだ。[p]
#
今度は先に動かない。[r]
ぎりぎりまでコースを見極めるつもりらしい。[p]
#
ワイドへ回転をかけたサーブを打つ。[r]
リョーマが地面を蹴った。[p]
#
判断は合っていた。[r]
それでも、届かない。[p]
#
ラケットを伸ばしたわずか先をボールが抜けていった。[p]

#エリオット
[ruby text="フォーティ・ラブ" x="35px"]４０−０[p]

#
三本とも、ラケットに触れることすらできていない。[p]
#
それでもリョーマの目から、闘志は消えていなかった。[r]
むしろ球を受けるたびに、こちらを見る目が鋭くなっていく。[p]
[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
次は当てる[p]
#
四ポイント目。[r]
リョーマはベースラインのさらに後ろで構えた。[p]
#
速度に追いつけないなら、距離を取って時間を作る。[r]
9歳とは思えないほど冷静な判断だった。[p]
#
俺が放ったサーブは、サービスコートの中央へ深く突き刺さった。[r]
[face_ikari_cap eye="ryoma_eye_odoroki"]
リョーマは正しい方向へ踏み込み、ラケットを振る。[p]
#
今度は、ラケットの先がボールをかすめた。[r]
わずかに軌道を変えたボールが、コートの外へ飛んでいく。[p]

#エリオット
ゲーム。[r]
[ruby text="ツー・ラブ" x="20px"]２−０[p]

#
リョーマは振り切った姿勢のまま、しばらく動かなかった。[p]
#
やがて身体を起こすと、悔しそうに奥歯を噛み、ラケットを握り直した。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……次は返すから[p]

#
このゲームで一度も返せなかったことより、次にどう返すかを考えている。[r]
その目はもう、次の俺のサービスゲームを見ていた。[p]

#
三ゲーム目。[r]
リョーマのサーブを、深く返す。[p]
[face_ikari_cap]
#
長いラリーになった。[r]
右へ、左へ。[r]
リョーマは何度振られても、食らいついてくる。[p]
#
息を切らしながら、届かないはずのボールへ手を伸ばす。[r]
小さな身体が、コートを駆ける。[p]
#
十球目。[r]
俺の返球が、ほんの少しだけ浅くなった。[p]
#
リョーマが踏み込む。[r]
鋭い左手のフォアハンドが、俺の足元へ突き刺さった。[p]

[chara_part  name="Ryoma" eye="ryoma_eye_jitome"  mayuge="ryoma_mayuge_kiri" mouse="ryoma_mouse_wa" time="600"]
#リョーマ
よし……！[p]

#
初めて奪ったポイント。[r]
リョーマは拳を握り、俺を見た。[p]

[face_ikari_cap]
#
その顔には、もう負けかけている選手の色はなかった。[r]
たった一点からでも、ここから逆転するつもりでいる。[p]

#エリオット
[ruby text="ラブ・フィフティーン" x="35px"]０−１５[p]

#
次のポイントから、さらに深く打った。[r]
今度は、同じ隙を与えない。[p]

#エリオット
ゲーム。[ruby text="スリー・ラブ" x="20px"]３−０[p]

#
リョーマは額の汗を手の甲で拭った。[r]
肩が大きく上下している。[p]

#エリオット
少し休む？[p]

#リョーマ
いらない[p]

#エリオット
水だけでも飲んだほうがいい[p]

#リョーマ
いらないって言ってるでしょ[p]

#
拒む声が、わずかに震えていた。[r]
それでもリョーマは、すぐにベースラインへ戻っていく。[p]

#リョーマ
早く次のサーブ打ってよ[p]

#
第四ゲーム。[r]
俺がこのゲームを取れば、試合は終わる。[p]
#
最初のポイント。[r]
リョーマはコースを読み、ラケットを伸ばした。[p]
#
今度は触れた。[r]
けれど、フレームに当たったボールは横へ大きく弾かれた。[p]

#エリオット
[ruby text="フィフティーン・ラブ" x="35px"]１５−０[p]

#
次のポイント。[r]
リョーマはさらに後ろへ下がり、正面でボールを捉えようとした。[p]
#
ガットに当たったボールが、低くネットへ向かう。[r]
しかし、手前で失速してコートへ落ちた。[p]

#エリオット
[ruby text="サーティ・ラブ" x="35px"]３０−０[p]

#
三ポイント目。[r]
俺のサーブに合わせ、リョーマが身体ごとラケットを押し出した。[p]
#
ボールはネットの白帯にぶつかり、わずかに跳ねる。[r]
そのまま、リョーマ側のコートへ落ちた。[p]

#エリオット
[ruby text="フォーティ・ラブ" x="35px"]４０−０[p]

#
少しずつ、確実に近づいている。[r]
それでも、まだ一本もネットを越えてはいない。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
次は返す[p]

#
マッチポイント。[p]
俺がトスを上げた瞬間、リョーマが動いた。[p]
[face_ikari_cap]
#
これまでの三球で、コースもタイミングも読まれている。[r]
リョーマは両手でラケットを握り、身体ごとボールの正面へ入った。[p]
#
両手のバックハンドで振り始めたラケットとボールが、真正面からぶつかる。[p]

#
鋭い音が響いた。[r]
[face_odorki_cap]
次の瞬間、リョーマのラケットが手を離れた。[p]
#
ラケットは地面を跳ね、数メートル先へ転がっていく。[r]
返しきれなかったボールも、コートの外へ大きく弾かれた。[p]

#エリオット
ゲームセット。[r]
[ruby text="フォー・ラブ" x="20px"]４−０[p]
#
[_tb_end_text]

[stopbgm  fadeout="true"  time="3000"  ]
[wait  time="4000"  ]
[playbgm  volume="100"  time="3000"  loop="true"  storage="Before_the_Coffee_Cools.mp3"  fadein="true"  ]
[tb_start_text mode=4 ]
#
リョーマは、空になった両手を見つめていた。[p]

#エリオット
リョーマ、手を見せて[p]

[face_jito_cap]
#リョーマ
平気[p]

#エリオット
いいから[p]

#
ネットを越えて近づく。[r]
リョーマの手を取り、指が動くことと、腫れがないことを確かめた。[p]

#エリオット
痛む？[p]

#リョーマ
ちょっと痺れただけ[p]

#エリオット
今日はもうラケットを握らないで[p]

#リョーマ
まだできる[p]

#エリオット
試合は終わったよ[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
もう一回──[p]

#エリオット
まずは冷やそう[p]

[face_jito_cap]

#
リョーマが何か言い返すより先に、ベンチへ連れていく。[r]
救急用のクーラーボックスから保冷剤を取り出し、タオルで包んだ。[p]

#エリオット
これを持ってて[p]

#
リョーマは不満そうな顔をしながらも、両手で保冷剤を受け取った。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……今の、ちゃんと当たってた[p]

#エリオット
うん[p]

#リョーマ
次は返せる[p]

#エリオット
そうかもしれないね[p]

[face_mabuka_cap]
#リョーマ
かもしれないじゃない。[r]
絶対返す[p]

#
そう言って顔を伏せる。[r]
タオルに包まれた保冷剤を、両手で強く握りしめていた。[p]
[chara_part  name="Ryoma" eye_etc="ryoma_tears" time="600"]
#
しばらくして、帽子のつばから雫が落ちた。[r]
汗ではなかった。[p]
#
声をかけようとすると、リョーマがさらに帽子を深くかぶった。[p]

#リョーマ
……見ないで[p]

[_tb_end_text]

[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="何も言わず、視線を外す"  target="*choice2_1"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="悔しかったな"  target="*choice2_2"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="負けることも練習のうちだ"  target="*choice2_3"  width="max"  autopos="true"  ]
[s  ]
*choice2_1

[tb_start_text mode=4 ]
;------------------------------
;選択肢1
;「何も言わず、視線を外す」
;好感度＋2
;------------------------------
[love value="2"]
#
何も答えず、リョーマの隣に腰を下ろした。[r]
顔は見ず、正面のコートへ視線を向ける。[p]
#
隣から、小さく鼻をすする音が聞こえる。[r]
それにも気づかないふりをした。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……ほんとに見てない？[p]

#エリオット
見てないよ[p]

#リョーマ
絶対？[p]

#エリオット
絶対[p]
[chara_part  name="Ryoma" mouse="ryoma_mouse_mu" time="600"]
#
しばらくして、隣でリョーマが動く気配がした。[p]

[face_jito_cap cheek="ryoma_hohosome" mouse="ryoma_mouse_mu"  eye_etc="none"]
#リョーマ
もう大丈夫[p]

#
振り返ると、涙は止まっていた。[r]
目元はまだ赤いが、リョーマはまっすぐコートを見ている。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
次は絶対返すから[p]

#エリオット
うん[r]
待ってるよ[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base2"  ]
*choice2_2

[tb_start_text mode=4 ]
;------------------------------
;選択肢2
;「悔しかったな」
;好感度＋1
;------------------------------
[love value="1"]

#エリオット
悔しかったな[p]
#
リョーマの隣に腰を下ろし、正面のコートを見た。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……悔しくない[p]

#エリオット
そう？[p]

#リョーマ
目に汗が入っただけ[p]

#
うつむいたまま、リョーマが袖で目元を拭う。[p]

#エリオット
じゃあ、汗が止まるまで待ってるよ[p]

#リョーマ
待たなくていい[p]

#エリオット
でも、ひとりにしてほしいとは言わなかっただろ[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_mu" time="600"]
#
リョーマは何も答えなかった。[r]
保冷剤を包んだタオルを、両手で握りしめている。[p]

[face_jito_cap cheek="ryoma_hohosome"]
#リョーマ
次は負けないから[p]
#
ぶっきらぼうに答えながら、リョーマがようやくこちらを振り返る。[r]
目元はまだ赤かったが、涙は止まっていた。[p]

#エリオット
うん。待ってるよ[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base2"  ]
*choice2_3

[tb_start_text mode=4 ]
;------------------------------
;選択肢3
;「負けることも練習のうちだ」
;好感度－2
;------------------------------
[love value="-2"]
[minus_count]
#
リョーマの前へ回り込み、目線の高さを合わせるようにしゃがんだ。[p]

#エリオット
負けることも、練習のうちだよ[p]

#
リョーマは帽子のつばを押さえ、顔を背けた。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_hanbiraki" time="600"]
#リョーマ
見ないでって言ったじゃん[p]
#エリオット
負けた試合から学べることもある[p]

#リョーマ
そんなの分かってる[p]

#エリオット
今日できなかったことを、次の練習で──[p]

[face_ikari_cap eye_etc="ryoma_shitamabuta_tears" mouse="ryoma_mouse_kuchiake" cheek="ryoma_hohosome"]
#リョーマ
分かってるって言ってるじゃん！[p]

#
顔を上げたリョーマの頬には、まだ涙の跡が残っていた。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_mu" time="600"]
#リョーマ
負けたのが初めてだと思ってるの？[p]

#エリオット
そういう意味じゃないよ[p]

#リョーマ
だったら、今コーチみたいなこと言わないで[p]

#
その言葉に、何も返せなくなる。[p]
#
今のリョーマが欲しかったのは、正しい助言ではなかった。[r]
そんな簡単なことにも気づけなかったらしい。[p]

#エリオット
……ごめん[p]

#
リョーマは袖で乱暴に目元を拭った。[p]

[face_ikari_cap eye="ryoma_eye_ikari_yoko" cheek="ryoma_hohosome"]
#リョーマ
もういい[p]

#エリオット
リョーマ[p]

#リョーマ
次は絶対勝つ。[r]
それでいいでしょ[p]

#
拒むように言い切ると、リョーマはベンチから立ち上がった。[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base2"  ]
*base2
[chara_hide  name="Ryoma"  time="600" ]
[playbgm  volume="100"  time="1000"  loop="true"  storage="Amber_Light_on_the_Dashboard.mp3"  ]
[bg  time="1000"  method="crossfade"  storage="car_twilight.png"  ]
[tb_start_text mode=4 ]

#
──帰りの車内。[p]
車内は、いつもより静かだった。[p]

[face_default_cap mayuge="ryoma_mayuge_default" eye="ryoma_eye_jitome_yoko" time="0"]
[chara_show  name="Ryoma"  time="1000"  wait="true"  left="326"  top="-54" ]
#
リョーマは助手席で帽子を深くかぶり、窓の外を見ている。[r]
膝の上には、保冷剤を包んだタオルが置かれていた。[p]
#
試合が終わってから、必要なこと以外はほとんど口にしていない。[p]
#
赤信号で車を止める。[r]
横目で見ると、リョーマはラケットを握っていた手を、ゆっくり開いたり閉じたりしていた。[p]

#エリオット
手、まだ痺れる？[p]

#リョーマ
もう平気[p]

#エリオット
痛くなったり、腫れたりしたら、すぐ倫子さんに言うんだよ[p]

#リョーマ
分かってる[p]

#
短い返事のあと、また会話が途切れた。[p]
#
普段なら、レッスンで打てるようになった球や、次に試したいことを話す時間だ。[r]
けれど今日は、エンジンの低い音だけが車内を満たしている。[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……コーチはさ[p]

#エリオット
うん[p]

#リョーマ
昔から、あんなサーブ打てたの？[p]

#エリオット
まさか、君くらいのころはコートに入れるだけで精一杯だったよ[p]

#リョーマ
じゃあ、いつから強くなったの？[p]

#
リョーマらしい聞き方だった。[r]
俺自身ではなく、どうすればあのサーブへ辿り着けるのかを知りたいらしい。[p]

#エリオット
そうだな、身体が大きくなってからかな。[r]
ジュニアのころは州大会にも出てたし、大学でも選手として試合に出てた[p]

#リョーマ
なんでプロにならなかったの？[p]

#エリオット
なれるほど強くなかったからね[p]

[chara_part  name="Ryoma" eye="ryoma_eye_default" mouse="ryoma_mouse_okuchi" time="600"]
#
リョーマがようやくこちらを向いた。[p]

#リョーマ
……あれだけ強いのに？[p]

#エリオット
俺より強い選手なんて、いくらでもいたよ[p]

[face_default_cap eye="ryoma_eye_jitome_yoko" ]
#
リョーマは黙り込み、再び窓の外を向いた。[p]
#
世界の広さを知って、怖くなっただろうか。[r]
そう思ったけれど、その目から闘志は消えていなかった。[p]

[chara_part  name="Ryoma"  mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……じゃあ、次は勝つから[p]

#エリオット
次？[p]

#リョーマ
次のレッスン[p]

#エリオット
え、また試合をするつもり？[p]

[face_jito_cap]
#リョーマ
当たり前じゃん。[r]
一回負けたくらいで終わるわけないでしょ[p]

#
その言葉に、思わず笑ってしまった。[p]

[face_ira_cap]
#リョーマ
なにがおもしろいの？[p]

#エリオット
いや。安心しただけ[p]

[chara_part  name="Ryoma" mayuge="ryoma_mayuge_default" eye="ryoma_eye_ikari_yoko" time="600"]
#リョーマ
意味分かんない[p]

#
ふてくされたように窓の外を向く。[r]
それでも、行きの車内にあった張り詰めた空気は少しだけ薄れていた。[p]
#
越前家へ続く住宅街に入る。[r]
あと数分で到着するというところで、リョーマが小さく口を開いた。[p]

[chara_part  name="Ryoma" eye="ryoma_eye_jitome" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
今日のこと……[p]

#エリオット
試合のこと？[p]

#リョーマ
……親父には言わないで[p]

#エリオット
負けたことを？[p]

#リョーマ
違う[p]

[face_mabuka_cap]
#
リョーマは帽子のつばをさらに下げた。[p]

#リョーマ
泣いたこと[p]

#
聞き取れないほど小さな声だった。[r]
顔を伏せたまま、こちらの返事を待っている。[p]

[_tb_end_text]

[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="二人だけの秘密だ"  target="*choice3_1"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="泣くのは悪いことじゃない"  target="*choice3_2"  width="max"  autopos="true"  ]
[glink  color="customized_button"  storage="part1_day4.ks"  size="20"  text="コーチとして報告しないとな"  target="*choice3_3"  width="max"  autopos="true"  ]
[s  ]
*choice3_1

[tb_start_text mode=4 ]
;------------------------------
;「二人だけの秘密だ」
;好感度＋2
;------------------------------
[love value="2"]
#エリオット
もちろん。[r]
二人だけの秘密だ[p]
[face_default_cap]
#
リョーマがゆっくり顔を上げた。[p]
#リョーマ
絶対？[p]
#エリオット
絶対[p]
#リョーマ
母さんにも？[p]
#エリオット
誰にも言わない[p]
#
リョーマは念を押すように、しばらくこちらを見つめた。[p]
[face_bishou_cap]
やがて安心したように、表情を緩めると、座席へ背中を預ける。[p]
#リョーマ
……ならいいけど[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base3"  ]
*choice3_2

[tb_start_text mode=4 ]
;------------------------------
;「泣くのは悪いことじゃない」
;好感度＋1
;------------------------------
[love value="1"]
#エリオット
泣くのは悪いことじゃないよ[p]

[face_ira_cap]
#リョーマ
そういうことじゃない[p]

#エリオット
悔しかったんだろ[p]

[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi" time="600"]
#リョーマ
……だから、言わないでって言ってる[p]

#エリオット
分かった。[r]
誰にも言わないよ[p]

#リョーマ
親父にも、母さんにも？[p]

#エリオット
誰にも[p]

[face_ira_cap]
#
リョーマはまだ少し不満そうだったが、帽子のつばから手を離した。[p]

#リョーマ
ならいい[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base3"  ]
*choice3_3

[tb_start_text mode=4 ]
;------------------------------
;「コーチとして報告しないとな」
;好感度－3
;------------------------------
[love value="-3"]
[minus_count]

#エリオット
どうしようかな。[r]
コーチとして、南次郎さんには今日のことも報告しないといけないし[p]

[face_aseri_cap]
#
リョーマが勢いよくこちらを振り返った。[p]

#リョーマ
はぁ！？[p]

#エリオット
今日のレッスンで起きたことは、きちんと伝えないとな。[r]
本気で試合をして、[ruby text="フォー・ラブ" x="20px"]４−０で負けて、それから──[p]

[chara_part  name="Ryoma" cheek="ryoma_hohosome" time="600"]
#リョーマ
やだ！言わないでよ！[p]

#
帽子の下から覗く顔が、一気に赤くなる。[r]
本気で焦っているらしい。[p]

#エリオット
でも、保護者への報告はコーチの大事な仕事だから[p]

[chara_part  name="Ryoma" eye="ryoma_eye_jitome" mouse="ryoma_mouse_okuchi"  time="600"]
#リョーマ
絶対、楽しんでるでしょ[p]

#エリオット
そんなことないよ[p]

[face_aseri_cap]
#リョーマ
じゃあ笑うな！[p]
#
どうやら、口元に出ていたらしい。[p]


#リョーマ
言ったら、もうあんたの車乗らないから！[p]

#エリオット
それは困るな[p]

#リョーマ
レッスンも受けない！[p]

#エリオット
それはもっと困る[p]

#
これ以上引っ張ると、本当に嫌われそうだ。[p]

#エリオット
冗談だよ。[r]
誰にも言わない[p]

[face_jito_cap]
#リョーマ
……ほんとに？[p]

#エリオット
本当に。[r]
泣いたことは、君と俺だけの秘密にしておく[p]

#
リョーマは疑うようにこちらを見ていたが、やがてむっとした顔で窓の外を向いた。[p]
[chara_part  name="Ryoma" eye="ryoma_eye_jitome_yoko"]
#リョーマ
性格悪い[p]

#エリオット
ごめん。ちょっとからかいたくなった[p]

#リョーマ
全然おもしろくなかった[p]

#エリオット
反省してるよ[p]

[chara_part  name="Ryoma" eye="ryoma_eye_ikari_yoko"]
#リョーマ
……最低[p]

[_tb_end_text]

[jump  storage="part1_day4.ks"  target="*base3"  ]
*base3
[chara_hide  name="Ryoma"  time="600" ]
[bg  time="1000"  method="crossfade"  storage="home_night.png"  ]
[tb_start_text mode=4 ]
;------------------------------
;共通ルート
;------------------------------
[face_default_cap eye="ryoma_eye_default" time="0"]
[chara_show  name="Ryoma"  time="1000"  wait="true"  left="326"  top="-54" ]
#
越前家の前に車を止める。[r]
リョーマは保冷剤をシートに置き、シートベルトを外した。[p]

#エリオット
保冷剤、持っていっていいよ[p]

#リョーマ
もう平気[p]

#エリオット
念のため[p]

#
リョーマは少し迷ってから、タオルごと保冷剤を持ち直した。[p]

#エリオット
今日はよく頑張ったね[p]

[face_ira_cap]
#リョーマ
子ども扱いしないで[p]

#エリオット
じゃあ、言い直そうか[p]

#
ドアを開けようとしていたリョーマの手が止まる。[p]

#エリオット
いい試合だった。[r]
次も本気で相手をするよ[p]

[face_odorki_cap cheek="ryoma_hohosome" ]
#
リョーマはこちらを見た。[r]
泣いたあとの目が、まだわずかに赤い。[p]

[face_ira_cap cheek="ryoma_hohosome" ]
#リョーマ
次は勝つから[p]

#エリオット
楽しみにしてる[p]

#
リョーマは車を降りる。[r]
ドアを閉めかけてから、一度だけ振り返る。[p]
[chara_part  name="Ryoma" mouse="ryoma_mouse_okuchi"]
#リョーマ
……約束、忘れないでよ[p]

#エリオット
忘れないよ[p]

[chara_hide  name="Ryoma"  time="600" ]
#
それを聞くと、リョーマは今度こそドアを閉めて、玄関へ走っていった。[p]
#
負けた悔しさも、零れた涙も、誰にも知られたくない弱さも。[r]
今日、リョーマはそのすべてを俺に預けた。[p]
#
車を発進させても、その小さな秘密の重みは、胸の奥に残っていた。[p]

[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[stopse  time="1000"  buf="0"  fadeout="true"  ]
[jump  storage="part1_day5.ks"  target=""  cond=""  ]
