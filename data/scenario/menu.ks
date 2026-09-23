[_tb_system_call storage=system/_menu.ks]

[cm]
[clearfix]
[hidemenubutton]
[tb_hide_message_window]

; ============================================================
; MENU画面 全画面HTML / CSS 構築
; ============================================================
[html]
<div class="my_content_wrap">

  <!-- ヘッダー（タイトル ＆ CLOSEボタン） -->
  <div class="my_content_title_header">
    <p class="my_content_title">MENU</p>

    <div class='close_menu_item'>
        <a href="javascript:void(0)" onclick="closeMenuScreen()">
            <img class="menu_close" src='data/image/close_icon.png' style="width: 50px; height: 50px; cursor: pointer; transition: transform 0.2s;" onmouseover="this.style.transform='scale(1.1)'" onmouseout="this.style.transform='scale(1.0)'">
        </a>
    </div>
  </div>

  <div style="clear:both"></div>

  <!-- メニュー全体を囲むメインパネル（座布団） -->
  <div class="my_content_body">
  
    <!-- メニュー項目ボタン群 -->
    <button class="menu_action_btn" onclick="menuAction('save')">SAVE</button>
    <button class="menu_action_btn" onclick="menuAction('load')">LOAD</button>
    <button class="menu_action_btn" onclick="menuAction('config')">CONFIG</button>
    <button class="menu_action_btn" onclick="menuAction('title')">タイトルに戻る</button>
    <button class="menu_action_btn back_game" onclick="closeMenuScreen()">ゲームに戻る</button>

  </div>

</div>

<!-- スタイル定義 -->
<style>
  .menu_action_btn {
    width: 360px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(212, 194, 145, 0.4);
    color: #ffffff;
    padding: 14px 0;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
    letter-spacing: 2px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0,0,0,0.3);
  }

  .menu_action_btn:hover {
    background: rgba(212, 194, 145, 0.25);
    border-color: #f4e2c1;
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(212, 194, 145, 0.3);
  }

  /* ゲームに戻るボタンなどの微調整 */
  .menu_action_btn.back_game {
    border-color: rgba(255, 255, 255, 0.3);
    color: #cccccc;
  }
  .menu_action_btn.back_game:hover {
    background: rgba(255, 255, 255, 0.15);
    border-color: #ffffff;
    color: #ffffff;
  }
</style>
[endhtml]

; ============================================================
; 各種メニュー機能への連動制御 JavaScript
; ============================================================
[iscript]
window.menuAction = function(actionType) {
    // $('#menu_screen_wrapper').remove();
    
    if (actionType === 'save') {
        $('#menu_screen_wrapper').remove();
        TYRANO.kag.ftag.startTag("awakegame", {});
        setTimeout(function() {
            TYRANO.kag.ftag.startTag("showsave", {}, function() {
                // CLOSE後のnextOrderを1回だけ止める
                TYRANO.kag.tmp.cut_nextorder = null;
            });
        }, 50);
    } else if (actionType === 'load') {
        $('#menu_screen_wrapper').remove();
        TYRANO.kag.ftag.startTag("awakegame", {});
        setTimeout(function() {
            TYRANO.kag.ftag.startTag("showload", {}) }, 50);
    } else if (actionType === 'config') {
      var isSmartphone = /iPhone|Android.+Mobile|iPad|Android/i.test(navigator.userAgent);
      // 2. 画面の横幅（例: 768px以下）で判定する方法（タブレットやウィンドウサイズ変更にも対応）
      var isMobileWidth = window.innerWidth <= 768;

      if (isSmartphone || isMobileWidth) {
        // スマホ・タブレットの場合の処理
          TYRANO.kag.ftag.startTag("jump", { storage: "config_mobile.ks" });
      } else {
        // PCの場合の処理
          TYRANO.kag.ftag.startTag("jump", { storage: "config.ks" });
      }
    } else if (actionType === 'title') {
      // 1. ダイアログ用のテキストと、「はい」を選んだ時のジャンプ先を指定
      TYRANO.kag.stat.f.dialog_text = "タイトル画面に戻ります。よろしいですか？\n（保存していないデータは消去されます）";
      TYRANO.kag.stat.f.dialog_target_storage = "title_screen.ks";
      TYRANO.kag.stat.f.dialog_target_label = "*title";

      // 2. sleepgame で自作ダイアログを呼び出す
      TYRANO.kag.ftag.startTag("jump", { storage: 'dialog.ks' });
    }
};

[endscript]

[s]
