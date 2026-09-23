[_tb_system_call storage=system/_date_jump.ks]

; ============================================================
; 1. デバッグパラメータ適用用共通マクロ
; ============================================================

[macro name="apply_debug_params"]

  [clear_date_jump]
  [cm]

  [call storage="new_game_init.ks" target="*new_game"]
  [call storage="make.ks"]

  [iscript]
    f.love = tf.temp_love;
    f.trust = tf.temp_trust;
    f.minus_count = tf.temp_minus_count;
    f.trust_taboo_flag = tf.temp_trust_taboo;
    f.love_taboo_flag = tf.temp_love_taboo;
  [endscript]

  [tb_show_message_window]
  [tb_keyconfig flag="1"]
  [start_keyconfig]

[endmacro]


; ============================================================
; 日付ジャンプ画面クリア
; ============================================================

[macro name="clear_date_jump"]

  [iscript]
    $("#date_jump_wrapper").remove();
  [endscript]

[endmacro]


[cm]


; ============================================================
; 2. 全UIを一括構築するHTML
; ============================================================

[html]
  <div id="date_jump_wrapper" class="my_content_wrap">
    <div class="my_content_title_header">
        <div class="my_content_title">日付＆パラメータ設定ジャンプ</div>
    </div>

    <!-- ======================================================
         パラメータ
    ======================================================= -->

    <div class="dj_param_panel">
      <div class="dj_param_row">

        <div class="dj_input_group">
          <label for="tf_love_input">好感度(love):</label>
          <input type="number" id="tf_love_input" class="dj_input_num width_love" value="0" min="-999" max="999" />
        </div>

        <div class="dj_input_group">
          <label for="tf_trust_input">信頼度(trust):</label>
          <input type="number" id="tf_trust_input" class="dj_input_num width_trust" value="0" min="-999" max="999" />
        </div>

        <div class="dj_input_group">
          <label for="tf_minus_input">拒絶数(minus):</label>
          <input type="number" id="tf_minus_input" class="dj_input_num width_minus" value="0" min="0" max="99" />
        </div>

      </div>
    </div>


    <!-- ======================================================
         部タブ
    ======================================================= -->

    <div class="dj_tab_area">
      <button class="debug_tab_btn active" data-part="part1">第一部</button>
      <button class="debug_tab_btn" data-part="part2">第二部</button>
      <button class="debug_tab_btn" data-part="part3">第三部</button>
    </div>


    <div class="dj_content_container">

      <!-- ====================================================
           第一部
      ===================================================== -->

      <div id="tab_part1" class="tab_content" style="display: block">

        <div class="dj_center_box">
          <button class="debug_jump_btn btn_final_part1" onclick="debugJump(event, '*jump_day0_part1');" data-chapter="part1_day0"></button>
        </div>

        <div class="dj_part1_grid">
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part1');" data-chapter="part1_day1"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part1');" data-chapter="part1_day2"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3_part1');" data-chapter="part1_day3"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day4_part1');" data-chapter="part1_day4"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day5_part1');" data-chapter="part1_day5"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day6_part1');" data-chapter="part1_day6"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day7_part1');" data-chapter="part1_day7"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day8_part1');" data-chapter="part1_day8"></button>
        </div>

        <div class="dj_center_box">
          <button class="debug_jump_btn btn_final_part1" onclick="debugJump(event, '*jump_final_part1');" data-chapter="part1_final"></button>
        </div>

      </div>


      <!-- ====================================================
           第二部
      ===================================================== -->

      <div id="tab_part2" class="tab_content" style="display: none">

        <!-- 10月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_10m');">10月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_10m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_oct');" data-chapter="part2_oct_day1"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part2_oct');" data-chapter="part2_oct_day2"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3_part2_oct');" data-chapter="part2_oct_day3"></button>
            </div>
          </div>
        </div>


        <!-- 11月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_11m');">11月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_11m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_nov');" data-chapter="part2_nov_day1"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part2_nov');" data-chapter="part2_nov_day2"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3_part2_nov');" data-chapter="part2_nov_day3"></button>
            </div>
          </div>
        </div>


        <!-- 12月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_12m');">12月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_12m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_dec');" data-chapter="part2_dec_day1"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part2_dec');" data-chapter="part2_dec_day2"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day3_part2_dec');" data-chapter="part2_dec_day3"></button>
            </div>
          </div>
        </div>


        <!-- 1月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_1m');">1月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_1m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_jan');" data-chapter="part2_jan_day1"></button>
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part2_jan');" data-chapter="part2_jan_day2"></button>
            </div>
          </div>
        </div>


        <!-- 2月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_2m');">2月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_2m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_feb');" data-chapter="part2_feb_day1"></button>
            </div>
          </div>
        </div>


        <!-- 3月 -->
        <div class="acc_group">
          <button class="acc_header" onclick="toggleAccordion(event, 'acc_3m');">3月シナリオ<span class="acc_icon"> ▼ </span></button>

          <div id="acc_3m" class="acc_body" style="display: none">
            <div class="acc_grid">
              <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part2_mar');" data-chapter="part2_mar_day1"></button>
              <button class="debug_jump_btn btn_danger_branch" onclick="debugJump(event, '*jump_day2_part2_mar');" data-chapter="part2_mar_day2"></button>
            </div>
          </div>
        </div>

      </div>


      <!-- ====================================================
           第三部
      ===================================================== -->

      <div id="tab_part3" class="tab_content" style="display: none">

        <div class="dj_part3_grid">
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day1_part3');" data-chapter="part3_escape_01"></button>
          <button class="debug_jump_btn" onclick="debugJump(event, '*jump_day2_part3');" data-chapter="part3_escape_02"></button>
          <button class="debug_jump_btn btn_danger_branch" onclick="debugJump(event, '*jump_final_part3');">第3部 最後の選択</button>
        </div>

      </div>

    </div>


    <!-- フッター -->

    <div class="dj_footer_area">

      <div class="back_wrapper">
        <button class="back_btn" onclick="debugJump(event, '*back')">
          BACK
        </button>
      </div>


      <div class="dj_sub_action_box">
        <button class="debug_clear_storage_btn" onclick="clearStorageDebug();">🗑️ ストレージ全削除 (ローカル初期化)</button>
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

  setTimeout(function () {
    $("#tf_love_input, #tf_trust_input, #tf_minus_input").css({
      "pointer-events": "auto",
      position: "relative",
      "z-index": "9999999",
    });

    $("#tf_love_input, #tf_trust_input, #tf_minus_input")
      .off("keydown.debugInput")
      .on("keydown.debugInput", function (e) {
        e.stopPropagation();
      });
  }, 100);

