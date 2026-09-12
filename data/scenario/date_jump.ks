[_tb_system_call storage=system/_date_jump.ks]

; ============================================================
; 1. デバッグパラメータ適用用共通マクロ
; ============================================================
[macro name="apply_debug_params"]

; 1. HTMLコンテナの一括削除
[clear_date_jump]

; 2. 画面表示の完全リセット
[cm]

; 3. 変数とシステム状態の初期化
[call storage="new_game_init.ks" target="*new_game"]

; 4. リアルタイム保持しておいた tf 変数から f 変数へ一括反映
[iscript]
f.love = tf.temp_love;
f.trust = tf.temp_trust;
f.minus_count = tf.temp_minus_count;
f.trust_taboo_flag = tf.temp_trust_taboo;
f.love_taboo_flag = tf.temp_love_taboo;
[endscript]

; 5. メッセージウィンドウの再生成
[tb_show_message_window]

; 6. メニューボタンとキーコンフィグを表示・復元
[showmenubutton]
[showmenu]
[tb_keyconfig flag="1"]
[start_keyconfig]
[debug_init]

[endmacro]


[macro name="clear_date_jump"]

[iscript]
$('#date_jump_wrapper').remove();
[endscript]

[endmacro]


[cm]


; ============================================================
; 2. 全UIを一括構築するHTML / CSS（タブ切り替え対応版）
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
  padding: 15px 30px;
  z-index: 9999;
  user-select: none;
