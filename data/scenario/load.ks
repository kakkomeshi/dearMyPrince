[_tb_system_call storage=system/_load.ks]

[cm  ]

; ============================================================
; 1. 全画面HTML/CSSコンテナの一括構築（ロード画面）
; ============================================================


[html]
  <div id="load_screen_wrapper"
    style="
      position: absolute;
      top: 0;
      left: 0;
      width: 960px;
      height: 640px;
      background-color: rgba(15, 18, 25, 0.88);
      font-family: sans-serif;
      box-sizing: border-box;
      padding: 25px 80px;
      z-index: 9999;
      user-select: none;
    "
  >
    <!-- 画面タイトル -->
    <div style="
        text-align: center;
        color: #ffffff;
        font-size: 26px;
        font-weight: bold;
        letter-spacing: 2px;
        margin-bottom: 15px;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
      "
    >
      LOAD DATA
    </div>
    <!-- ロードスロット表示パネル -->
    <div id="load_slot_container"
      style="
        width: 800px;
        height: 380px;
        background-color: rgba(31, 35, 45, 0.9);
        border: 1.5px solid #d4c291;
        border-radius: 8px;
        padding: 15px;
        box-sizing: border-box;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
      "
    >
      <!-- JS(iscript) でここにスロット一覧が挿入されます -->
    </div>
    <!-- 下部操作エリア（ページ送り ＆ CLOSEボタン） -->
    <div style="
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 800px;
        margin: 15px auto 0 auto;
      "
    >
      <div style="width: 120px"></div>
      <!-- ページ送りコントロール (◀  1/3  ▶) -->
      <div style="
          display: flex;
          align-items: center;
          gap: 15px;
          background: rgba(31, 35, 45, 0.85);
          border: 1px solid #d4c291;
          padding: 4px 18px;
          border-radius: 20px;
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4);
        "
      >
        <button class="page_nav_btn" onclick="changeLoadPage(-1)">◀</button>
        <span id="load_page_num"
          style="
            color: #ffffff;
            font-weight: bold;
            font-size: 15px;
            min-width: 50px;
            text-align: center;
          "
          >1 / 3</span
        >
        <button class="page_nav_btn" onclick="changeLoadPage(1)">▶</button>
      </div>
      <!-- CLOSEボタン -->
      <div style="width: 120px; text-align: right">
        <button class="load_back_btn" onclick="closeLoadScreen();">CLOSE</button>
      </div>
    </div>
  </div>
  <style>
    /* ページ送りボタン */
    .page_nav_btn {
      background: transparent;
      border: none;
      color: #d4c291;
      font-size: 16px;
      cursor: pointer;
      padding: 2px 8px;
      transition: all 0.2s ease;
      outline: none;
    }
    .page_nav_btn:hover {
      color: #ffffff;
      transform: scale(1.25);
    }
    .page_nav_btn:disabled {
      color: #444444;
      cursor: default;
      transform: none;
    }
    /* 閉じるボタン */
    .load_back_btn {
      background: rgba(0, 0, 0, 0.5);
      border: 1px solid #d4c291;
      color: #ffffff;
      padding: 6px 30px;
      font-size: 15px;
      font-weight: bold;
      border-radius: 4px;
      cursor: pointer;
      transition: all 0.2s ease;
      letter-spacing: 1px;
    }
    .load_back_btn:hover {
      background: rgba(212, 194, 145, 0.3);
      border-color: #ffffff;
      transform: translateY(-2px);
    }
    /* セーブ/ロードスロット用スタイリング */
    .load_slot_card {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: rgba(255, 255, 255, 0.04);
      border: 1px solid rgba(212, 194, 145, 0.2);
      border-radius: 5px;
      padding: 10px 15px;
      height: 105px;
      box-sizing: border-box;
      cursor: pointer;
      transition: all 0.2s ease;
    }
    .load_slot_card.has_data:hover {
      background-color: rgba(212, 194, 145, 0.15);
      border-color: #d4c291;
      transform: translateY(-2px);
    }
    .load_slot_card.no_data {
      cursor: default;
      opacity: 0.6;
    }
  </style>
