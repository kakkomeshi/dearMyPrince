[_tb_system_call storage=system/_ending_list.ks]

[cm]

; ============================================================
; 1. 全画面HTML/CSSコンテナの一括構築（ページ送りUI内包）
; ============================================================
[html]
<div id="ed_list_wrapper" style="
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
">
  <!-- 画面タイトル -->
  <div style="
    text-align: center;
    color: #ffffff;
    font-size: 26px;
    font-weight: bold;
    letter-spacing: 2px;
    margin-bottom: 15px;
    text-shadow: 0 2px 4px rgba(0,0,0,0.5);
  ">
    ENDING LIST
  </div>

  <!-- リスト用パネル（座布団） -->
  <div id="ed_list_container" style="
    width: 800px;
    height: 380px;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 15px 20px;
    box-sizing: border-box;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
  ">
    <!-- JS(iscript) でここに現在のページのエンディング一覧が挿入されます -->
  </div>

  <!-- 下部操作エリア（ページ送り ＆ BACKボタン） -->
  <div style="
    display: flex;
    justify-content: center;
    align-items: center;
    width: 800px;
    margin: 15px auto 0 auto;
  ">
    <!-- 左側ダミー要素（ページ送りUIを中央に寄せるためのレイアウト調整用） -->
    <!-- <div style="width: 120px;"></div> -->

    <!-- ページ送りコントロール (◀  1/3  ▶) -->
    <div style="
      display: flex;
      align-items: center;
      gap: 15px;
      background: rgba(31, 35, 45, 0.85);
      border: 1px solid #D4C291;
      padding: 4px 18px;
      border-radius: 20px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.4);
    ">
      <button class="page_nav_btn" onclick="changeEdPage(-1)">◀</button>
      <span id="ed_page_num" style="color: #ffffff; font-weight: bold; font-size: 15px; min-width: 50px; text-align: center;">1 / 3</span>
      <button class="page_nav_btn" onclick="changeEdPage(1)">▶</button>
    </div>

  </div>
  <!-- BACKボタン -->
  <div style="padding-top:20px; text-align: center;">
    <button class="ed_back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*back'});">
      BACK
    </button>
  </div>
</div>

<style>
/* ページ送り矢印ボタン */
.page_nav_btn {
  background: transparent;
  border: none;
  color: #D4C291;
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
  transform: translateY(-2px);
}
</style>
[endhtml]

; ============================================================
; 2. システムフラグ(sf.)判定 ＆ ページネーション制御JS
; ============================================================
[iscript]
// 16個（＋α）の全エンディングデータ定義
var edData = [
    // --- 第一部 ---
    { id: "01", flag: sf.ed01_continue,       title: "TRUE END 〜これからも君のコーチだ〜", type: "TRUE" },
    { id: "02", flag: sf.ed02_goodbye,        title: "NORMAL END 〜またね、コーチ〜",      type: "NORMAL" },
    { id: "03", flag: sf.ed03_change,         title: "BITTER END 〜コーチ、チェンジで〜",   type: "NORMAL" },
    { id: "04", flag: sf.ed04_endOfContract,  title: "NORMAL END 〜契約終了〜",           type: "NORMAL" },
    { id: "05", flag: sf.ed05_dependent,      title: "SECRET END 〜二人だけの秘密〜",      type: "SECRET" },
    
    // --- 第二部 ---
    { id: "06", flag: sf.ed06_part2_1,        title: "PART 2 END 〜それぞれの道〜",         type: "NORMAL" },
    { id: "07", flag: sf.ed07_part2_2,        title: "PART 2 END 〜途切れた境界線〜",       type: "NORMAL" },
    { id: "08", flag: sf.ed08_part2_3,        title: "PART 2 TRUE 〜破滅への依存〜",        type: "TRUE" },
    { id: "09", flag: sf.ed09_part2_4,        title: "BAD END 〜孤立無援〜",               type: "BAD" },
    { id: "10", flag: sf.ed10_part2_5,        title: "BAD END 〜偽りの告白〜",             type: "BAD" },

    // --- 第三部 ---
    { id: "11", flag: sf.ed11_part3_1,        title: "ESCAPE END 〜果てなき逃避行〜",       type: "NORMAL" },
    { id: "12", flag: sf.ed12_part3_2,        title: "ESCAPE BAD 〜逮捕〜",                type: "BAD" },
    { id: "13", flag: sf.ed13_part3_3,        title: "ESCAPE BAD 〜静かな終幕〜",           type: "BAD" },
    { id: "14", flag: sf.ed14_part3_4,        title: "TRUE END 〜楽園の檻〜",               type: "TRUE" },
    { id: "15", flag: sf.ed15_part3_5,        title: "SECRET END 〜愛の逃亡者〜",           type: "SECRET" },
    { id: "16", flag: sf.ed16_part3_6,        title: "SPECIAL END 〜世界を敵に回して〜",    type: "SECRET" }
];

