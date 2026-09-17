[_tb_system_call storage=system/_config_mobile.ks]

[cm]
[clearfix]
[hidemenubutton]
[tb_hide_message_window]

; ============================================================
; CONFIG画面全体のHTML / CSS 構築（スマホ最適化・ボタン式）
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
  padding: 15px 40px;
  z-index: 9999;
  user-select: none;
">
  
  <div style="clear: both;"></div>

  <!-- メインタイトル -->
  <div style="
    text-align: center;
    color: #ffffff;
    font-size: 24px;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 8px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.5);
  ">
    CONFIG
  </div>

  <!-- コンフィグ全体を囲むメインパネル（座布団） -->
  <div class="area_config_box" style="
    width: 880px;
    height: 510px;
    margin: 0 auto;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 15px 25px;
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
        <div class="step_btn_group">
          <button class="config_step_btn btn_bgm_vol" data-vol="0" onclick="setBgmVolume(0)">0%</button>
          <button class="config_step_btn btn_bgm_vol" data-vol="25" onclick="setBgmVolume(25)">25%</button>
          <button class="config_step_btn btn_bgm_vol" data-vol="50" onclick="setBgmVolume(50)">50%</button>
          <button class="config_step_btn btn_bgm_vol" data-vol="75" onclick="setBgmVolume(75)">75%</button>
          <button class="config_step_btn btn_bgm_vol" data-vol="100" onclick="setBgmVolume(100)">100%</button>
        </div>
        <button class="config_mute_btn" id="btn_mute_bgm" onclick="toggleAudioMute('bgm')">🔊 ON</button>
      </div>
    </div>

    <!-- 2. SE音量 ＆ ミュート -->
    <div class="config_item_row">
      <span class="config_label">効果音 (SE) 音量</span>
      <div class="config_control_area">
        <div class="step_btn_group">
          <button class="config_step_btn btn_se_vol" data-vol="0" onclick="setSeVolume(0)">0%</button>
          <button class="config_step_btn btn_se_vol" data-vol="25" onclick="setSeVolume(25)">25%</button>
          <button class="config_step_btn btn_se_vol" data-vol="50" onclick="setSeVolume(50)">50%</button>
          <button class="config_step_btn btn_se_vol" data-vol="75" onclick="setSeVolume(75)">75%</button>
          <button class="config_step_btn btn_se_vol" data-vol="100" onclick="setSeVolume(100)">100%</button>
        </div>
        <button class="config_mute_btn" id="btn_mute_se" onclick="toggleAudioMute('se')">🔊 ON</button>
      </div>
    </div>

    <!-- 3. テキスト表示速度 -->
    <div class="config_item_row">
      <span class="config_label">テキスト表示速度</span>
      <div class="config_control_area">
        <div class="step_btn_group">
          <button class="config_step_btn btn_ch_speed" data-speed="1" onclick="setChSpeed(1)">遅い</button>
          <button class="config_step_btn btn_ch_speed" data-speed="2" onclick="setChSpeed(2)">普通</button>
          <button class="config_step_btn btn_ch_speed" data-speed="3" onclick="setChSpeed(3)">早い</button>
        </div>
      </div>
    </div>

    <!-- 4. オートモードテキスト表示速度 -->
    <div class="config_item_row">
      <span class="config_label">オートモード速度</span>
      <div class="config_control_area">
        <div class="step_btn_group">
          <button class="config_step_btn btn_auto_speed" data-speed="1" onclick="setAutoSpeed(1)">遅い</button>
          <button class="config_step_btn btn_auto_speed" data-speed="2" onclick="setAutoSpeed(2)">普通</button>
          <button class="config_step_btn btn_auto_speed" data-speed="3" onclick="setAutoSpeed(3)">早い</button>
        </div>
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
    <div style="padding-top: 10px; display: flex; flex-direction: column; gap: 4px;">
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
      ">ボタンを押すとテキストの表示スピードを確認できます。</div>
    </div>

  </div>

  <!-- BACKボタン -->
  <div style="padding-top: 12px; text-align: center;">
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
    padding: 10px 0;
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

  .step_btn_group {
    display: flex;
    gap: 8px;
  }

  /* スマホ向け5段階・3段階の押しやすいボタン */
  .config_step_btn {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(212, 194, 145, 0.3);
    color: #cccccc;
    padding: 6px 14px;
    font-size: 13px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .config_step_btn:hover {
    border-color: #D4C291;
    color: #ffffff;
    background: rgba(212, 194, 145, 0.15);
  }

  .config_step_btn.active {
    background: rgba(212, 194, 145, 0.35);
    border-color: #D4C291;
    color: #ffffff;
    box-shadow: 0 0 8px rgba(212, 194, 145, 0.3);
  }

  /* ミュート切り替えボタン */
  .config_mute_btn {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid #D4C291;
    color: #ffffff;
    padding: 6px 14px;
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

  /* スキップ切替ボタン共通 */
  .config_choice_btn {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(212, 194, 145, 0.4);
    color: #cccccc;
    padding: 6px 20px;
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
    background: rgba(212, 194, 145, 0.35);
    border-color: #D4C291;
    color: #ffffff;
    box-shadow: 0 0 8px rgba(212, 194, 145, 0.3);
  }

  /* 戻るボタン */
  .ed_back_btn {
    background: rgba(0, 0, 0, 0.5);
    border: 1px solid #D4C291;
    color: #ffffff;
    padding: 6px 35px;
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
  }
</style>
[endhtml]

; ============================================================
; JavaScript 制御処理（スマホ・ボタン式）
; ============================================================
[iscript]

// プレビュータイピング
function runConfigPreview(speed) {
    var text = "ボタンを押すとテキストの表示スピードを確認できます。";
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
    }, Math.max(1, Number(speed)));
}

