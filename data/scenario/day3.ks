[_tb_system_call storage=system/_day3.ks]

*base0

[bg  time="0"  method="crossfade"  storage="school.png"  ]
[mask_off  time="1000"  effect="fadeOut"  ]
[tb_show_message_window  ]
[tb_start_text mode=4 ]
#
――三日目。[p]
いつもの場所に車を停めて待っていると、校門から白い帽子が見えた。[r]
リョーマもすぐにこちらを見つける。[p]
#リョーマ
コーチ[p]
#エリオット
おかえり[p]
#リョーマ
……ただいま[p]

#
勉強道具の詰まったバックパックを後部座席へ放り込み、助手席へ乗り込む。[r]
最初の日にはなかったやり取りだ。[p]

車を出してしばらくすると、リョーマが窓の外を見ながら口を開いた。[p]
#リョーマ
親父、スペイン着いたって[p]
#エリオット
連絡あった？[p]
#リョーマ
一昨日[p]
#エリオット
何しに行ってるんだっけ[p]
#リョーマ
知らない[p]
#エリオット
知らない？[p]
#リョーマ
聞いても教えてくれない[p]



#
明らかに不満そうな声だった。[p]
#リョーマ
「お前は知らなくていい」とか[r]
「ガキが気にすんな」とか[r]
いっつもそれ[p]
#エリオット
なるほど[p]
#リョーマ
すぐ俺を子ども扱いする[p]
#
窓に映る顔が、少しむっとしている。[r]
南次郎さんに子供扱いされるのを嫌がっていたことを思い出した。[p]

[_tb_end_text]

[glink  color="black"  storage="day3.ks"  size="20"  text="それは腹が立つな"  target="*choice1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="九歳なら仕方ないよ"  target="*choice2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="帰ってきたらもう一度聞いてみたら？"  target="*choice3"  width="max"  autopos="true"  ]
[s  ]
*choice1

[tb_start_text mode=4 ]
#エリオット
それは腹が立つな[p]
#リョーマ
……でしょ？[p]
#リョーマ
絶対テニスのことなのに[p]
#エリオット
そうなの？[p]
#リョーマ
親父がわざわざスペインまで行くんだよ？[r]
テニス以外にないじゃん[p]
#エリオット
まあ、それはそうか[p]
#リョーマ
なのに聞いても教えてくれない[r]
俺だってテニスやってるのに[p]
#
最後の一言だけ、少し不満そうに響いた。[p]
#エリオット
そりゃ、気になるよな[p]
#リョーマ
……うん[p]
#
短く答えて、リョーマはまた窓の外を向いた。[r]
けれど、さっきより少しだけ機嫌が直ったように見えた。[p]

【好感度 ＋2】[p]
[_tb_end_text]

[love value="2"]

[jump  storage="day3.ks"  target="*base"  ]
*choice2

[tb_start_text mode=4 ]
#エリオット
まあ、九歳なら仕方ないんじゃない？[p]
#リョーマ
……[p]


まずい。[p]
言い終わってから気づいた。[p]
#リョーマ
コーチも親父と同じじゃん[p]
#エリオット
いや、そういう意味じゃ[p]
#リョーマ
もういい[p]

窓の外を向いてしまった。[p]

【好感度 －2】[p]
[_tb_end_text]

[love value="-2"]

[jump  storage="day3.ks"  target="*base"  ]
*choice3

[tb_start_text mode=4 ]
#エリオット
帰ってきたら、もう一度聞いてみたら？[p]
#リョーマ
聞くけど[p]
#エリオット
今度は教えてくれるかも[p]
#リョーマ
どうだろ[p]

#
納得はしていないようだ。[p]
それでも、少し考えるように窓の外を見る。[p]

【好感度 ±0】[p]
[_tb_end_text]

[love value="0"]

[jump  storage="day3.ks"  target="*base"  ]
*base

[bg  time="1000"  method="crossfade"  storage="tennis_school_day.png"  ]
[tb_start_text mode=4 ]
#
――テニスクラブ。[p]

#
今日のメニューを一通り終えて、最後にラリーを続ける。[p]

#
リョーマは相変わらず、何球打ってもボールを追うのをやめない。[p]

#
左右に振っても、短く落としても。[r]
届かなければ、次は届こうとする。[p]
#エリオット
リョーマって、昔からそんな感じ？[p]
#リョーマ
なにが？[p]
#エリオット
どんなボールでも追いかけるところ[p]
#リョーマ
……そうかも[p]