// ページ管理用の設定
var itemsPerPage = 6; // 1ページあたり6件表示
var currentPage = 1;
var totalPages = Math.ceil(edData.length / itemsPerPage);

// 現在ページのリストを描画する関数
window.renderEdPage = function(page) {
    var startIndex = (page - 1) * itemsPerPage;
    var endIndex = Math.min(startIndex + itemsPerPage, edData.length);
    var pageItems = edData.slice(startIndex, endIndex);

    var htmlContent = '<div style="display: flex; flex-direction: column; gap: 8px;">';

    for (var i = 0; i < pageItems.length; i++) {
        var ed = pageItems[i];
        var isUnlocked = (ed.flag === true);

        var displayTitle = isUnlocked ? ed.title : "？？？？？？？？？？？？？？";
        var displayStatus = isUnlocked ? "CLEAR" : "未解放";
        
        var numColor = isUnlocked ? "#D4C291" : "#666666";
        var titleColor = isUnlocked ? "#FFFFFF" : "#888888";
        var statusColor = isUnlocked ? "#81C784" : "#555555";

        // if (isUnlocked && ed.type === "SECRET") statusColor = "#E57373";
        // if (isUnlocked && ed.type === "TRUE") statusColor = "#64B5F6";
        // if (isUnlocked && ed.type === "BAD") statusColor = "#BA68C8";

        htmlContent += `
            <div style="
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: rgba(255, 255, 255, 0.04);
                border-bottom: 1px solid rgba(212, 194, 145, 0.15);
                padding: 8px 15px;
                border-radius: 4px;
                font-size: 15px;
                height: 48px;
                box-sizing: border-box;
            ">
                <div style="display: flex; align-items: center; gap: 20px;">
                    <span style="color: ${numColor}; font-weight: bold; font-family: monospace; font-size: 17px;">${ed.id}</span>
                    <span style="color: ${titleColor}; letter-spacing: 1px;">${displayTitle}</span>
                </div>
                <span style="
                    color: ${statusColor};
                    font-weight: bold;
                    font-size: 13px;
                    padding: 3px 12px;
                    background-color: rgba(0, 0, 0, 0.4);
                    border-radius: 3px;
                    min-width: 65px;
                    text-align: center;
                ">${displayStatus}</span>
            </div>
        `;
    }

    htmlContent += '</div>';

    // 生成したリストをパネルへ流し込み
    $('#ed_list_container').html(htmlContent);
    
    // ページ番号の更新 (例: 1 / 3)
    $('#ed_page_num').text(page + ' / ' + totalPages);

    // 端のページでの矢印ボタンの有効化/無効化制御
    $('.page_nav_btn').eq(0).prop('disabled', page === 1);
    $('.page_nav_btn').eq(1).prop('disabled', page === totalPages);
};

// ページ切り替え関数
window.changeEdPage = function(dir) {
    if (dir === -1 && currentPage > 1) {
        currentPage--;
        renderEdPage(currentPage);
    } else if (dir === 1 && currentPage < totalPages) {
        currentPage++;
        renderEdPage(currentPage);
    }
};

// 初回レンダリング実行
renderEdPage(currentPage);
[endscript]

[s]

*back
[cm]
[iscript]
// 画面退出時にコンテナをまるごと破棄
$('#ed_list_wrapper').remove();
[endscript]
[jump storage="title_screen.ks" target="*title"]
[s]