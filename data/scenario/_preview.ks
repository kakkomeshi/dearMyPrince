[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[mask_off time=10]
[tb_start_tyrano_code]
[loadcss file="./data/others/css/custom.css"]
[_tb_end_tyrano_code]


;==============================
; タイトル画面
;==============================
; 好感度表示を非表示にする


[debug_hide]

[hidemenubutton]

[tb_clear_images]

[tb_keyconfig  flag="0"  ]

;標準のメッセージレイヤを非表示


[tb_hide_message_window  ]

;タイトル表示


[bg  storage="title.jpg"  ]
*title


;タイトル各種ボタン


[glink  color="black"  text="はじめから"  x="600"  y="370"  size="24"  target="*start"  autopos="true"  ]
[glink  color="black"  text="つづきから"  x="600"  y="470"  size="24"  target="*load"  autopos="true"  ]
[glink  color="black"  text="エンディングリスト"  x="600"  y="570"  size="24"  target=""  storage="ending_list.ks"  autopos="true"  ]
[glink  color="black"  text="日付ジャンプ（デバッグモード）"  x="600"  y="570"  size="24"  target=""  storage="date_jump.ks"  autopos="true"  ]
[s  ]

;-------ボタンが押されたときの処理


*start

[showmenubutton]

[cm  ]

;NEW GAME用の初期化処理


[call  storage="new_game_init.ks"  target=""  ]
[tb_keyconfig  flag="1"  ]
[jump  storage="scene1.ks"  target=""  ]
[s  ]

;--------ロードが押された時の処理


*load

[cm  ]
[showload]

[jump  target="*title"  storage=""  ]
[s  ]