#
ボールを拾いながら、リョーマが少し考える。[p]
#リョーマ
俺、前はもっとへたっぴだったから[p]
#エリオット
前って？[p]
#リョーマ
兄ちゃんがいたとき[p]
#エリオット
お兄さんがいるんだ[p]
#リョーマ
うん[p]

#
リョーマはボールを軽く弾ませる。[p]
#リョーマ
兄ちゃんとずっとテニスしてた[p]

#
ぽん、ぽん、とボールが地面を跳ねる。[p]
#リョーマ
俺、全然勝てなかったし[r]
兄ちゃんが打ったボール取れないこともいっぱいあったけど[p]

#
そう話す顔は、不思議なくらい楽しそうだった。[p]
#リョーマ
でも、追いかけるの楽しかった[p]

#
ボールを拾って、また追いかけて。[r]
届かなかったら、今度こそ届くように走って。[p]

#
きっと、それを何度も何度も繰り返したんだろう。[p]
#エリオット
お兄さんは強かった？[p]
#リョーマ
うん[r]
すっごく強い[p]

#
迷いのない即答だった。[p]
#リョーマ
でもさ[p]
#エリオット
？[p]
#リョーマ
兄ちゃん、俺とはシンケンショーブしてくれなかったんだよね[p]
#エリオット
そうなの？[p]
#リョーマ
いっつも途中でやめちゃうの[p]

#
少しだけ不満そうに唇を尖らせる。[p]
#リョーマ
俺がもっと強かったら、ちゃんとやってくれたのかな[p]
#エリオット
……[p]

#
リョーマは手の中のボールを見る。[p]

#
それから、何でもないことのように言った。[p]
#リョーマ
だから、もっと強くなる[p]
#エリオット
お兄さんに勝つために？[p]
#リョーマ
それもあるけど[p]

#
顔を上げる。[p]

#
さっきまで昔話をしていた子供の目が、まっすぐ俺を見る。[p]
#リョーマ
強くなって、ずっと勝ってれば[r]
いつかまた兄ちゃんに会えると思う[p]
#エリオット
……[p]
#リョーマ
そしたら今度こそ、ちゃんと試合する[p]
#エリオット
どこで？[p]
#リョーマ
世界の頂点[p]

#
あまりにも当然のように言うものだから、一瞬言葉が出なかった。[p]

#
九歳の子供が口にするには、途方もない場所だ。[p]

#
けれど。[p]

#
この子が言うと、ただの夢物語には聞こえなかった。[p]

[_tb_end_text]

[glink  color="black"  storage="day3.ks"  size="20"  text="きっと会えるよ"  target="*choice2_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="世界の頂点か"  target="*choice2_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="お兄さんも待ってるかもな"  target="*choice2_3"  width="max"  autopos="true"  ]
[s  ]
*choice2_1

[tb_start_text mode=4 ]
#エリオット
きっと会えるよ[p]
#リョーマ
……[p]
#エリオット
そこまで行けば、お兄さんだって君を無視できないだろ[p]
#リョーマ
でしょ？[p]

#
嬉しそうに笑って、リョーマはラケットを構える。[p]
#リョーマ
だから、もっと強い球打ってよ[p]
#エリオット
はいはい[p]
#リョーマ
はいは一回！[p]
#エリオット
……誰に教わったんだ、それ[p]
#リョーマ
へへっ 親父が母さんにいつも言われてるんだ[p]

#
【好感度 ＋2】[p]
[_tb_end_text]

[love value="2"]

[jump  storage="day3.ks"  target="*base2"  ]
*choice2_2

[tb_start_text mode=4 ]
#エリオット
世界の頂点、かぁ……[p]
#リョーマ
なに[r]
無理だと思ってる？[p]
#エリオット
いや[p]

#
ラケットを構える。[p]
#エリオット
そこまで行くつもりなら、今のままじゃ全然足りないな[p]
#リョーマ
……[p]

#
一瞬むっとしたあと。[p]

#
にやりと笑った。[p]
#リョーマ
望むところ[p]

#
【好感度 ＋2】[p]
[_tb_end_text]

[love value="2"]

[jump  storage="day3.ks"  target="*base2"  ]
*choice2_3

[tb_start_text mode=4 ]
#エリオット
お兄さんも、どこかで待ってるかもな[p]
#リョーマ
……どうかな[p]

#
少しだけ視線が落ちる。[p]
#リョーマ
兄ちゃん、どこにいるかも知らないし[p]
#エリオット
……[p]
#リョーマ
だから俺が行くんだよ[p]

