[_tb_system_call storage=system/_date_jump.ks]

; ============================================================
; 1. デバッグパラメータ適用用共通マクロ（画面最上部に定義）
; ============================================================
[macro name="apply_debug_params"]
; 1. 画面要素をクリア
[clear_date_jump]
[showmenubutton]
[tb_keyconfig flag="1"]

; 2. 全変数の初期化（new_game_init.ks）を実行
[call storage="new_game_init.ks" target="*new_game"]

; 3. リアルタイム保存しておいた tf 変数から f 変数へ一括反映！
[iscript]
f.love = tf.temp_love;
f.trust = tf.temp_trust;
f.minus_count = tf.temp_minus_count;
f.trust_taboo_flag = tf.temp_trust_taboo;
f.love_taboo_flag = tf.temp_love_taboo;
[endscript]
[endmacro]

[macro name="clear_date_jump"]
[free layer="0" name="date_jump_bg_panel"]
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
; 2. DOM移動した座布団(#debug_panel_box)とチェックボックス等のHTML要素をJSで強制削除！
[iscript]
$('#debug_panel_box').remove();
[endscript]
[endmacro]
[cm]
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]

; --- 画面タイトル ---
[ptext layer="1" page="fore" name="date_jump_title" text="PART 1 日付＆パラメータ設定ジャンプ" x="0" y="25" width="960" align="center" size="28" color="0xffffff" bold="true"]

; --- 1. 座布団（背景ボックス）を layer="0"（背面レイヤー）に配置 ---
[html]
<div id="debug_panel_box" style="
  position: absolute;
  top: 70px;
  left: 30px;
  width: 900px;
  height: 115px;
  background-color: rgba(31, 35, 45, 0.85);
  border: 1.5px solid #D4C291;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
  pointer-events: none;
"></div>

<div style="position:absolute; top:125px; left:60px; color:#ffffff; font-size:16px; z-index:9999;">
  <label style="cursor:pointer;"><input type="checkbox" id="trust_taboo_check" value="1"> 信頼度禁忌 (f.trust_taboo_flag)</label>
</div>
<div style="position:absolute; top:125px; left:410px; color:#ffffff; font-size:16px; z-index:9999;">
  <label style="cursor:pointer;"><input type="checkbox" id="love_taboo_check" value="1"> 好感度禁忌 (f.love_taboo_flag)</label>
</div>
[endhtml]

; --- 3. 手動パラメータ入力フォーム＆テキストを layer="1"（前面レイヤー）に配置 ---
[ptext layer="1" name="tf_love_input_label" page="fore" text="好感度(love):" x="60" y="85" size="18" color="0xffffff"]
[edit name="tf_love_input" initial="0" left="170" top="80" width="60" height="28" size="18" color="0x000000" maxchars="3"]

[ptext layer="1" name="tf_trust_input_label" page="fore" text="信頼度(trust):" x="320" y="85" size="18" color="0xffffff"]
[edit name="tf_trust_input" initial="0" left="370" top="80" width="60" height="28" size="18" color="0x000000" maxchars="3"]

[ptext layer="1" name="tf_minus_input_label" page="fore" text="拒絶数(minus):" x="570" y="85" size="18" color="0xffffff"]
[edit name="tf_minus_input" initial="0" left="570" top="80" width="50" height="28" size="18" color="0x000000" maxchars="2"]

; --- 3. JavaScript で座布団の DOM を ptext/edit と同じコンテナの最背面へ移動 ---
[iscript]
setTimeout(function(){
    // 1. ptext等が存在するレイヤー1の前景コンテナ（.1_fore または .layer_fore）を取得
    var $targetLayer = $('.layer_fore').first();
    
    // 2. 座布団ボックス(#debug_panel_box)をターゲットコンテナの最頭部(prepend)へ物理移動！
    $('#debug_panel_box').prependTo($targetLayer);

    // 3. フォーム枠や文字を手前として描画保証
    $('input[name^="tf_"]').css({'position': 'relative', 'z-index': '10'});
}, 50);
[endscript]



; --- 4. リアルタイム値バインド ＆ DOM z-index 制御 ---
[iscript]
// 数値入力モードに変更
$('input[type="text"]').attr({
    type: "number",
    step: "1",
    inputmode: "numeric"
});

// デフォルト初期値の設定
tf.temp_love = 0;
tf.temp_trust = 0;
tf.temp_minus_count = 0;
tf.temp_trust_taboo = false;
tf.temp_love_taboo = false;

// 1. テキスト入力欄のリアルタイムバインド (input イベント)
$(document).off("input.debug_sync").on("input.debug_sync", 'input[name="tf_love_input"]', function() {
    tf.temp_love = Number($(this).val()) || 0;
});
$(document).off("input.debug_sync_t").on("input.debug_sync_t", 'input[name="tf_trust_input"]', function() {
    tf.temp_trust = Number($(this).val()) || 0;
});
$(document).off("input.debug_sync_m").on("input.debug_sync_m", 'input[name="tf_minus_input"]', function() {
    tf.temp_minus_count = Number($(this).val()) || 0;
});

// 2. チェックボックスのリアルタイムバインド (change イベント)
$(document).off("change.debug_check_t").on("change.debug_check_t", '#trust_taboo_check', function() {
    tf.temp_trust_taboo = $(this).is(':checked');
});
$(document).off("change.debug_check_l").on("change.debug_check_l", '#love_taboo_check', function() {
    tf.temp_love_taboo = $(this).is(':checked');
});
[endscript]

; --- 5. DAY選択ボタン配置 ---
[ptext layer="1" page="fore" name="date_jump_day1" text="DAY 1" x="0" y="190" width="480" align="center" size="26" color="black"]
[clickable x="140" y="185" width="200" height="50" opacity="0" target="*jump_day1"]

[ptext layer="1" page="fore" name="date_jump_day2" text="DAY 2" x="0" y="250" width="480" align="center" size="26" color="black"]
[clickable x="140" y="245" width="200" height="50" opacity="0" target="*jump_day2"]

[ptext layer="1" page="fore" name="date_jump_day3" text="DAY 3" x="0" y="310" width="480" align="center" size="26" color="black"]
[clickable x="140" y="305" width="200" height="50" opacity="0" target="*jump_day3"]

[ptext layer="1" page="fore" name="date_jump_day4" text="DAY 4" x="0" y="370" width="480" align="center" size="26" color="black"]
[clickable x="140" y="365" width="200" height="50" opacity="0" target="*jump_day4"]

[ptext layer="1" page="fore" name="date_jump_day5" text="DAY 5" x="480" y="190" width="480" align="center" size="26" color="black"]
[clickable x="620" y="185" width="200" height="50" opacity="0" target="*jump_day5"]

[ptext layer="1" page="fore" name="date_jump_day6" text="DAY 6" x="480" y="250" width="480" align="center" size="26" color="black"]
[clickable x="620" y="245" width="200" height="50" opacity="0" target="*jump_day6"]

[ptext layer="1" page="fore" name="date_jump_day7" text="DAY 7" x="480" y="310" width="480" align="center" size="26" color="black"]
[clickable x="620" y="305" width="200" height="50" opacity="0" target="*jump_day7"]

[ptext layer="1" page="fore" name="date_jump_day8" text="DAY 8" x="480" y="370" width="480" align="center" size="26" color="black"]
[clickable x="620" y="365" width="200" height="50" opacity="0" target="*jump_day8"]

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
; 6. 各DAYジャンプ処理（共通マクロを呼ぶだけ）
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