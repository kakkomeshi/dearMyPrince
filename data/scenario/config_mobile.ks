[_tb_system_call storage=system/_config_mobile.ks]

[cm  ]
[clearfix]

[hidemenubutton]

[tb_hide_message_window  ]

; ============================================================
; CONFIG画面全体のHTML / CSS 構築（スマホ最適化・ボタン式）
; ============================================================


[html]


<div id="config_screen_wrapper" style="[p]
position: absolute;[p]
top: 0;[p]
left: 0;[p]
width: 960px;[p]
height: 640px;[p]
background-color: rgba(15, 18, 25, 0.88);[p]
font-family: sans-serif;[p]
box-sizing: border-box;[p]
padding: 15px 40px;[p]
z-index: 9999;[p]
user-select: none;[p]
">[p]
<div style="clear: both;"></div>[p]
<!-- メインタイトル -->[p]
<div style="[p]
text-align: center;[p]
color: #ffffff;[p]
font-size: 24px;[p]
font-weight: bold;[p]
letter-spacing: 2px;[p]
margin-bottom: 8px;[p]
text-shadow: 0 2px 4px rgba(0,0,0,0.5);[p]
">[p]
CONFIG[p]
</div>[p]
<!-- コンフィグ全体を囲むメインパネル（座布団） -->[p]
<div class="area_config_box" style="[p]
width: 880px;[p]
height: 510px;[p]
margin: 0 auto;[p]
background-color: rgba(31, 35, 45, 0.90);[p]
border: 1.5px solid #D4C291;[p]
border-radius: 8px;[p]
padding: 15px 25px;[p]
box-sizing: border-box;[p]
box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);[p]
display: flex;[p]
flex-direction: column;[p]
justify-content: space-between;[p]
">[p]
<!-- 1. BGM音量 ＆ ミュート -->[p]
<div class="config_item_row">[p]
<span class="config_label">BGM 音量</span>[p]
<div class="config_control_area">[p]
<div class="step_btn_group">[p]
<button class="config_step_btn btn_bgm_vol" data-vol="0" onclick="setBgmVolume(0)">0%</button>[p]
<button class="config_step_btn btn_bgm_vol" data-vol="25" onclick="setBgmVolume(25)">25%</button>[p]
<button class="config_step_btn btn_bgm_vol" data-vol="50" onclick="setBgmVolume(50)">50%</button>[p]
<button class="config_step_btn btn_bgm_vol" data-vol="75" onclick="setBgmVolume(75)">75%</button>[p]
<button class="config_step_btn btn_bgm_vol" data-vol="100" onclick="setBgmVolume(100)">100%</button>[p]
</div>[p]
<button class="config_mute_btn" id="btn_mute_bgm" onclick="toggleAudioMute('bgm')">🔊 ON</button>[p]
</div>[p]
</div>[p]
<!-- 2. SE音量 ＆ ミュート -->[p]
<div class="config_item_row">[p]
<span class="config_label">効果音 (SE) 音量</span>[p]
<div class="config_control_area">[p]
<div class="step_btn_group">[p]
<button class="config_step_btn btn_se_vol" data-vol="0" onclick="setSeVolume(0)">0%</button>[p]
<button class="config_step_btn btn_se_vol" data-vol="25" onclick="setSeVolume(25)">25%</button>[p]
<button class="config_step_btn btn_se_vol" data-vol="50" onclick="setSeVolume(50)">50%</button>[p]
<button class="config_step_btn btn_se_vol" data-vol="75" onclick="setSeVolume(75)">75%</button>[p]
<button class="config_step_btn btn_se_vol" data-vol="100" onclick="setSeVolume(100)">100%</button>[p]
</div>[p]
<button class="config_mute_btn" id="btn_mute_se" onclick="toggleAudioMute('se')">🔊 ON</button>[p]
</div>[p]
</div>[p]
<!-- 3. テキスト表示速度 -->[p]
<div class="config_item_row">[p]
<span class="config_label">テキスト表示速度</span>[p]
<div class="config_control_area">[p]
<div class="step_btn_group">[p]
<button class="config_step_btn btn_ch_speed" data-speed="1" onclick="setChSpeed(1)">遅い</button>[p]
<button class="config_step_btn btn_ch_speed" data-speed="2" onclick="setChSpeed(2)">普通</button>[p]
<button class="config_step_btn btn_ch_speed" data-speed="3" onclick="setChSpeed(3)">早い</button>[p]
</div>[p]
</div>[p]
</div>[p]
<!-- 4. オートモードテキスト表示速度 -->[p]
<div class="config_item_row">[p]
<span class="config_label">オートモード速度</span>[p]
<div class="config_control_area">[p]
<div class="step_btn_group">[p]
<button class="config_step_btn btn_auto_speed" data-speed="1" onclick="setAutoSpeed(1)">遅い</button>[p]
<button class="config_step_btn btn_auto_speed" data-speed="2" onclick="setAutoSpeed(2)">普通</button>[p]
<button class="config_step_btn btn_auto_speed" data-speed="3" onclick="setAutoSpeed(3)">早い</button>[p]
</div>[p]
</div>[p]
</div>[p]
<!-- 5. スキップ設定 -->[p]
<div class="config_item_row">[p]
<span class="config_label">スキップ設定</span>[p]
<div class="config_control_area" style="gap: 15px; justify-content: flex-start;">[p]
<button class="config_choice_btn button_skip_read active" data-skip="reads" onclick="setSkipMode('reads')">既読のみ</button>[p]
<button class="config_choice_btn button_skip_all" data-skip="all" onclick="setSkipMode('all')">すべて</button>[p]
</div>[p]
</div>[p]
<!-- 6. テキスト表示速度確認欄 -->[p]
<div style="padding-top: 10px; display: flex; flex-direction: column; gap: 4px;">[p]
<span style="color: #D4C291; font-size: 12px; font-weight: bold;">【テキスト表示速度確認欄】</span>[p]
<div id="config_preview_text" style="[p]
background: rgba(0, 0, 0, 0.4);[p]
border: 1px solid rgba(212, 194, 145, 0.3);[p]
border-radius: 4px;[p]
padding: 6px 12px;[p]
color: #ffffff;[p]
font-size: 14px;[p]
height: 28px;[p]
line-height: 28px;[p]
overflow: hidden;[p]
white-space: nowrap;[p]
text-overflow: ellipsis;[p]
">ボタンを押すとテキストの表示スピードを確認できます。</div>[p]
</div>[p]
</div>[p]
<!-- BACKボタン -->[p]
<div style="padding-top: 12px; text-align: center;">[p]
<button class="ed_back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*backtitle'});">[p]
BACK[p]
</button>[p]
</div>[p]
</div>[p]
<!-- スタイル＆テーマカラー調整 -->[p]
<style>[p]
.config_item_row {[p]
display: flex;[p]
align-items: center;[p]
justify-content: space-between;[p]
border-bottom: 1px solid rgba(212, 194, 145, 0.15);[p]
padding: 10px 0;[p]
}[p]
.config_label {[p]
color: #ffffff;[p]
font-size: 14px;[p]
font-weight: bold;[p]
letter-spacing: 1px;[p]
width: 160px;[p]
}[p]
.config_control_area {[p]
display: flex;[p]
align-items: center;[p]
gap: 15px;[p]
flex: 1;[p]
justify-content: flex-start;[p]
}[p]
.step_btn_group {[p]
display: flex;[p]
gap: 8px;[p]
}[p]
/* スマホ向け5段階・3段階の押しやすいボタン */[p]
.config_step_btn {[p]
background: rgba(255, 255, 255, 0.05);[p]
border: 1px solid rgba(212, 194, 145, 0.3);[p]
color: #cccccc;[p]
padding: 6px 14px;[p]
font-size: 13px;[p]
font-weight: bold;[p]
border-radius: 4px;[p]
cursor: pointer;[p]
transition: all 0.2s ease;[p]
}[p]
.config_step_btn:hover {[p]
border-color: #D4C291;[p]
color: #ffffff;[p]
background: rgba(212, 194, 145, 0.15);[p]
}[p]
.config_step_btn.active {[p]
background: rgba(212, 194, 145, 0.35);[p]
border-color: #D4C291;[p]
color: #ffffff;[p]
box-shadow: 0 0 8px rgba(212, 194, 145, 0.3);[p]
}[p]
/* ミュート切り替えボタン */[p]
.config_mute_btn {[p]
background: rgba(255, 255, 255, 0.05);[p]
border: 1px solid #D4C291;[p]
color: #ffffff;[p]
padding: 6px 14px;[p]
font-size: 12px;[p]
font-weight: bold;[p]
border-radius: 4px;[p]
cursor: pointer;[p]
transition: all 0.2s ease;[p]
min-width: 75px;[p]
margin-left: auto;[p]
}[p]
.config_mute_btn.muted {[p]
background: rgba(229, 115, 115, 0.3);[p]
border-color: #E57373;[p]
color: #ffcccc;[p]
}[p]
/* スキップ切替ボタン共通 */[p]
.config_choice_btn {[p]
background: rgba(255, 255, 255, 0.05);[p]
border: 1px solid rgba(212, 194, 145, 0.4);[p]
color: #cccccc;[p]
padding: 6px 20px;[p]
font-size: 13px;[p]
font-weight: bold;[p]
border-radius: 4px;[p]
cursor: pointer;[p]
transition: all 0.2s ease;[p]
}[p]
.config_choice_btn:hover {[p]
border-color: #D4C291;[p]
color: #ffffff;[p]
background: rgba(212, 194, 145, 0.15);[p]
}[p]
.config_choice_btn.active {[p]
background: rgba(212, 194, 145, 0.35);[p]
border-color: #D4C291;[p]
color: #ffffff;[p]
box-shadow: 0 0 8px rgba(212, 194, 145, 0.3);[p]
}[p]
/* 戻るボタン */[p]
.ed_back_btn {[p]
background: rgba(0, 0, 0, 0.5);[p]
border: 1px solid #D4C291;[p]
color: #ffffff;[p]
padding: 6px 35px;[p]
font-size: 15px;[p]
font-weight: bold;[p]
border-radius: 4px;[p]
cursor: pointer;[p]
transition: all 0.2s ease;[p]
letter-spacing: 1px;[p]
}[p]
.ed_back_btn:hover {[p]
background: rgba(212, 194, 145, 0.3);[p]
border-color: #ffffff;[p]
}[p]
</style>[p]


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

[s  ]

;--------------------------------------------------------------------------------
; タイトルに戻る
;--------------------------------------------------------------------------------


*backtitle

[iscript]
tf.flag_back=$(".message1_fore").css("display");
[endscript]

[if exp="tf.flag_back=='none'"]

[cm  ]
[layopt layer=message1 visible=false]

[freeimage layer=1]

[clearfix]

[awakegame]

[endif]

[return  ]
