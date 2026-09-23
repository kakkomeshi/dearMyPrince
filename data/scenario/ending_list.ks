[_tb_system_call storage=system/_ending_list.ks]

[cm]

; ============================================================
; 1. 全画面HTML/CSSコンテナの一括構築（ページ送りUI内包）
; ============================================================
[html]
<div class="my_content_wrap">
  <!-- 画面タイトル -->
  
  <div class="my_content_title_header">
    <div class="my_content_title">
      ENDING LIST
    </div>
  </div>

  <!-- リスト用パネル（座布団） -->
  <div id="ed_list_container" style="
    width: 800px;
    min-height: 460px;
    background-color: rgba(31, 35, 45, 0.90);
    border: 1.5px solid #D4C291;
    border-radius: 8px;
    padding: 30px 20px;
    box-sizing: border-box;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
    margin: 0 auto;
  ">
    <!-- JS(iscript) でここに現在のページのエンディング一覧が挿入されます -->
  </div>

  <!-- 下部操作エリア（ページ送り ＆ BACKボタン） -->
  <div class="pager_wrapper">

    <!-- ページ送りコントロール (◀  1/3  ▶) -->
    <div class="pager_area">
      <span class="arrow_left"  onclick="changeEdPage(-1)"></span>
      <span class="pager_num_display" >1 / 3</span>
      <span class="arrow_right"  onclick="changeEdPage(1)"></span>
    </div>

  </div>
  <!-- BACKボタン -->
  <div class="back_wrapper">
    <button class="back_btn" onclick="TYRANO.kag.ftag.startTag('jump', {target: '*back'});">
      BACK
    </button>
  </div>
</div>

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
var currentPage = currentPage || 1;
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

        htmlContent += `
            <div style="
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: rgba(255, 255, 255, 0.04);
                border-bottom: 1px solid rgba(212, 194, 145, 0.15);
                padding: 8px 15px;
                border-radius: 4px;
                font-size: 20px;
                height: 60px;
                box-sizing: border-box;
            ">
                <div style="display: flex; align-items: center; gap: 20px;">
                    <span style="color: ${numColor}; font-weight: bold; font-family: monospace; font-size: 20px;">${ed.id}</span>
                    <span style="color: ${titleColor}; letter-spacing: 1px;">${displayTitle}</span>
                </div>
                <span style="
                    color: ${statusColor};
                    font-weight: bold;
                    font-size: 20px;
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
    $('.pager_num_display').text(currentPage + ' / ' + totalPages);

};

// ページ切り替え関数
window.changeEdPage = function(dir) {
if (dir === 1) {
        // 次のページへ（最後のページなら 1 ページ目へループ）
        currentPage = (currentPage >= totalPages) ? 1 : currentPage + 1;
    } else if (dir === -1) {
        // 前のページへ（1 ページ目なら最後のページへループ）
        currentPage = (currentPage <= 1) ? totalPages : currentPage - 1;
    }
    renderEdPage(currentPage);
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