">

  <!-- 画面タイトル -->
  <div style="text-align: center; color: #ffffff; font-size: 24px; font-weight: bold; margin-bottom: 10px; letter-spacing: 1px;">
    日付＆パラメータ設定ジャンプ
  </div>


  <!-- 上部：手動パラメータ入力用 パネル -->
  <div style="
    width: 900px;
    margin: 0 auto 10px auto;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 10px 20px;
    box-sizing: border-box;
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  ">

    <!-- 数値入力 -->
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; color: #ffffff; font-size: 15px;">
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_love_input">好感度(love):</label>
        <input type="number" id="tf_love_input" value="0" min="-999" max="999" style="width: 65px; height: 26px; font-size: 15px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_trust_input">信頼度(trust):</label>
        <input type="number" id="tf_trust_input" value="0" min="-999" max="999" style="width: 65px; height: 26px; font-size: 15px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
      <div style="display: flex; align-items: center; gap: 8px; flex: 1; justify-content: center;">
        <label for="tf_minus_input">拒絶数(minus):</label>
        <input type="number" id="tf_minus_input" value="0" min="0" max="99" style="width: 55px; height: 26px; font-size: 15px; text-align: center; border-radius: 4px; border: 1px solid #ccc; outline: none;">
      </div>
    </div>

    <!-- 2行目：チェックボックス（2等分配置） -->
    <div style="display: flex; justify-content: space-around; align-items: center; color: #ffffff; font-size: 14px; border-top: 1px solid rgba(212, 194, 145, 0.2); padding-top: 8px;">
      <label style="cursor: pointer; display: flex; align-items: center; gap: 6px;">
        <input type="checkbox" id="trust_taboo_check" style="cursor: pointer; transform: scale(1.1);"> 信頼度禁忌 (f.trust_taboo_flag)
      </label>
      <label style="cursor: pointer; display: flex; align-items: center; gap: 6px;">
        <input type="checkbox" id="love_taboo_check" style="cursor: pointer; transform: scale(1.1);"> 好感度禁忌 (f.love_taboo_flag)
      </label>
    </div>
  </div>


  <!-- タブボタンエリア -->
  <div style="width: 900px; margin: 0 auto 10px auto; display: flex; gap: 10px;">
    <button class="debug_tab_btn active" onclick="switchPartTab(event, 'part1');">第一部</button>
    <button class="debug_tab_btn" onclick="switchPartTab(event, 'part2');">第二部</button>
    <button class="debug_tab_btn" onclick="switchPartTab(event, 'part3');">第三部</button>
  </div>


  <!-- タブコンテンツ領域 -->
  <div style="width: 900px; height: 320px; margin: 0 auto; box-sizing: border-box;">

    <!-- 第一部 コンテンツ -->
    <div id="tab_part1" class="tab_content" style="display: block;">
      <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px 30px; margin-bottom: 12px;">
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1');">DAY 1</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day5');">DAY 5</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2');">DAY 2</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day6');">DAY 6</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3');">DAY 3</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day7');">DAY 7</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day4');">DAY 4</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day8');">DAY 8</button>
      </div>

      <div style="text-align: center;">
        <button class="debug_jump_btn" style="width: 435px; background: linear-gradient(135deg, #2C3E50, #4CA1AF); border-color: #64B5F6;" onclick="debugJump(event, '*jump_final')">
          PART 1 FINAL
        </button>
      </div>
    </div>

    <!-- 第二部 コンテンツ -->
    <div id="tab_part2" class="tab_content" style="display: none; height: 100%; overflow-y: auto; padding-right: 5px;">
      
      <!-- 10月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_10m');">
          10月シナリオ <span class="acc_icon">▼</span>
        </button>
        <div id="acc_10m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_oct_1');">10月：プロローグ：秘密の通話</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_oct_day2');">10月：エリオットの見せる隙</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_oct_day3');">10月：ごほうび</button>
          </div>
        </div>
      </div>

      <!-- 11月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_11m');">
          11月シナリオ <span class="acc_icon">▼</span>
        </button>
        <div id="acc_11m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_nov_day1');">11月：スランプ</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_nov_day2');">11月：ジュニア大会</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_nov_day3');">11月：エリオットの誕生日</button>
          </div>
        </div>
      </div>

      <!-- 12月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_12m');">
          12月シナリオ <span class="acc_icon">▼</span>
        </button>
        <div id="acc_12m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_dec_day1');">12月：クリスマスマーケット</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_dec_day2');">12月：南次郎の警告</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_dec_day3');">12月：リョーマの誕生日</button>
          </div>
        </div>
      </div>

      <!-- 1月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_1m');">
          1月シナリオ <span class="acc_icon">▼</span>
        </button>
        <div id="acc_1m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_jan_day1');">1月：冬の車輪</button>
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_jan_day2');">1月：ジェシカの疑惑</button>
          </div>
        </div>
      </div>

      <!-- 2月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_2m');">
          2月シナリオ <span class="acc_icon">▼</span>
        </button>
        <div id="acc_2m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <!-- <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_oct_11');">2月：ジェシカの疑惑</button> -->
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_feb_day1');">2月：バレンタイン</button>
          </div>
        </div>
      </div>

      <!-- 3月 -->
      <div class="acc_group">
        <button class="acc_header" onclick="toggleAccordion(event, 'acc_3m');" style="border-color: #E57373; color: #E57373;">
          3月シナリオ（運命の分岐） <span class="acc_icon">▼</span>
        </button>
        <div id="acc_3m" class="acc_body" style="display: none;">
          <div class="acc_grid">
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_mar_day1');">3月：もう引き返せない</button>
            <button class="debug_jump_btn" style="border-color: #E57373; grid-column: span 2;" onclick="debugJump(event, '*jump_part2_mar_day2');">3月：運命の分岐</button>
          </div>
        </div>
      </div>

    </div>

    <!-- 第三部 コンテンツ -->
    <div id="tab_part3" class="tab_content" style="display: none;">
      <div style="display: grid; grid-template-columns: repeat(1, 1fr); gap: 12px; width: 600px; margin: 0 auto;">
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part3_1');">第三部：果てなき逃避行</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part3_2');">モーテルにて</button>
        <button class="debug_jump_btn" style="border-color: #E57373; color: #E57373;" onclick="debugJump(event, '*jump_part3_final');">第3部 最後の選択</button>
      </div>
    </div>

  </div>


  <!-- 戻るボタン -->
  <div style="text-align: center; margin-top: 10px;">
    <button class="debug_back_btn" onclick="debugJump(event, '*back')">
      BACK
    </button>
  </div>