; ------------------------------------------------------------
; 数値入力のリアルタイム同期
; ------------------------------------------------------------
  $(document)
    .off("input.debug_val")
    .on("input.debug_val", "#tf_love_input", function () {
      tf.temp_love = Number($(this).val()) || 0;
    });

  $(document)
    .off("input.debug_val_t")
    .on("input.debug_val_t", "#tf_trust_input", function () {
      tf.temp_trust = Number($(this).val()) || 0;
    });

  $(document)
    .off("input.debug_val_m")
    .on("input.debug_val_m", "#tf_minus_input", function () {
      tf.temp_minus_count = Number($(this).val()) || 0;
    });

  window.updateDateJumpChapterLabels = function () {

    if (!window.CHAPTER_DATA) {
      console.warn("CHAPTER_DATA が読み込まれていません");
      return;
    }

    $(".debug_jump_btn[data-chapter]").each(function () {

      var $button = $(this);
      var chapterId = $button.attr("data-chapter");
      var chapter = window.CHAPTER_DATA[chapterId];

      if (!chapter) {
        console.warn("CHAPTER_DATA に存在しないchapterId:", chapterId);
        return;
      }

      var headerDay = chapter.headerDay || "";
      var subTitle = chapter.subTitle || "";
      var text = headerDay;

      if (subTitle) {
        text += "：" + subTitle;
      }

      $button.text(text);
    });
  };

  updateDateJumpChapterLabels();

; ------------------------------------------------------------
; タブ切り替え処理
; ------------------------------------------------------------

  window.switchPartTab = function (e, partId) {

    if (e) {
      e.preventDefault();
      e.stopPropagation();
    }

    $(".tab_content").hide();
    $(".debug_tab_btn").removeClass("active");
    $("#tab_" + partId).show();

    if (e && e.currentTarget) {
      $(e.currentTarget).addClass("active");
    }
  };

  $(".debug_tab_btn")
    .off(".dateJump")
    .on("touchend.dateJump", function (e) {

      e.preventDefault();
      e.stopPropagation();
      e.stopImmediatePropagation();

      switchPartTab(e.originalEvent, $(this).data("part"));
    })
    .on("click.dateJump", function (e) {

      e.preventDefault();
      e.stopPropagation();

      switchPartTab(e, $(this).data("part"));
    });

; ------------------------------------------------------------
; アコーディオン開閉処理
; ------------------------------------------------------------

  window.toggleAccordion = function (e, accId) {

    if (e) {
      e.stopPropagation();
    }

    var $body = $("#" + accId);
    var $header = $(e.currentTarget);
    var $icon = $header.find(".acc_icon");

    if ($header.hasClass("active")) {

      $body.slideUp(200);
      $header.removeClass("active");
      $icon.text("▼");

    } else {

      $(".acc_body").not($body).slideUp(200);

      $(".acc_header")
        .not($header)
        .removeClass("active")
        .find(".acc_icon")
        .text("▼");

      $body.slideDown(200);
      $header.addClass("active");
      $icon.text("▲");
    }
  };