[endhtml]


; ============================================================
; 2. ロードスロット描画 ＆ ロード実行JS
; ============================================================


[iscript]
  var totalSlots = 18; // 全セーブスロット数
  var itemsPerPage = 6; // 1ページあたり6件（2列×3行）
  var currentPage = 1;
  var totalPages = Math.ceil(totalSlots / itemsPerPage);
  // ロード画面の閉じる処理
  window.closeLoadScreen = function () {
    $("#load_screen_wrapper").remove();
    TYRANO.kag.ftag.startTag("sleepgame", {}); // ゲーム復帰または画面消去
  };
  // 指定スロットからのロード実行処理
window.doLoadData = function(slotNum) {
    var slotIndex = slotNum - 1; // 0スタート
    var saveDataObj = TYRANO.kag.menu.getSaveData();

    // 該当スロットにデータが存在するかチェック
    if (!saveDataObj || !saveDataObj.data || !saveDataObj.data[slotIndex]) {
        alert("セーブデータがありません。");
        return;
    }

    if (confirm("スロット " + slotNum + " のデータをロードしますか？")) {
        // 連打防止（クリック無効化）
        $(".layer_menu").css("pointer-events", "none");

        // ⭕️ 正しいティラノ標準ロード処理
        // 第1引数: スロットインデックス（0スタート）
        // 第2引数: 自動ロード用フラグ（通常セーブは false でOK）
        TYRANO.kag.menu.loadGame(slotIndex, false);
    }
};
  // スロット一覧の描画関数
  window.renderLoadPage = function (page) {
    var startIndex = (page - 1) * itemsPerPage;
    var htmlContent =
      '<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px;">';

    var saveObjAll = TYRANO.kag.menu.getSaveData();
    var saveList = saveObjAll.data;

    for (var i = 0; i < itemsPerPage; i++) {
      var slotIndex = startIndex + i; // 配列は0から始まるインデックス
      var slotNum = slotIndex + 1; // 画面表示用のスロット番号（1〜）
      // 配列から該当スロットのデータを安全に取得
      var data = saveList[slotIndex];
      if (data && data !== "null") {
        var saveDate = data.save_date;
        var saveText = data.title || "No Title";
            htmlContent += `
            <div class="load_slot_card has_data" onclick="doLoadData(${slotNum})">
              <div style="display: flex; flex-direction: column; justify-direction: space-between; height: 100%; width: 100%;">
                <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid rgba(212, 194, 145, 0.2); padding-bottom: 4px;">
                  <span style="color: #D4C291; font-weight: bold; font-size: 15px;">SLOT ${slotNum}</span>
                  <span style="color: #888888; font-size: 12px;">${saveDate}</span>
                </div>
                <div style="color: #ffffff; font-size: 13px; line-height: 1.4; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
                  ${saveText}
                </div>
              </div>
            </div>
          `;
      } else {
        // 空スロット表示（ロード不可）
        htmlContent += `
          <div class="load_slot_card no_data" style="border-style: dashed; border-color: rgba(212, 194, 145, 0.2);">
           <div style="display: flex; align-items: center; justify-content: center; width: 100%; height: 100%; color: #666666; font-size: 14px; font-weight: bold;">
             SLOT ${slotNum} : NO DATA
           </div>
          </div>
        `;
      }
    }
    htmlContent += "</div>";
    // 生成結果をコンテナにセット
    $("#load_slot_container").html(htmlContent);
    $("#load_page_num").text(page + " / " + totalPages);
    // 矢印ボタン制御
    $(".page_nav_btn")
      .eq(0)
      .prop("disabled", page === 1);
    $(".page_nav_btn")
      .eq(1)
      .prop("disabled", page === totalPages);
  };
  // ページ切り替え関数
  window.changeLoadPage = function (dir) {
    if (dir === -1 && currentPage > 1) {
      currentPage--;
      renderLoadPage(currentPage);
    } else if (dir === 1 && currentPage < totalPages) {
      currentPage++;
      renderLoadPage(currentPage);
    }
  };
  // 初回描画
  renderLoadPage(currentPage);
[endscript]

[s  ]
