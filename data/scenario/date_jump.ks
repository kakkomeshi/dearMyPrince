[_tb_system_call storage=system/_date_jump.ks]

; 外部CSSの読み込み
[loadcss file="./data/others/css/date_jump.css"]

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
[call storage="make.ks"]

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
[tb_keyconfig flag="1"]
[start_keyconfig]

[endmacro]


[macro name="clear_date_jump"]

[iscript]
$('#date_jump_wrapper').remove();
[endscript]

[endmacro]


[cm]


; ============================================================
; 2. 全UIを一括構築するHTML
; ============================================================

[html]

<div id="date_jump_wrapper" class="dj_wrapper">

  <!-- 画面タイトル -->
  <div class="dj_title">
    日付＆パラメータ設定ジャンプ
  </div>


  <!-- 上部：手動パラメータ入力用 パネル -->
  <div class="dj_param_panel">
    <!-- 数値入力 -->
    <div class="dj_param_row">
      <div class="dj_input_group">
        <label for="tf_love_input">好感度(love):</label>
        <input type="number" id="tf_love_input" class="dj_input_num width_love" value="0" min="-999" max="999">
      </div>
      <div class="dj_input_group">
        <label for="tf_trust_input">信頼度(trust):</label>
        <input type="number" id="tf_trust_input" class="dj_input_num width_trust" value="0" min="-999" max="999">
      </div>
      <div class="dj_input_group">
        <label for="tf_minus_input">拒絶数(minus):</label>
        <input type="number" id="tf_minus_input" class="dj_input_num width_minus" value="0" min="0" max="99">
      </div>
    </div>
  </div>


  <!-- タブボタンエリア -->
  <div class="dj_tab_area">
    <button class="debug_tab_btn active" data-part="part1">第一部</button>
    <button class="debug_tab_btn" data-part="part2">第二部</button>
    <button class="debug_tab_btn" data-part="part3">第三部</button>
  </div>


  <!-- タブコンテンツ領域 -->
  <div class="dj_content_container">

    <!-- 第一部 コンテンツ -->
    <div id="tab_part1" class="tab_content" style="display: block;">
      <div class="dj_part1_grid">
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1');">DAY 1</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day5');">DAY 5</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2');">DAY 2</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day6');">DAY 6</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3');">DAY 3</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day7');">DAY 7</button>

        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day4');">DAY 4</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day8');">DAY 8</button>
      </div>

      <div class="dj_center_box">
        <button class="debug_jump_btn btn_final_part1" onclick="debugJump(event, '*jump_final')">
          PART 1 FINAL
        </button>
      </div>
    </div>

    <!-- 第二部 コンテンツ -->
    <div id="tab_part2" class="tab_content" style="display: none;">
      
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
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_feb_day1');">2月：バレンタイン</button>
          </div>
        </div>
      </div>

      <!-- 3月 -->
      <div class="acc_group">
        <button class="acc_header header_danger" onclick="toggleAccordion(event, 'acc_3m');">
          3月シナリオ（運命の分岐） <span class="acc_icon">▼</span>
        </button>
        <div id="acc_3m" class="acc_body" style="display: none;">
          <div class="acc_grid">
            <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part2_mar_day1');">3月：もう引き返せない</button>
            <button class="debug_jump_btn btn_danger_branch" onclick="debugJump(event, '*jump_part2_mar_day2');">3月：運命の分岐</button>
          </div>
        </div>
      </div>

    </div>

    <!-- 第三部 コンテンツ -->
    <div id="tab_part3" class="tab_content" style="display: none;">
      <div class="dj_part3_grid">
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part3_1');">第三部：果てなき逃避行</button>
        <button class="debug_jump_btn" onclick="debugJump(event, '*jump_part3_2');">モーテルにて</button>
        <button class="debug_jump_btn btn_danger_branch" onclick="debugJump(event, '*jump_part3_final');">第3部 最後の選択</button>
      </div>
    </div>

  </div>


  <!-- 戻るボタン -->
  <div class="dj_footer_area">
    <button class="debug_back_btn" onclick="debugJump(event, '*back')">
      BACK
    </button>

    <div class="dj_sub_action_box">
      <button class="debug_clear_storage_btn" onclick="clearStorageDebug();">
        🗑️ ストレージ全削除 (ローカル初期化)
      </button>
    </div>
  </div>

</div>

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
; タブ切り替え処理
; ------------------------------------------------------------

window.switchPartTab = function(e, partId) {

    if (e) {
        e.preventDefault();
        e.stopPropagation();
    }

    $('.tab_content').hide();
    $('.debug_tab_btn').removeClass('active');

    $('#tab_' + partId).show();

    if (e && e.currentTarget) {
        $(e.currentTarget).addClass('active');
    }
};

