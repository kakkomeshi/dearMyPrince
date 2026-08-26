[_tb_system_call storage=system/_ending_list.ks]

[bg  time="0"  method="crossfade"  storage="title.jpg"  ]
*start

[cm  ]

; =========================
; ENDING LIST
; =========================


[tb_ptext_show  x="360"  y="70"  size="32"  color="0x000000"  time="0"  text="ENDING&nbsp;LIST"  anim="false"  face="sans-serif,'メイリオ'"  edge="0xffffff"  shadow="undefined"  ]

; =========================
; ED 01
; =========================


[if exp="sf.ed01 == true"]


; [tb_ptext_show  name="ed01"  text="01　コーチ継続　　CLEAR"  x="250"  y="180"  size="24"  ]


[tb_ptext_show  text="01　コーチ継続　　CLEAR"  x="250"  y="180"  size="24"  color="0xffffff"  time="0"  ]
[else]


; [tb_ptext_show  name="ed01"  text="01　？？？？？？　　未解放"  x="250"  y="180"  size="24"  ]


[tb_ptext_show  text="01　？？？？？？　　未解放"  x="250"  y="180"  size="24"  color="0xffffff"  time="0"  ]
[endif]


; =========================
; ED 02
; =========================


[if exp="sf.ed02 == true"]


; [tb_ptext_show  name="ed02"  text="02　契約終了　　　CLEAR"  x="250"  y="230"  size="24"  ]


[tb_ptext_show  text="02　契約終了　　　CLEAR"  x="250"  y="230"  size="24"  color="0xffffff"  time="0"  ]
[else]


; [tb_ptext_show  name="ed02"  text="02　？？？？？？　　未解放"  x="250"  y="230"  size="24"  ]


[tb_ptext_show  text="02　？？？？？？　　未解放"  x="250"  y="230"  size="24"  color="0xffffff"  time="0"  ]
[endif]


; =========================
; ED 03
; =========================


[if exp="sf.ed03 == true"]


; [tb_ptext_show  name="ed03"  text="03　嫌悪　　　　　CLEAR"  x="250"  y="280"  size="24"  ]


[tb_ptext_show  text="03　嫌悪　　　　　CLEAR"  x="250"  y="280"  size="24"  color="0xffffff"  time="0"  ]
[else]


; [tb_ptext_show  name="ed03"  text="03　？？？？？？　　未解放"  x="250"  y="280"  size="24"  ]


[tb_ptext_show  text="03　？？？？？？　　未解放"  x="250"  y="280"  size="24"  color="0xffffff"  time="0"  ]
[endif]


; =========================
; BACK
; =========================


[glink  text="BACK"  x="430"  y="520"  width="100"  height="40"  target="*back"  ]
[s  ]
*back

[cm  ]
[tb_ptext_hide  time="0" ]
[jump  storage="title_screen.ks"  target="*title"  ]
[s  ]