</div>


<style>

/* タブボタン装飾 */
.debug_tab_btn {
  flex: 1;
  background: rgba(45, 52, 68, 0.7);
  border: 1px solid #7C8694;
  color: #a0a0a0;
  padding: 8px 0;
  font-size: 16px;
  font-weight: bold;
  border-radius: 5px 5px 0 0;
  cursor: pointer;
  transition: all 0.2s ease;
  letter-spacing: 1px;
}

.debug_tab_btn.active {
  background: #D4C291;
  color: #1F232D;
  border-color: #D4C291;
}

.debug_jump_btn {
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid #D4C291;
  color: #ffffff;
  padding: 10px 0;
  font-size: 17px;
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
  padding: 6px 45px;
  font-size: 15px;
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

/* アコーディオン全体 */
.acc_group {
  margin-bottom: 8px;
}

/* アコーディオンヘッダー */
.acc_header {
  width: 100%;
  background: rgba(31, 35, 45, 0.85);
  border: 1px solid #D4C291;
  color: #D4C291;
  padding: 8px 15px;
  font-size: 15px;
  font-weight: bold;
  text-align: left;
  border-radius: 4px;
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  align-items: center;
  transition: all 0.2s ease;
}

.acc_header:hover {
  background: rgba(212, 194, 145, 0.2);
}

.acc_header.active {
  background: rgba(212, 194, 145, 0.3);
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

/* アコーディオン内部コンテンツ */
.acc_body {
  background: rgba(15, 18, 25, 0.5);
  border: 1px solid rgba(212, 194, 145, 0.4);
  border-top: none;
  padding: 10px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
}

.acc_grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 8px 15px;
}

/* アコーディオン内のジャンプボタンサイズ微調整 */
.acc_grid .debug_jump_btn {
  font-size: 14px;
  padding: 8px 10px;
  text-align: left;
  padding-left: 12px;
}
</style>

[endhtml]


; ============================================================
; 3. リアルタイム値同期＆タブ制御処理
; ============================================================

[iscript]

; ------------------------------------------------------------
; 初期値
; ------------------------------------------------------------

tf.temp_love = 0;
tf.temp_trust = 0;
tf.temp_minus_count = 0;
tf.temp_trust_taboo = false;
tf.temp_love_taboo = false;


; ------------------------------------------------------------
; 入力欄のキーボード干渉対策
; ------------------------------------------------------------

setTimeout(function(){
    $('#tf_love_input, #tf_trust_input, #tf_minus_input').css({
        'pointer-events': 'auto',
        'position': 'relative',
        'z-index': '9999999'
    });

    $('#tf_love_input, #tf_trust_input, #tf_minus_input')
        .off('keydown.debugInput')
        .on('keydown.debugInput', function(e) {
            e.stopPropagation();
        });

    $('#trust_taboo_check, #love_taboo_check')
        .off('click.debugCheckbox')
        .on('click.debugCheckbox', function(e) {
            e.stopPropagation();
        });

}, 100);


; ------------------------------------------------------------
; 数値入力のリアルタイム同期
; ------------------------------------------------------------

$(document).off("input.debug_val").on("input.debug_val", '#tf_love_input', function() {
    tf.temp_love = Number($(this).val()) || 0;
});

$(document).off("input.debug_val_t").on("input.debug_val_t", '#tf_trust_input', function() {
    tf.temp_trust = Number($(this).val()) || 0;
});

$(document).off("input.debug_val_m").on("input.debug_val_m", '#tf_minus_input', function() {
    tf.temp_minus_count = Number($(this).val()) || 0;
});

; ------------------------------------------------------------
; チェックボックスのリアルタイム同期
; ------------------------------------------------------------

$(document).off("change.debug_check_t").on("change.debug_check_t", '#trust_taboo_check', function() {
    tf.temp_trust_taboo = $(this).is(':checked');
});

$(document).off("change.debug_check_l").on("change.debug_check_l", '#love_taboo_check', function() {
    tf.temp_love_taboo = $(this).is(':checked');
});


; ------------------------------------------------------------
; タブ切り替え処理
; ------------------------------------------------------------

window.switchPartTab = function(e, partId) {
    if (e) e.stopPropagation();
    
    $('.tab_content').hide();
    $('.debug_tab_btn').removeClass('active');
    
    $('#tab_' + partId).show();
    if (e && e.currentTarget) {
        $(e.currentTarget).addClass('active');
    }
};

; ------------------------------------------------------------
; アコーディオン開閉処理
; ------------------------------------------------------------

window.toggleAccordion = function(e, accId) {
    if (e) e.stopPropagation();
    
    var $body = $('#' + accId);
    var $header = $(e.currentTarget);
    var $icon = $header.find('.acc_icon');

    // トグル動作（開く / 閉じる）
    $body.slideToggle(200);
    $header.toggleClass('active');

    // 矢印アイコンの回転表示切り替え
    if ($header.hasClass('active')) {
        $icon.text('▲');
    } else {
        $icon.text('▼');
    }
};

; ------------------------------------------------------------
; ジャンプ共通処理
; ------------------------------------------------------------

window.debugJump = function(e, target) {

    if (e) {
        e.stopPropagation();
    }

    if (document.activeElement) {
        document.activeElement.blur();
    }

    TYRANO.kag.ftag.startTag('jump', {
        target: target
    });

};

[endscript]


[s]


; ============================================================
; 4. BACK
; ============================================================

*back

[cm]
[clear_date_jump]

[jump storage="title_screen.ks" target="*title"]

[s]


; ============================================================
; 5. 各部ジャンプ処理
; ============================================================

; --- 第一部 ---
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


; --- 第二部 ---
*jump_part2_oct_1
[apply_debug_params]
[jump storage="part2_oct_day1.ks" target=""]

*jump_part2_oct_day2
[apply_debug_params]
[jump storage="part2_oct_day2.ks" target=""]

*jump_part2_oct_day3
[apply_debug_params]
[jump storage="part2_oct_day3.ks" target=""]

*jump_part2_nov_day1
[apply_debug_params]
[jump storage="part2_nov_day1.ks" target=""]

*jump_part2_nov_day2
[apply_debug_params]
[jump storage="part2_nov_day2.ks" target=""]

*jump_part2_nov_day3
[apply_debug_params]
[jump storage="part2_nov_day3.ks" target=""]

*jump_part2_dec_day1
[apply_debug_params]
[jump storage="part2_dec_day1.ks" target=""]

*jump_part2_dec_day2
[apply_debug_params]
[jump storage="part2_dec_day2.ks" target=""]

*jump_part2_dec_day3
[apply_debug_params]
[jump storage="part2_dec_day3.ks" target=""]

*jump_part2_jan_day1
[apply_debug_params]
[jump storage="part2_jan_day1.ks" target=""]

*jump_part2_jan_day2
[apply_debug_params]
[jump storage="part2_jan_day2.ks" target=""]

*jump_part2_feb_day1
[apply_debug_params]
[jump storage="part2_feb_day1.ks" target=""]

*jump_part2_mar_day1
[apply_debug_params]
[jump storage="part2_mar_day1.ks" target=""]

; *jump_part2_jan_day1
; [apply_debug_params]
; [jump storage="part2_feb_day2.ks" target=""]



*jump_part2_mar_day2
[apply_debug_params]
[jump storage="part2_mar_day2.ks" target=""]


; --- 第三部 ---
*jump_part3_1
[apply_debug_params]
[jump storage="part3_escape_01.ks" target="*start"]

*jump_part3_2
[apply_debug_params]
[jump storage="part3_escape_02.ks" target="*start"]

*jump_part3_final
[apply_debug_params]
[jump storage="part3_final.ks" target="*start"]