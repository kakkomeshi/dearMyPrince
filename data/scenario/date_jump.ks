[_tb_system_call storage=system/_date_jump.ks]

; ============================================================
; 1. デバッグパラメータ適用用共通マクロ
; ============================================================
[macro name="apply_debug_params"]
; 1. HTMLコンテナの一括削除
[clear_date_jump]

; 2. 画面表示の完全リセット
[cm]

; 3. 変数とシステム状態の初期化（★真っ先に呼ぶ）
[call storage="new_game_init.ks" target="*new_game"]

; 4. リアルタイム保持しておいた tf 変数から f 変数へ一括反映
[iscript]
f.love = tf.temp_love;
f.trust = tf.temp_trust;
f.minus_count = tf.temp_minus_count;
f.trust_taboo_flag = tf.temp_trust_taboo;
f.love_taboo_flag = tf.temp_love_taboo;
[endscript]

; 5. メッセージウィンドウの再生成（本文・クリック判定復元）
[tb_show_message_window]

; 6. 【最重要】初期化が終わった後に、メニューボタン（SKIP/AUTO等）とキーコンフィグを表示・復元
[showmenubutton]
[tb_keyconfig flag="1"]
[start_keyconfig]
[debug_init]
[endmacro]

[macro name="clear_date_jump"]
[iscript]
// HTMLコンテナごと一括削除
$('#date_jump_wrapper').remove();
[endscript]
[endmacro]

[cm]

; ============================================================
; 2. 全UIを一括構築するHTML / CSS
; ============================================================
[html]
<div id="date_jump_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  background-color: rgba(15, 18, 25, 0.85);
  font-family: sans-serif;
  box-sizing: border-box;
  padding: 20px 30px;
  z-index: 9999;
  user-select: none;
">
  <!-- 画面タイトル -->
  <div style="text-align: center; color: #ffffff; font-size: 26px; font-weight: bold; margin-bottom: 15px; letter-spacing: 1px;">
    PART 1 日付＆パラメータ設定ジャンプ
  </div>

  <!-- 上部：手動パラメータ入力用 パネル（座布団） -->
  <div style="
    width: 900px;
    margin: 0 auto 20px auto;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 15px 20px;
    box-sizing: border-box;
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  ">
    <!-- 1行目：数値入力フォーム（3等分配置） -->
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; color: #ffffff; font-size: 16px;">
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_love_input">好感度(love):</label>
        <input type="number" id="tf_love_input" value="0" min="-999" max="999" style="width: 65px; height: 28px; font-size: 16px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_trust_input">信頼度(trust):</label>
        <input type="number" id="tf_trust_input" value="0" min="-999" max="999" style="width: 65px; height: 28px; font-size: 16px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_minus_input">拒絶数(minus):</label>
        <input type="number" id="tf_minus_input" value="0" min="0" max="99" style="width: 55px; height: 28px; font-size: 16px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
    </div>

    <!-- 2行目：チェックボックス（2等分配置） -->
    <div style="display: flex; justify-content: space-around; align-items: center; color: #ffffff; font-size: 15px; border-top: 1px solid rgba(212, 194, 145, 0.2); padding-top: 10px;">
      <label style="cursor: pointer; display: flex; align-items: center; gap: 6px;">
        <input type="checkbox" id="trust_taboo_check" style="cursor: pointer; transform: scale(1.2);"> 信頼度禁忌 (f.trust_taboo_flag)
      </label>
      <label style="cursor: pointer; display: flex; align-items: center; gap: 6px;">
        <input type="checkbox" id="love_taboo_check" style="cursor: pointer; transform: scale(1.2);"> 好感度禁忌 (f.love_taboo_flag)
      </label>
    </div>
  </div>

  <!-- 下部：DAY選択ボタン グリッドレイアウト -->
  <div style="
    width: 900px;
    margin: 0 auto;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px 30px;
  ">
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day1'});">DAY 1</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day5'});">DAY 5</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day2'});">DAY 2</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day6'});">DAY 6</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day3'});">DAY 3</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day7'});">DAY 7</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day4'});">DAY 4</button>
    <button class="debug_jump_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_day8'});">DAY 8</button>
  </div>

  <!-- PART 1 FINAL ボタン（中央大きめ） -->
  <div style="text-align: center; margin-top: 15px;">
    <button class="debug_jump_btn" style="width: 435px; background: linear-gradient(135deg, #2C3E50, #4CA1AF); border-color: #64B5F6;" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*jump_final'});">
      PART 1 FINAL
    </button>
  </div>

  <!-- 戻るボタン -->
  <div style="text-align: center; margin-top: 15px;">
    <button class="debug_back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*back'});">
      BACK
    </button>
  </div>
</div>

<style>
/* ボタン共通スタイリング */
.debug_jump_btn {
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid #D4C291;
  color: #ffffff;
  padding: 10px 0;
  font-size: 18px;
  font-weight: bold;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.2s ease;
  letter-spacing: 1px;
}
.debug_jump_btn:hover {
  background: rgba(212, 194, 145, 0.3);
  border-color: #ffffff;
  transform: translateY(-2px);
}
.debug_back_btn {
  background: rgba(0, 0, 0, 0.5);
  border: 1px solid #D4C291;
  color: #ffffff;
  padding: 8px 45px;
  font-size: 16px;
  font-weight: bold;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.2s ease;
  letter-spacing: 1px;
}
.debug_back_btn:hover {
  background: rgba(212, 194, 145, 0.3);
  border-color: #ffffff;
  transform: translateY(-2px);
}

</style>
[endhtml]

; ============================================================
; 3. リアルタイム値同期処理 (JavaScript)
; ============================================================
[iscript]
// 初期値の明示的設定
tf.temp_love = 0;
tf.temp_trust = 0;
tf.temp_minus_count = 0;
tf.temp_trust_taboo = false;
tf.temp_love_taboo = false;

// ★【重要】入力欄が直接入力できるようにキー入力＆フォーカスをティラノから解放する処理
setTimeout(function(){
    // 1. input 要素の z-index を引き上げ、キー入力をティラノに吸われないように無効化・開拓する
    $('#tf_love_input, #tf_trust_input, #tf_minus_input').css({
        'pointer-events': 'auto',
        'position': 'relative',
        'z-index': '9999999'
    }).off('keydown keypress keyup').on('keydown keypress keyup', function(e) {
        // キー入力をティラノスクリプト本体のキーコンフィグに伝破（伝播）させず、フォーム専用にする
        e.stopPropagation();
    });
}, 100);

// テキスト入力欄のリアルタイムバインド
$(document).off("input.debug_val").on("input.debug_val", '#tf_love_input', function() {
    tf.temp_love = Number($(this).val()) || 0;
});
$(document).off("input.debug_val_t").on("input.debug_val_t", '#tf_trust_input', function() {
    tf.temp_trust = Number($(this).val()) || 0;
});
$(document).off("input.debug_val_m").on("input.debug_val_m", '#tf_minus_input', function() {
    tf.temp_minus_count = Number($(this).val()) || 0;
});

// チェックボックスのリアルタイムバインド
$(document).off("change.debug_check_t").on("change.debug_check_t", '#trust_taboo_check', function() {
    tf.temp_trust_taboo = $(this).is(':checked');
});
$(document).off("change.debug_check_l").on("change.debug_check_l", '#love_taboo_check', function() {
    tf.temp_love_taboo = $(this).is(':checked');
});
[endscript]

[s]

*back
[cm]
[clear_date_jump]
[jump storage="title_screen.ks" target="*title"]
[s]

; ============================================================
; 4. 各DAYジャンプ処理（代入・初期化は共通マクロにおまかせ）
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