// フラグ初期化
if (typeof tf.config_bgm_muted === 'undefined') tf.config_bgm_muted = false;
if (typeof tf.config_se_muted === 'undefined') tf.config_se_muted = false;
if (typeof tf.config_bgm_before_mute === 'undefined') tf.config_bgm_before_mute = 100;
if (typeof tf.config_se_before_mute === 'undefined') tf.config_se_before_mute = 100;

tf.current_bgm_vol = parseInt(TG.config.defaultBgmVolume);
tf.current_se_vol  = parseInt(TG.config.defaultSeVolume);
var rawChSpeed     = parseInt(TG.config.chSpeed); 
var rawAutoSpeed   = parseInt(TG.config.autoSpeed);

tf.text_skip = "reads";
if (TG.config.unReadTextSkip != "true") tf.text_skip = "all";

// ----------------------------------------------------
// UI更新関数
// ----------------------------------------------------
function updateBgmUI(vol) {
    $('.btn_bgm_vol').removeClass('active');
    // 最も近い段階ボタンをアクティブ化
    var closest = [0, 25, 50, 75, 100].reduce(function(prev, curr) {
        return (Math.abs(curr - vol) < Math.abs(prev - vol) ? curr : prev);
    });
    $('.btn_bgm_vol[data-vol="' + closest + '"]').addClass('active');

    if (tf.config_bgm_muted) {
        $('#btn_mute_bgm').text('🔇 OFF').addClass('muted');
    } else {
        $('#btn_mute_bgm').text('🔊 ON').removeClass('muted');
    }
}

function updateSeUI(vol) {
    $('.btn_se_vol').removeClass('active');
    var closest = [0, 25, 50, 75, 100].reduce(function(prev, curr) {
        return (Math.abs(curr - vol) < Math.abs(prev - vol) ? curr : prev);
    });
    $('.btn_se_vol[data-vol="' + closest + '"]').addClass('active');

    if (tf.config_se_muted) {
        $('#btn_mute_se').text('🔇 OFF').addClass('muted');
    } else {
        $('#btn_mute_se').text('🔊 ON').removeClass('muted');
    }
}

// ----------------------------------------------------
// 起動時の初期化描画
// ----------------------------------------------------
updateBgmUI(tf.current_bgm_vol);
updateSeUI(tf.current_se_vol);

// メッセージ速度表示復元
if (rawChSpeed > 50) {
    tf.current_ch_speed = 1;
} else if (rawChSpeed <= 5) {
    tf.current_ch_speed = 3;
} else {
    tf.current_ch_speed = 2;
}
$('.btn_ch_speed').removeClass('active');
$('.btn_ch_speed[data-speed="' + tf.current_ch_speed + '"]').addClass('active');

