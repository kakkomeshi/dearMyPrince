[_tb_system_call storage=system/_ending_list.ks]

[bg  time="0"  method="crossfade"  storage="title.jpg"  ]
*start

[cm  ]

; =========================
; ENDING LIST
; =========================


[tb_ptext_show  x="360"  y="70"  size="32"  color="0x000000"  time="0"  text="ENDING&nbsp;LIST"  anim="false"  face="sans-serif,'メイリオ'"  edge="0xffffff"  shadow="undefined"  ]
[clickable  storage="ending_list.ks"  x="279"  y="190"  width="100"  height="100"  target=""  _clickable_img=""  ]

; =========================
; ED 01
; =========================


[if exp="sf.ed01_low == true"]

[tb_ptext_show  text="01　NORMAL&nbsp;END&nbsp;〜契約終了〜　　　CLEAR"  x="250"  y="180"  size="24"  color="0x000000"  time="0"  ]
[else]

[tb_ptext_show  text="01　？？？？？？　　未解放"  x="250"  y="180"  size="24"  color="0xc9c9c9"  time="0"  ]
[endif]


; =========================
; ED 02
; =========================


[if exp="sf.ed02_goodbye == true"]

[tb_ptext_show  text="02　NORMAL&nbsp;END&nbsp;〜またね、コーチ〜　　　CLEAR"  x="250"  y="230"  size="24"  color="0x000000"  time="0"  ]
[else]

[tb_ptext_show  text="02　？？？？？？　　未解放"  x="250"  y="230"  size="24"  color="0xc9c9c9"  time="0"  ]
[endif]


; =========================
; BACK
; =========================


[glink  text="BACK"  x="370"  y="520"  width="100"  height="30"  target="*back"  autopos="false"  ]
[s  ]
*back

[cm  ]
[tb_ptext_hide  time="0"  ]
[jump  storage="title_screen.ks"  target="*title"  ]
[s  ]
