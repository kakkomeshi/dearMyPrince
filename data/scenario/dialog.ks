
;============================================================
; 統一デザインダイアログ画面 (dialog.ks)
;============================================================

; 画面上の固定レイヤーをクリア
[freeimage layer="1"]

; 全画面暗転モーダル ＆ ダイアログHTMLの一括構築
[html ]
<div id="custom_dialog_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  background-color: rgba(15, 18, 25, 0.75);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  user-select: none;
  font-family: sans-serif;
">
  <!-- ダイアログパネル（ENDING LISTと同背景＆ゴールド枠） -->
  <div style="
    width: 520px;
    background-color: rgba(31, 35, 45, 0.96);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 30px 40px;
    box-sizing: border-box;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.7);
    text-align: center;
  ">
    <!-- ダイアログヘッダー -->
    <div style="
      color: #D4C291;
      font-size: 14px;
      font-weight: bold;
      letter-spacing: 3px;
      margin-bottom: 20px;
      border-bottom: 1px solid rgba(212, 194, 145, 0.2);
      padding-bottom: 8px;
    ">
      CONFIRMATION
    </div>

    <!-- メッセージ本文 (f.dialog_text を挿入) -->
    <div id="dialog_text_area" style="
      color: #FFFFFF;
      font-size: 18px;
      line-height: 1.6;
      margin-bottom: 30px;
      letter-spacing: 1px;
      word-break: break-all;
    "></div>

    <!-- ボタンエリア -->
    <div style="
      display: flex;
      justify-content: center;
      gap: 20px;
    ">
      <!-- 「はい」ボタン -->
      <button class="dialog_btn dialog_yes" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*on_yes'});">
        は い
      </button>

      <!-- 「いいえ」ボタン -->
      <button class="dialog_btn dialog_no" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*on_no'});">
        いいえ
      </button>
    </div>
  </div>
</div>

<style>
/* ============================================================
   統一ダイアログ用ボタン CSS
   ============================================================ */
.dialog_btn {
    width: 150px;
    height: 44px;
    border-radius: 4px;
    font-size: 15px;
    font-weight: bold;
    letter-spacing: 2px;
    cursor: pointer;
    transition: all 0.2s ease;
    box-sizing: border-box;
}

/* 「はい」ボタン (ゴールド基調) */
.dialog_yes {
    background-color: rgba(212, 194, 145, 0.15);
    border: 1.5px solid #D4C291;
    color: #D4C291;
}
.dialog_yes:hover {
    background-color: #D4C291;
    color: #1F232D;
    box-shadow: 0 0 12px rgba(212, 194, 145, 0.5);
}

/* 「いいえ」ボタン (落ち着いたダークスレート基調) */
.dialog_no {
    background-color: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.2);
    color: #888888;
}
.dialog_no:hover {
    background-color: rgba(255, 255, 255, 0.15);
    border-color: rgba(255, 255, 255, 0.5);
    color: #FFFFFF;
}
</style>
[endhtml]

; JavaScriptでテキストの動的セット
[iscript]
$('#dialog_text_area').text(f.dialog_text || '実行しますか？');
[endscript]

[s]

;; ============================================================
; イベント処理（HTML要素の削除はjQueryで確実に行う）
; ============================================================
; ============================================================
; 「はい」が選ばれた場合（直接ジャンプ）
; ============================================================
*on_yes
[iscript]
// 1. ダイアログとメニューのHTML要素を削除
$('#custom_dialog_wrapper').remove();
$('#menu_screen_wrapper').remove();

// 2. sleepgame のゲーム復元用データを破棄
TYRANO.kag.ftag.startTag('breakgame', {});

// 3. メッセージ枠やレイヤー、固定ボタンをリセット
TYRANO.kag.ftag.startTag('freeimage', { layer: "1" });
TYRANO.kag.ftag.startTag('cm', {});
TYRANO.kag.ftag.startTag('layopt', { layer: "message1", visible: "false" });
TYRANO.kag.ftag.startTag('clearfix', {});

// 4. 指定されたジャンプ先へ移動
TYRANO.kag.ftag.startTag("jump", {
    storage: f.dialog_target_storage,
    target: f.dialog_target_label
});
[endscript]
[s]

; ============================================================
; 「いいえ」が選ばれた場合（キャンセル・画面復帰）
; ============================================================
*on_no
[iscript]
// ダイアログHTMLだけを消去
$('#custom_dialog_wrapper').remove();
[endscript]

; キャンセルの時だけ awakegame で元のメニュー画面へ復帰
[awakegame]
