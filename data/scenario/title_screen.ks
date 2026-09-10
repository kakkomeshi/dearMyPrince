[_tb_system_call storage=system/_title_screen.ks]

[tb_start_tyrano_code]
[loadcss file="./data/others/css/custom.css"]
[_tb_end_tyrano_code]

;==============================
; 初期化・演出準備
;==============================
[debug_hide]
[hidemenubutton]
[tb_clear_images]
[tb_keyconfig flag="0"]
[tb_hide_message_window]

; 背景画像の指定（新背景画像）
[bg storage="tennis_school_sunset.png" time="1000" method="crossfade"]

*title

; ★暗転（mask）をここで解除してタイトル画面をフェードイン表示させる
[mask_off time="1000"]

; ★暗転（mask）をここで解除してタイトル画面をフェードイン表示させる
[mask_off time="1000"]

;==============================
; 全UIを一括構築するHTML / CSS
;==============================
[html]
<!-- <div id="title_screen_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  background-color: rgba(15, 18, 25, 0.45); /* 背景画像を活かす薄めの暗転座布団 */
  font-family: sans-serif;
  box-sizing: border-box;
  padding: 40px;
  z-index: 9999;
  user-select: none;
"> -->
<div id="title_screen_wrapper" style="
  position: absolute;
  top: 0;
  left: 0;
  width: 960px;
  height: 640px;
  /* 右（0%）から中央・左（70%）まで暗い範囲を広げたグラデーション */
  background: linear-gradient(to left, rgba(15, 18, 25, 1) 40%, rgba(15, 18, 25, 0.85) 60%, rgba(15, 18, 25, 0.2) 90%, rgba(15, 18, 25, 0) 100%);
  font-family: sans-serif;
  box-sizing: border-box;
  z-index: 9999;
  user-select: none;
">
  <!-- 右側配置のメインボタンメニューコンテナ -->
  <div style="
    position: absolute;
    top: 260px;
    right: 60px;
    width: 380px;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 25px 30px;
    box-sizing: border-box;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.7);
    display: flex;
    flex-direction: column;
    gap: 12px;
  ">

    <!-- はじめから -->
    <button class="title_menu_btn" onclick="titleJump('*start');">
      はじめから
    </button>

    <!-- つづきから -->
    <button class="title_menu_btn" onclick="titleJump('*load');">
      つづきから
    </button>

    <!-- エンディングリスト -->
    <button class="title_menu_btn" onclick="titleJump('*ending_list');">
      エンディングリスト
    </button>

    <!-- コンフィグ -->
    <button class="title_menu_btn" onclick="titleJump('*config');">
      コンフィグ
    </button>

    <!-- 日付ジャンプ（デバッグモード） -->
    <button class="title_menu_btn debug" onclick="titleJump('*date_jump');">
      日付ジャンプ（デバッグモード）
    </button>

  </div>

</div>

<style>
/* タイトルボタン共通スタイリング */
.title_menu_btn {
  background: rgba(255, 255, 255, 0.06);
  border: 1px solid rgba(212, 194, 145, 0.4);
  color: #ffffff;
  padding: 12px 0;
  font-size: 16px;
  font-weight: bold;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.2s ease;
  letter-spacing: 1.5px;
  width: 100%;
}

.title_menu_btn:hover {
  background: rgba(212, 194, 145, 0.3);
  border-color: #D4C291;
  color: #ffffff;
  transform: translateY(-2px);
  box-shadow: 0 2px 8px rgba(212, 194, 145, 0.2);
}

/* デバッグ用ボタンの差し色 */
.title_menu_btn.debug {
  border-color: rgba(100, 181, 246, 0.4);
  color: #b3e5fc;
}

.title_menu_btn.debug:hover {
  background: rgba(100, 181, 246, 0.25);
  border-color: #64B5F6;
  color: #ffffff;
}
</style>
[endhtml]

;==============================
; 制御用JavaScript
;==============================
[iscript]
// タイトル画面コンテナの削除関数
window.clearTitleScreen = function() {
    $('#title_screen_wrapper').remove();
};

// 安全ジャンプ処理関数
window.titleJump = function(targetLabel) {
    if (document.activeElement) {
        document.activeElement.blur();
    }
    
    // アクション発生時にコンテナ消去
    clearTitleScreen();

    TYRANO.kag.ftag.startTag('jump', {
        target: targetLabel
    });
};
[endscript]

[s]

;==============================
; ボタン分岐処理部
;==============================

;------- はじめから
*start
[cm]
[showmenubutton]

; NEW GAME用の初期化処理
[call storage="new_game_init.ks" target="*new_game"]
[tb_keyconfig flag="1"]
[jump storage="scene1.ks" target=""]
[s]

;------- つづきから
*load
[cm]
[showload]
[jump storage="" target="*title"]
[s]

;------- エンディングリスト
*ending_list
[cm]
[jump storage="ending_list.ks" target=""]
[s]

;------- コンフィグ
*config
[cm]
[jump storage="config.ks" target=""]
[s]

;------- 日付ジャンプ（デバッグモード）
*date_jump
[cm]
[jump storage="date_jump.ks" target=""]
[s]