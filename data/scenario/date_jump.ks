[_tb_system_call storage=system/_date_jump.ks]

; ============================================================
; デバッグパラメータ適用用マクロ（全DAY共通）
; ============================================================
[macro name="apply_debug_params"]
; 1. 画面要素を消去
[clear_date_jump]
[showmenubutton]
[tb_keyconfig flag="1"]

; 2. 変数の全ゼロ初期化を実行
[call storage="new_game_init.ks" target="*new_game"]

; 3. リアルタイム保存しておいた tf 変数から f 変数へ一括反映！
[iscript]
f.love = tf.temp_love;
f.trust = tf.temp_trust;
f.minus_count = tf.temp_minus_count;
f.trust_taboo_flag = tf.temp_trust_taboo;
f.love_taboo_flag = tf.temp_love_taboo;
[endscript]
[debug_init]
[endmacro]

[macro name="clear_date_jump"]
[free layer="1" name="date_jump_title"]
[free layer="1" name="date_jump_day1"]
[free layer="1" name="date_jump_day2"]
[free layer="1" name="date_jump_day3"]
[free layer="1" name="date_jump_day4"]
[free layer="1" name="date_jump_day5"]
[free layer="1" name="date_jump_day6"]
[free layer="1" name="date_jump_day7"]
[free layer="1" name="date_jump_day8"]
[free layer="1" name="date_jump_final"]
[free layer="1" name="tf_love_input_label"]
[free layer="1" name="tf_trust_input_label"]
[free layer="1" name="tf_minus_input_label"]
[endmacro]

[cm]
[layopt layer="1" visible="true"]

; --- 画面タイトル ---
[ptext layer="1" page="fore" name="date_jump_title" text="PART 1 日付＆パラメータ設定ジャンプ" x="0" y="30" width="960" align="center" size="28" color="0xffffff" bold="true"]

; --- 手動パラメータ入力フォームの配置 ---
[ptext layer="1" name="tf_love_input_label" page="fore" text="好感度(love):" x="50" y="85" size="18" color="0xffffff"]
[edit name="tf_love_input" initial="0" left="170" top="80" width="60" height="28" size="18" color="0x000000" maxchars="3"]

[ptext layer="1" name="tf_trust_input_label" page="fore" text="信頼度(trust):" x="250" y="85" size="18" color="0xffffff"]
[edit name="tf_trust_input" initial="0" left="370" top="80" width="60" height="28" size="18" color="0x000000" maxchars="3"]

[ptext layer="1" name="tf_minus_input_label" page="fore" text="拒絶数(minus):" x="450" y="85" size="18" color="0xffffff"]
[edit name="tf_minus_input" initial="0" left="570" top="80" width="50" height="28" size="18" color="0x000000" maxchars="2"]

; チェックボックス
[html]
<div style="position:absolute; top:122px; left:50px; color:#ffffff; font-size:16px; z-index:9999;">
  <label><input type="checkbox" id="trust_taboo_check" value="1"> 信頼度禁忌 (f.trust_taboo_flag)</label>
</div>
<div style="position:absolute; top:122px; left:400px; color:#ffffff; font-size:16px; z-index:9999;">
  <label><input type="checkbox" id="love_taboo_check" value="1"> 好感度禁忌 (f.love_taboo_flag)</label>
</div>
[endhtml]

[iscript]
// 数値入力モードに変更
$('input[type="text"]').attr({
    type: "number",
    step: "1",
    inputmode: "numeric"
});

// 初期値のセット
tf.temp_love = 0;
tf.temp_trust = 0;
tf.temp_minus_count = 0;
tf.temp_trust_taboo = false;
tf.temp_love_taboo = false;