// オート速度表示復元
if (rawAutoSpeed > 3500) {
    tf.current_auto_speed = 1;
} else if (rawAutoSpeed > 1000) {
    tf.current_auto_speed = 2;
} else {
    tf.current_auto_speed = 3;
}
$('.btn_auto_speed').removeClass('active');
$('.btn_auto_speed[data-speed="' + tf.current_auto_speed + '"]').addClass('active');

// スキップボタン復元
$('.config_choice_btn').removeClass('active');
if (tf.text_skip === 'reads') {
    $('.button_skip_read').addClass('active');
    if (TYRANO && TYRANO.kag) TYRANO.kag.stat.skip_mode = "reads";
} else {
    $('.button_skip_all').addClass('active');
    if (TYRANO && TYRANO.kag) TYRANO.kag.stat.skip_mode = "all";
}

// ----------------------------------------------------
// 操作関数
// ----------------------------------------------------

// BGM音量変更 (5段階)
window.setBgmVolume = function(vol) {
    tf.current_bgm_vol = vol;
    if (vol === 0) {
        tf.config_bgm_muted = true;
    } else {
        tf.config_bgm_muted = false;
        tf.config_bgm_before_mute = vol;
    }
    updateBgmUI(vol);
    TYRANO.kag.ftag.startTag("bgmopt", { volume: vol });
    TYRANO.kag.saveSystemVariable();
};

// SE音量変更 (5段階)
window.setSeVolume = function(vol) {
    tf.current_se_vol = vol;
    if (vol === 0) {
        tf.config_se_muted = true;
    } else {
        tf.config_se_muted = false;
        tf.config_se_before_mute = vol;
    }
    updateSeUI(vol);
    TYRANO.kag.ftag.startTag("seopt", { volume: vol });
    TYRANO.kag.saveSystemVariable();
};

// ミュートボタン
window.toggleAudioMute = function(type) {
    if (type === 'bgm') {
        if (tf.config_bgm_muted) {
            tf.current_bgm_vol = tf.config_bgm_before_mute || 100;
            tf.config_bgm_muted = false;
        } else {
            tf.config_bgm_before_mute = tf.current_bgm_vol || 100;
            tf.current_bgm_vol = 0;
            tf.config_bgm_muted = true;
        }
        updateBgmUI(tf.current_bgm_vol);
        TYRANO.kag.ftag.startTag("bgmopt", { volume: tf.current_bgm_vol });

    } else if (type === 'se') {
        if (tf.config_se_muted) {
            tf.current_se_vol = tf.config_se_before_mute || 100;
            tf.config_se_muted = false;
        } else {
            tf.config_se_before_mute = tf.current_se_vol || 100;
            tf.current_se_vol = 0;
            tf.config_se_muted = true;
        }
        updateSeUI(tf.current_se_vol);
        TYRANO.kag.ftag.startTag("seopt", { volume: tf.current_se_vol });
    }
    TYRANO.kag.saveSystemVariable();
};

// テキスト速度 (1=遅い, 2=普通, 3=早い)
window.setChSpeed = function(val) {
    $('.btn_ch_speed').removeClass('active');
    $('.btn_ch_speed[data-speed="' + val + '"]').addClass('active');

    var msSpeed = 30;
    if (val === 1) msSpeed = 80;
    else if (val === 2) msSpeed = 30;
    else if (val === 3) msSpeed = 1;

    runConfigPreview(msSpeed);
    tf.current_ch_speed = val;
    TYRANO.kag.ftag.startTag("configdelay", { speed: msSpeed });
    TYRANO.kag.saveSystemVariable();
};

// オート速度 (1=遅い, 2=普通, 3=早い)
window.setAutoSpeed = function(val) {
    $('.btn_auto_speed').removeClass('active');
    $('.btn_auto_speed[data-speed="' + val + '"]').addClass('active');

    var autoIntervalTime = 2500;
    if (val === 1) autoIntervalTime = 4500;
    else if (val === 2) autoIntervalTime = 2500;
    else if (val === 3) autoIntervalTime = 100;

    tf.current_auto_speed = val;
    TYRANO.kag.ftag.startTag("autoconfig", { speed: autoIntervalTime });
    TYRANO.kag.saveSystemVariable();
};

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
; Config用のレイヤーのみ消去
[freeimage layer=1]
[awakegame]

[return]