; ------------------------------------------------------------
; ジャンプ共通処理
; ------------------------------------------------------------

  window.debugJump = function (e, target) {

    if (e) {
      e.preventDefault();
      e.stopPropagation();
    }

    if (document.activeElement) {
      document.activeElement.blur();
    }

    TYRANO.kag.ftag.startTag("jump", {
      target: target,
    });
  };

  window.clearStorageDebug = function () {

    openConfirm(
      "スマホ/ブラウザに保存されているセーブデータやシステム変数をすべて削除して初期化しますか？",

      function () {

        window.localStorage.clear();

        if (typeof sf !== "undefined") {
          for (var key in sf) {
            delete sf[key];
          }
        }

        if (typeof f !== "undefined") {
          for (var key in f) {
            delete f[key];
          }
        }

        if (typeof TG !== "undefined" && TG.saveSystemVariable) {
          TG.saveSystemVariable();
        }

        openAlert(
          "ストレージを完全に削除しました。ページを再読み込みします。",

          function () {
            location.reload();
          },
        );
      },
    );
  };

  var djScrollArea = document.querySelector(".dj_content_container");

  if (djScrollArea) {

    djScrollArea.addEventListener(
      "touchstart",
      function (e) {
        e.stopPropagation();
      },
      {
        passive: true,
      },
    );

    djScrollArea.addEventListener(
      "touchmove",
      function (e) {
        e.stopPropagation();
      },
      {
        passive: true,
      },
    );

    djScrollArea.addEventListener(
      "touchend",
      function (e) {
        e.stopPropagation();
      },
      {
        passive: true,
      },
    );
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

; 第一部
*jump_day0_part1
[apply_debug_params]
[jump storage="part1_day0.ks"]

*jump_day1_part1
[apply_debug_params]
[jump storage="part1_day1.ks"]

*jump_day2_part1
[apply_debug_params]
[jump storage="part1_day2.ks"]

*jump_day3_part1
[apply_debug_params]
[jump storage="part1_day3.ks"]

*jump_day4_part1
[apply_debug_params]
[jump storage="part1_day4.ks"]

*jump_day5_part1
[apply_debug_params]
[jump storage="part1_day5.ks"]

*jump_day6_part1
[apply_debug_params]
[jump storage="part1_day6.ks"]

*jump_day7_part1
[apply_debug_params]
[jump storage="part1_day7.ks"]

*jump_day8_part1
[apply_debug_params]
[jump storage="part1_day8.ks"]

*jump_final_part1
[apply_debug_params]
[jump storage="part1_final.ks" target="*top"]


; 第二部：10月
*jump_day1_part2_oct
[apply_debug_params]
[jump storage="part2_oct_day1.ks"]

*jump_day2_part2_oct
[apply_debug_params]
[jump storage="part2_oct_day2.ks"]

*jump_day3_part2_oct
[apply_debug_params]
[jump storage="part2_oct_day3.ks"]


; 第二部：11月
*jump_day1_part2_nov
[apply_debug_params]
[jump storage="part2_nov_day1.ks"]

*jump_day2_part2_nov
[apply_debug_params]
[jump storage="part2_nov_day2.ks"]

*jump_day3_part2_nov
[apply_debug_params]
[jump storage="part2_nov_day3.ks"]


; 第二部：12月
*jump_day1_part2_dec
[apply_debug_params]
[jump storage="part2_dec_day1.ks"]

*jump_day2_part2_dec
[apply_debug_params]
[jump storage="part2_dec_day2.ks"]

*jump_day3_part2_dec
[apply_debug_params]
[jump storage="part2_dec_day3.ks"]


; 第二部：1月
*jump_day1_part2_jan
[apply_debug_params]
[jump storage="part2_jan_day1.ks"]

*jump_day2_part2_jan
[apply_debug_params]
[jump storage="part2_jan_day2.ks"]


; 第二部：2月
*jump_day1_part2_feb
[apply_debug_params]
[jump storage="part2_feb_day1.ks"]


; 第二部：3月
*jump_day1_part2_mar
[apply_debug_params]
[jump storage="part2_mar_day1.ks"]

*jump_day2_part2_mar
[apply_debug_params]
[jump storage="part2_mar_day2.ks"]


; 第三部
*jump_day1_part3
[apply_debug_params]
[jump storage="part3_escape_01.ks"]

*jump_day2_part3
[apply_debug_params]
[jump storage="part3_escape_02.ks" target="*start"]

*jump_final_part3
[apply_debug_params]
[jump storage="part3_final.ks" target="*start"]