// 1. テキスト入力欄のリアルタイム取得
$(document).off("input.debug_sync").on("input.debug_sync", 'input[name="tf_love_input"]', function() {
    tf.temp_love = Number($(this).val()) || 0;
});
$(document).off("input.debug_sync_t").on("input.debug_sync_t", 'input[name="tf_trust_input"]', function() {
    tf.temp_trust = Number($(this).val()) || 0;
});
$(document).off("input.debug_sync_m").on("input.debug_sync_m", 'input[name="tf_minus_input"]', function() {
    tf.temp_minus_count = Number($(this).val()) || 0;
});
// 2. チェックボックスのリアルタイム取得（ここを追加・修正！）
$(document).off("change.debug_check_t").on("change.debug_check_t", '#trust_taboo_check', function() {
    tf.temp_trust_taboo = $(this).is(':checked');
});
$(document).off("change.debug_check_l").on("change.debug_check_l", '#love_taboo_check', function() {
    tf.temp_love_taboo = $(this).is(':checked');
});
[endscript]

; --- 各DAYボタン配置 ---
[ptext layer="1" page="fore" name="date_jump_day1" text="DAY 1" x="0" y="190" width="480" align="center" size="26" color="black"]
[clickable x="140" y="185" width="200" height="50" opacity="0" target="*jump_day1"]

[ptext layer="1" page="fore" name="date_jump_day2" text="DAY 2" x="0" y="250" width="480" align="center" size="26" color="black"]
[clickable x="140" y="245" width="200" height="50" opacity="0" target="*jump_day2"]

[ptext layer="1" page="fore" name="date_jump_day3" text="DAY 3" x="0" y="310" width="480" align="center" size="26" color="black"]
[clickable  x="140"  y="305"  width="200"  height="50"  opacity="0"  target="*jump_day3"  ]

[ptext layer="1" page="fore" name="date_jump_day4" text="DAY 4" x="0" y="370" width="480" align="center" size="26" color="black"]
[clickable  x="140"  y="365"  width="200"  height="50"  opacity="0"  target="*jump_day4"  ]

[ptext layer="1" page="fore" name="date_jump_day5" text="DAY 5" x="480" y="190" width="480" align="center" size="26" color="black"]
[clickable  x="620"  y="185"  width="200"  height="50"  opacity="0"  target="*jump_day5"  ]

[ptext layer="1" page="fore" name="date_jump_day6" text="DAY 6" x="480" y="250" width="480" align="center" size="26" color="black"]
[clickable  x="620"  y="245"  width="200"  height="50"  opacity="0"  target="*jump_day6"  ]

[ptext layer="1" page="fore" name="date_jump_day7" text="DAY 7" x="480" y="310" width="480" align="center" size="26" color="black"]
[clickable  x="620"  y="305"  width="200"  height="50"  opacity="0"  target="*jump_day7"  ]

[ptext layer="1" page="fore" name="date_jump_day8" text="DAY 8" x="480" y="370" width="480" align="center" size="26" color="black"]
[clickable  x="620"  y="365"  width="200"  height="50"  opacity="0"  target="*jump_day8"  ]

[ptext layer="1" page="fore" name="date_jump_final" text="PART 1 FINAL" x="0" y="430" width="960" align="center" size="26" color="black"]
[clickable x="380" y="425" width="200" height="50" opacity="0" target="*jump_final"]

[glink text="BACK" x="370" y="520" width="100" height="30" target="*back" autopos="false"]
[s]

*back
[cm]
[clear_date_jump]
[jump storage="title_screen.ks" target="*title"]
[s]

; ============================================================
; 2. 各DAYジャンプ処理
; ============================================================

*jump_day1
[apply_debug_params] 
[jump storage="part1_day1.ks" target=""]

*jump_day2
[apply_debug_params]
[jump storage="part1_day2.ks" target=""]

*jump_day3
[apply_debug_params] 
[jump storage="part1_day3.ks" target=""]

*jump_day4
[apply_debug_params]
[jump storage="part1_day4.ks" target=""]

*jump_day5
[apply_debug_params] 
[jump storage="part1_day5.ks" target=""]

*jump_day6
[apply_debug_params]
[jump storage="part1_day6.ks" target=""]

*jump_day7
[apply_debug_params] 
[jump storage="part1_day7.ks" target=""]

*jump_day8
[apply_debug_params]
[jump storage="part1_day8.ks" target=""]

*jump_final
[apply_debug_params]
[jump storage="part1_final.ks" target="*top"]