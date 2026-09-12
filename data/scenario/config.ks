[_tb_system_call storage=system/_config.ks]

[cm]
[clearfix]
[hidemenubutton]
[tb_hide_message_window]

; ============================================================
; CONFIG画面全体のHTML / CSS 構築（全機能・確認欄完備）
; ============================================================
[html]
<div id="config_screen_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  background-color: rgba(15, 18, 25, 0.88);
  font-family: sans-serif;
  box-sizing: border-box;
  padding: 25px 50px;
  z-index: 9999;
  user-select: none;
">
  
  <div style="clear: both;"></div>

  <!-- メインタイトル -->
  <div style="
    text-align: center;
    color: #ffffff;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 12px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.5);
  ">
    CONFIG
  </div>

  <!-- コンフィグ全体を囲むメインパネル（座布団） -->
  <div class="area_config_box" style="
    width: 860px;
    height: 500px;
    margin: 0 auto;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 20px 30px;
    box-sizing: border-box;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  ">
  
    <!-- 1. BGM音量 ＆ ミュート -->
    <div class="config_item_row">
      <span class="config_label">BGM 音量</span>
      <div class="config_control_area">
        <input type="range" class="slider_bgm my_slider" min="0" max="100" value="100">
        <span class="config_value_text" id="val_bgm">100</span>
        <button class="config_mute_btn" id="btn_mute_bgm" onclick="toggleAudioMute('bgm')">🔊 ON</button>
      </div>
    </div>

    <!-- 2. SE音量 ＆ ミュート -->
    <div class="config_item_row">
      <span class="config_label">効果音 (SE) 音量</span>
      <div class="config_control_area">
        <input type="range" class="slider_se my_slider" min="0" max="100" value="100">
        <span class="config_value_text" id="val_se">100</span>
        <button class="config_mute_btn" id="btn_mute_se" onclick="toggleAudioMute('se')">🔊 ON</button>
      </div>
    </div>

    <!-- 3. テキスト表示速度 -->
    <div class="config_item_row">
      <span class="config_label">テキスト表示速度</span>
      <div class="config_control_area">
        <input type="range" class="slider_ch_speed my_slider" min="1" max="100" value="30">
        <span class="config_value_text" id="val_ch">30</span>
      </div>
    </div>

    <!-- 4. オートモードテキスト表示速度 -->
    <div class="config_item_row">
      <span class="config_label">オートモード速度</span>
      <div class="config_control_area">
        <input type="range" class="slider_auto_speed my_slider" min="100" max="5000" step="100" value="2000">
        <span class="config_value_text" id="val_auto">2.0秒</span>
      </div>
    </div>

    <!-- 5. スキップ設定 -->
    <div class="config_item_row">
      <span class="config_label">スキップ設定</span>
      <div class="config_control_area" style="gap: 15px; justify-content: flex-start;">
        <button class="config_choice_btn button_skip_read active" data-skip="reads" onclick="setSkipMode('reads')">既読のみ</button>
        <button class="config_choice_btn button_skip_all" data-skip="all" onclick="setSkipMode('all')">すべて</button>
      </div>
    </div>

    <!-- 6. テキスト表示速度確認欄 -->
    <div style="padding-top: 20px; display: flex; flex-direction: column; gap: 5px;">
      <span style="color: #D4C291; font-size: 12px; font-weight: bold;">【テキスト表示速度確認欄】</span>
      <div id="config_preview_text" style="
        background: rgba(0, 0, 0, 0.4);
        border: 1px solid rgba(212, 194, 145, 0.3);
        border-radius: 4px;
        padding: 6px 12px;
        color: #ffffff;
        font-size: 14px;
        height: 28px;
        line-height: 28px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      ">スライダーを動かすとテキストの表示スピードを確認できます。</div>
    </div>

  </div>

    <!-- BACKボタン -->
    <div style="padding-top:20px; text-align: center;">
      <button class="ed_back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*backtitle'});">
        BACK
      </button>
    </div>
</div>