$('.debug_tab_btn')
    .off('.dateJump')
    .on('touchend.dateJump', function(e) {

        e.preventDefault();
        e.stopPropagation();
        e.stopImmediatePropagation();

        switchPartTab(e.originalEvent, $(this).data('part'));

    })
    .on('click.dateJump', function(e) {

        e.preventDefault();
        e.stopPropagation();

        switchPartTab(e, $(this).data('part'));

    });
; ------------------------------------------------------------
; アコーディオン開閉処理
; ------------------------------------------------------------

window.toggleAccordion = function(e, accId) {
    if (e) e.stopPropagation();
    
    var $body = $('#' + accId);
    var $header = $(e.currentTarget);
    var $icon = $header.find('.acc_icon');

    if ($header.hasClass('active')) {
        $body.slideUp(200);
        $header.removeClass('active');
        $icon.text('▼');
    } else {
        $('.acc_body').not($body).slideUp(200);
        $('.acc_header').not($header).removeClass('active').find('.acc_icon').text('▼');

        $body.slideDown(200);
        $header.addClass('active');
        $icon.text('▲');
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


// ストレージ全削除処理（スマホ・PC両対応）
window.clearStorageDebug = function() {
    openConfirm("スマホ/ブラウザに保存されているセーブデータやシステム変数をすべて削除して初期化しますか？",
        function () {
        window.localStorage.clear();
        
        if (typeof sf !== 'undefined') {
            for (var key in sf) { delete sf[key]; }
        }
        if (typeof f !== 'undefined') {
            for (var key in f) { delete f[key]; }
        }

        if (typeof TG !== 'undefined' && TG.saveSystemVariable) {
            TG.saveSystemVariable();
        }

        openAlert("ストレージを完全に削除しました。ページを再読み込みします。",
        function () {
          location.reload();
          });
        });
};

var djScrollArea = document.querySelector('.dj_content_container');

if (djScrollArea) {

    djScrollArea.addEventListener('touchstart', function(e) {
        e.stopPropagation();
    }, { passive: true });

    djScrollArea.addEventListener('touchmove', function(e) {
        e.stopPropagation();
    }, { passive: true });

    djScrollArea.addEventListener('touchend', function(e) {
        e.stopPropagation();
    }, { passive: true });
}

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
[jump storage="part1_day1.ks" ]

*jump_day2
[apply_debug_params]
[jump storage="part1_day2.ks" ]

*jump_day3
[apply_debug_params]
[jump storage="part1_day3.ks" ]

*jump_day4
[apply_debug_params]
[jump storage="part1_day4.ks" ]

*jump_day5
[apply_debug_params]
[jump storage="part1_day5.ks" ]

*jump_day6
[apply_debug_params]
[jump storage="part1_day6.ks" ]

*jump_day7
[apply_debug_params]
[jump storage="part1_day7.ks" ]

*jump_day8
[apply_debug_params]
[jump storage="part1_day8.ks" ]

*jump_final
[apply_debug_params]
[jump storage="part1_final.ks" target="*top"]


; --- 第二部 ---
*jump_part2_oct_1
[apply_debug_params]
[jump storage="part2_oct_day1.ks" ]

*jump_part2_oct_day2
[apply_debug_params]
[jump storage="part2_oct_day2.ks" ]

*jump_part2_oct_day3
[apply_debug_params]
[jump storage="part2_oct_day3.ks" ]

*jump_part2_nov_day1
[apply_debug_params]
[jump storage="part2_nov_day1.ks" ]

*jump_part2_nov_day2
[apply_debug_params]
[jump storage="part2_nov_day2.ks" ]

*jump_part2_nov_day3
[apply_debug_params]
[jump storage="part2_nov_day3.ks" ]

*jump_part2_dec_day1
[apply_debug_params]
[jump storage="part2_dec_day1.ks" ]

*jump_part2_dec_day2
[apply_debug_params]
[jump storage="part2_dec_day2.ks" ]

*jump_part2_dec_day3
[apply_debug_params]
[jump storage="part2_dec_day3.ks" ]

*jump_part2_jan_day1
[apply_debug_params]
[jump storage="part2_jan_day1.ks" ]

*jump_part2_jan_day2
[apply_debug_params]
[jump storage="part2_jan_day2.ks" ]

*jump_part2_feb_day1
[apply_debug_params]
[jump storage="part2_feb_day1.ks" ]

*jump_part2_mar_day1
[apply_debug_params]
[jump storage="part2_mar_day1.ks" ]

*jump_part2_mar_day2
[apply_debug_params]
[jump storage="part2_mar_day2.ks" ]


; --- 第三部 ---
*jump_part3_1
[apply_debug_params]
[jump storage="part3_escape_01.ks" ]

*jump_part3_2
[apply_debug_params]
[jump storage="part3_escape_02.ks" target="*start"]

*jump_part3_final
[apply_debug_params]
[jump storage="part3_final.ks" target="*start"]