[_tb_system_call storage=system/_date_jump.ks]


; ============================================================
; PART 1 日付ジャンプ（デバッグ用）
; 選択した日付へ、好感度を0に戻してジャンプします。
; ============================================================


[macro name="clear_date_jump"]

[free layer="1" name="date_jump_title"]

[free layer="1" name="date_jump_note"]

[free layer="1" name="date_jump_day1"]

[free layer="1" name="date_jump_day2"]

[free layer="1" name="date_jump_day3"]

[free layer="1" name="date_jump_day4"]

[free layer="1" name="date_jump_day5"]

[free layer="1" name="date_jump_final"]

[endmacro]

[cm  ]

; [layopt layer="message0" visible="false"

[layopt layer="1" visible="true"]

[iscript]
$(document).off("input.loveDebug", 'input[name="f.love_point"]').on("input.loveDebug", 'input[name="f.love_point"]', function () {
    var value = Number(this.value) || 0;
    TYRANO.kag.evalScript("f.love_point = " + value);
});
[endscript]

[ptext layer="1" page="fore" name="date_jump_title" text="PART 1  日付ジャンプ" x="0" y="105" width="960" align="center" size="36" color="0xffffff" bold="true"]

[edit name="f.love_point" initial="0" left="800" top="115" width="80" height="30" size="20" color="0x000000" maxchars="3"]
[iscript]
$('input[name="f.love_point"]').attr({
    type: "number",
    step: "1",
    inputmode: "numeric"
});
[endscript]


[ptext layer="1" page="fore" name="date_jump_day1" text="DAY 1" x="0" y="190" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="190"  width="200"  height="50"  opacity="0"  target="*jump_day1"  storage=""  ]

[ptext layer="1" page="fore" name="date_jump_day2" text="DAY 2" x="0" y="240" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="240"  width="200"  height="50"  opacity="0"  target="*jump_day2"  storage=""  ]

[ptext layer="1" page="fore" name="date_jump_day3" text="DAY 3" x="0" y="290" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="290"  width="200"  height="50"  opacity="0"  target="*jump_day3"  storage=""  ]

[ptext layer="1" page="fore" name="date_jump_day4" text="DAY 4" x="0" y="340" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="340"  width="200"  height="50"  opacity="0"  target="*jump_day4"  storage=""  ]

[ptext layer="1" page="fore" name="date_jump_day5" text="DAY 5" x="0" y="390" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="390"  width="200"  height="50"  opacity="0"  target="*jump_day5"  storage=""  ]

[ptext layer="1" page="fore" name="date_jump_final" text="PART 1 FINAL" x="0" y="440" width="960" align="center" size="26" color="0xffffff"]
[clickable  x="380"  y="440"  width="200"  height="50"  opacity="0"  target="*jump_final"  storage=""  ]

; =========================
; BACK
; =========================


[glink  text="BACK"  x="370"  y="520"  width="100"  height="30"  target="*back"  autopos="false"  ]
[s  ]
*back

[cm  ]
[clear_date_jump]

[jump  storage="title_screen.ks"  target="*title"  ]
[s  ]

*jump_day1
[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]


[jump  storage="part1_day1.ks"  target=""  ]
*jump_day2

[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]

[jump  storage="part1_day2.ks"  target=""  ]
*jump_day3

[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]

[jump  storage="part1_day3.ks"  target=""  ]
*jump_day4

[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]

[jump  storage="part1_day4.ks"  target=""  ]
*jump_day5

[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]
[jump  storage="part1_day5.ks"  target=""  ]
*jump_final

[clear_date_jump]
[showmenubutton]
[tb_keyconfig  flag="1"  ]
[jump  storage="part1_final.ks"  target=""  ]