<!-- スタイル＆テーマカラー調整 -->
<style>
  .config_item_row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid rgba(212, 194, 145, 0.15);
	padding: 20px 0 20px 0;
  }

  .config_label {
    color: #ffffff;
    font-size: 14px;
    font-weight: bold;
    letter-spacing: 1px;
    width: 160px;
  }

  .config_control_area {
    display: flex;
    align-items: center;
    gap: 15px;
    flex: 1;
    justify-content: flex-start;
  }

  .config_value_text {
    color: #D4C291;
    font-size: 15px;
    font-family: monospace;
    min-width: 35px;
    text-align: left;
  }

  /* ゴールド仕様のスライダー */
  input.my_slider {
    -webkit-appearance: none;
    width: 500px;
    height: 6px;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 3px;
    outline: none;
	position: static;
  }

  input.my_slider::-webkit-slider-thumb {
    -webkit-appearance: none;
    width: 15px;
    height: 15px;
    background: #D4C291;
    border-radius: 50%;
    cursor: pointer;
    transition: trantform 0.1s ease, background-color 0.1s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.5);
  }

  input.my_slider::-webkit-slider-thumb:hover {
    background: #ffffff;
    trantform: scale(1.2);
  }

  /* ミュート切り替えボタン */
  .config_mute_btn {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid #D4C291;
    color: #ffffff;
    padding: 4px 12px;
    font-size: 12px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.2s ease;
    min-width: 75px;
	margin-left: auto;
  }
  .config_mute_btn.muted {
    background: rgba(229, 115, 115, 0.3);
    border-color: #E57373;
    color: #ffcccc;
  }

  /* スキップ切替ボタン等共通選択ボタン */
  .config_choice_btn {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(212, 194, 145, 0.4);
    color: #cccccc;
    padding: 5px 18px;
    font-size: 13px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .config_choice_btn:hover {
    border-color: #D4C291;
    color: #ffffff;
    background: rgba(212, 194, 145, 0.15);
  }

  .config_choice_btn.active {
    background: rgba(212, 194, 145, 0.3);
    border-color: #D4C291;
    color: #ffffff;
    box-shadow: 0 0 8px rgba(212, 194, 145, 0.3);
  }

  /* 戻るボタン専用スタイル */
.ed_back_btn {
background: rgba(0, 0, 0, 0.5);
border: 1px solid #D4C291;
color: #ffffff;
padding: 6px 30px;
font-size: 15px;
font-weight: bold;
border-radius: 4px;
cursor: pointer;
transition: all 0.2s ease;
letter-spacing: 1px;
}
.ed_back_btn:hover {
background: rgba(212, 194, 145, 0.3);
border-color: #ffffff;
trantform: translateY(-2px);
}
</style>
[endhtml]

; ============================================================
; JavaScript 制御処理（ミュート・速度プレビュー・閉じ方）
; ============================================================
[iscript]

// テキスト表示速度確認欄のタイピングアニメーション
function runConfigPreview(speed) {
    var text = "スライダーを動かすとテキストの表示スピードを確認できます。";
    var $preview = $('#config_preview_text');
    $preview.text("");
    var i = 0;
    if (window.configPreviewTimer) clearInterval(window.configPreviewTimer);
    window.configPreviewTimer = setInterval(function() {
        if (i < text.length) {
            $preview.text($preview.text() + text[i]);
            i++;
        } else {
            clearInterval(window.configPreviewTimer);
        }
    }, Math.max(1,Number(speed)));
}

// 1. 起動時（画面表示時）にシステム変数（tf）から設定を読み込み、スライダーやボタンに反映する
if (typeof tf.config_bgm_muted === 'undefined') tf.config_bgm_muted = false;
if (typeof tf.config_se_muted === 'undefined') tf.config_se_muted = false;
if (typeof tf.config_bgm_before_mute === 'undefined') tf.config_bgm_before_mute = 100;
if (typeof tf.config_se_before_mute === 'undefined') tf.config_se_before_mute = 100;

// 画面上の要素に反映
tf.current_bgm_vol=parseInt(TG.config.defaultBgmVolume);
tf.current_se_vol=parseInt(TG.config.defaultSeVolume);

tf.current_ch_speed=parseInt(TG.config.chSpeed);
tf.current_auto_speed=parseInt(TG.config.autoSpeed);

tf.text_skip ="reads";

if(TG.config.unReadTextSkip != "true"){
	tf.text_skip ="all";
} 

$('.slider_bgm').val(tf.current_bgm_vol);
$('#val_bgm').text(tf.current_bgm_vol);

$('.slider_se').val(tf.current_se_vol);
$('#val_se').text(tf.current_se_vol);

$('.slider_ch_speed').val(tf.current_ch_speed);
$('#val_ch').text(tf.current_ch_speed);

$('.slider_auto_speed').val(tf.current_auto_speed);
$('#val_auto').text((tf.current_auto_speed / 1000).toFixed(1) + '秒');

// スキップ設定ボタンの見た目反映
$('.config_choice_btn').removeClass('active');
if (tf.text_skip === 'reads') {
    $('.button_skip_read').addClass('active');
    if (TYRANO && TYRANO.kag) TYRANO.kag.stat.skip_mode = "reads";
} else {
    $('.button_skip_all').addClass('active');
    if (TYRANO && TYRANO.kag) TYRANO.kag.stat.skip_mode = "all";
}

// BGMミュート状態を復元
if (tf.config_bgm_muted) {
    $('.slider_bgm').val(0);
    $('#val_bgm').text(0);
    $('#btn_mute_bgm').text('🔇 OFF');
} else {
    $('#btn_mute_bgm').text('🔊 ON');
}

// 2. スライダーやボタンが操作されたときにシステム変数へ保存する処理

//ミュートボタンの処理
window.toggleAudioMute = function(type) {
    if (type === 'bgm') {
        // 現在ミュート中なら元の音量へ戻す
        if (tf.config_bgm_muted) {
            tf.current_bgm_vol = tf.config_bgm_before_mute;
            tf.config_bgm_muted = false;

            $('.slider_bgm').val(tf.current_bgm_vol);
            $('#val_bgm').text(tf.current_bgm_vol);
            $('#btn_mute_bgm').text('🔊 ON').removeClass('muted');
        } else {
            // ミュート前の音量を保存して0にする
            tf.config_bgm_before_mute = tf.current_bgm_vol;
            tf.current_bgm_vol = 0;
            tf.config_bgm_muted = true;

            $('.slider_bgm').val(0);
            $('#val_bgm').text(0);
            $('#btn_mute_bgm').text('🔇 OFF').addClass('muted');
        }

    } else if (type === 'se') {
        // 現在ミュート中なら元の音量へ戻す
        if (tf.config_se_muted) {
            tf.current_se_vol = tf.config_se_before_mute;
            tf.config_se_muted = false;

            $('.slider_se').val(tf.current_se_vol);
            $('#val_se').text(tf.current_se_vol);
            $('#btn_mute_se').text('🔊 ON').removeClass('muted');
        } else {
            // ミュート前の音量を保存して0にする
            tf.config_se_before_mute = tf.current_se_vol;
            tf.current_se_vol = 0;
            tf.config_se_muted = true;

            $('.slider_se').val(0);
            $('#val_se').text(0);
            $('#btn_mute_se').text('🔇 OFF').addClass('muted');
        }
    }
        TYRANO.kag.saveSystemVariable();
};

// BGM音量スライダー
$('.slider_bgm').on('input', function() {
    var val = Number($(this).val());

    // 0にした場合は、0になる前の音量を保存
    if (val === 0 && !tf.config_bgm_muted) {
        tf.config_bgm_before_mute = tf.current_bgm_vol;
    }

    tf.current_bgm_vol = val;
    $('#val_bgm').text(val);

    // 音量0 → ミュート
    if (val === 0) {
        tf.config_bgm_muted = true;
        $('#btn_mute_bgm').text('🔇 OFF').addClass('muted');

    // 0より上 → ミュート解除
    } else if (tf.config_bgm_muted) {
        tf.config_bgm_muted = false;
        $('#btn_mute_bgm').text('🔊 ON').removeClass('muted');
    }
	TYRANO.kag.ftag.startTag("bgmopt", { volume: tf.current_bgm_vol });
    TYRANO.kag.saveSystemVariable();
});

// SE音量スライダー
$('.slider_se').off('input.config').on('input.config', function() {
    var val = Number($(this).val());

    // 0にした場合は、0になる前の音量を保存
    if (val === 0 && !tf.config_se_muted) {
        tf.config_se_before_mute = tf.current_se_vol;
    }

    tf.current_se_vol = val;
    $('#val_se').text(val);

    // 音量0 → ミュート
    if (val === 0) {
        tf.config_se_muted = true;
        $('#btn_mute_se').text('🔇 OFF').addClass('muted');

    // 0より上 → ミュート解除
    } else if (tf.config_se_muted) {
        tf.config_se_muted = false;
        $('#btn_mute_se').text('🔊 ON').removeClass('muted');
    }
	TYRANO.kag.ftag.startTag("seopt", { volume: tf.current_se_vol });
    TYRANO.kag.saveSystemVariable();
});


// テキスト表示速度
$('.slider_ch_speed').off('input.config').on('input.config', function() {
    var val = Number($(this).val());
	runConfigPreview(val);
    $('#val_ch').text(val);

    // 設定を保存
    tf.current_ch_speed = val;
	TYRANO.kag.ftag.startTag("configdelay", { speed: tf.current_ch_speed });
    TYRANO.kag.saveSystemVariable();
});


// オート速度
$('.slider_auto_speed').off('input.config').on('input.config', function() {
    var val = Number($(this).val());

    $('#val_auto').text((val / 1000).toFixed(1) + '秒');

    // 設定を保存
    tf.current_auto_speed = val;
	TYRANO.kag.ftag.startTag("autoconfig", { speed: tf.current_auto_speed });
    TYRANO.kag.saveSystemVariable();
});


// スキップモード
window.setSkipMode = function(mode) {
    $('.config_choice_btn').removeClass('active');
    if (mode === 'reads') {
        $('.button_skip_read').addClass('active');
		TYRANO.kag.ftag.startTag("skipstart", { type: "reads" });
    } else {
        $('.button_skip_all').addClass('active');
		TYRANO.kag.ftag.startTag("skipstart", { type: "all" });
    }
    TYRANO.kag.saveSystemVariable();
};

[endscript]

[s]

;--------------------------------------------------------------------------------
; タイトルに戻る
;--------------------------------------------------------------------------------
*backtitle

[iscript]
tf.flag_back=$(".message1_fore").css("display");
[endscript]

[if exp="tf.flag_back=='none'"]

[cm]
[layopt layer=message1 visible=false]
[freeimage layer=1]
[clearfix]
;コンフィグの呼び出しに sleepgame を使っているので、必ず awakegame で戻してやってください
[awakegame]

[endif]

[return]