#
もう一度顔を上げる。[p]
#リョーマ
どこにいても分かるくらい、強くなればいいでしょ[p]

#
――なるほど。[p]

#
待っているつもりなんて、最初からないらしい。[p]

#
【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]

[jump  storage="day3.ks"  target="*base2"  ]
*base2

[bg  time="1000"  method="crossfade"  storage="_car_twilight.png"  ]
[tb_start_text mode=4 ]
#
――帰り道。[p]
今日は珍しく、リョーマのほうから話すことが多かった。[r]
南次郎さんのこと。[r]
そして、今はここにいない兄のこと。[p]
助手席を見る。[p]
リョーマは窓の外を眺めている。[p]
#リョーマ
コーチ[p]
#エリオット
ん？[p]
#リョーマ
大人ってさ[p]

#
少し間が空く。[p]
#リョーマ
子供には、なんでも教えなくていいって思ってるの？[p]
#エリオット
……[p]

朝の話を、まだ考えていたらしい。[p]

[_tb_end_text]

[glink  color="black"  storage="day3.ks"  size="20"  text="俺はそうは思わない"  target="*choice3_1"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  autopos="true"  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="内容によるかな"  target="*choice3_2"  autopos="true"  x="0"  y="0"  width="max"  height=""  _clickable_img=""  ]
[glink  color="black"  storage="day3.ks"  size="20"  text="大人にも事情があるんだよ"  target="*choice3_3"  width="max"  autopos="true"  ]
[s  ]
*choice3_1


#エリオット
俺はそうは思わない[p]
#リョーマ
ほんと？[p]
#エリオット
少なくとも、君に関係することならね[p]
#
リョーマがこちらを見る。[p]
#エリオット
話せないことがあるなら、話せない理由くらいは説明するべきだと思う[p]
#リョーマ
……[p]
#エリオット
子供だから分からないって決めつけるのは、好きじゃない[p]
#
しばらく返事はなかった。[p]
#リョーマ
……そっか[p]
#
それだけ言って、また窓の外を見る。[p]


[r]


けれど、その横顔は少しだけ満足そうだった。[p]
【好感度 ＋2】[p]


[tb_start_text mode=undefined ]
[_tb_end_text]

[love value="2"]

[jump  storage="day3.ks"  target="*base3"  ]
*choice3_2

[tb_start_text mode=4 ]
#エリオット
内容によるかな[p]
#リョーマ
内容？[p]
#エリオット
子供を守るために、まだ話さないほうがいいことだってある[p]
#リョーマ
……[p]
#エリオット
でも、何も説明しなくていいとは思わないよ[p]
#リョーマ
ふーん[p]

#
完全には納得していないようだ。[p]
それでも、否定はしなかった。[p]

【好感度 ＋1】[p]
[_tb_end_text]

[love value="1"]

[jump  storage="day3.ks"  target="*base3"  ]
*choice3_3

[tb_start_text mode=4 ]
#エリオット
大人にも事情があるんだよ[p]
#リョーマ
……[p]
#エリオット
そのうち分かる[p]
#リョーマ
……それ[p]
#エリオット
ん？[p]
#リョーマ
親父も言う[p]

#
またやってしまった。[p]

【好感度 －2】[p]
[_tb_end_text]

[love value="-2"]

[jump  storage="day3.ks"  target="*base3"  ]
*base3

[bg  time="1000"  method="crossfade"  storage="home_night.png"  ]
[tb_start_text mode=4 ]
#
車が越前家の前に着く。[p]
#リョーマ
じゃあ、またね[p]
#エリオット
ああ。また次のレッスンで[p]

ドアを閉めて、リョーマが家へ向かっていく。[r]
玄関を開けて中に入るまでを見届ける。[p]

九歳。[r]
本人がどれだけ嫌がったところで、まだ子供なのは間違いない。[p]

#
兄の話をするときだけ、普段の生意気なくらい大人びた口調より、ずっと幼く聞こえた。[r]
父親も兄もそばにいない今、寂しさを抱えていても不思議じゃない。[p]
もしかしたら、あの強がりの奥には、俺がまだ知らないものがあるのかもしれない。[p]

強気で負けず嫌いなだけじゃない。[r]
あの子のことを、もう少し知りたいと思った。[p]

[_tb_end_text]

[mask  time="1000"  effect="fadeIn"  color="0x000000"  ]
[s  ]
[jump  storage=""  target=""  ]
