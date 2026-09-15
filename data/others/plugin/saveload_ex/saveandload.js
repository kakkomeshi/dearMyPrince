// save.html や load.html の末尾に記述
$(document).off("click.custom_pager", ".page[data-action]")
           .on("click.custom_pager", ".page[data-action]", function (e) {
    // プラグイン標準の .page イベントの発火を抑止
    e.stopImmediatePropagation();

    const j_save = $(this).closest(".layer_menu");
    const action = $(this).attr("data-action");
    const max_page = parseInt(TYRANO.kag.variable.sf._saveload.page || 3);
    // 現在画面に表示されている数字テキストから「今のページ(0スタート)」を正しく算出
    // （システム変数の参照ズレを防ぎ、現在の画面状態から確実に計算する）
    let current_display = parseInt(j_save.find(".custom_now_page").text()) || 1;
    let now_page = current_display - 1; // 1スタートを 0スタート(0, 1, 2...) に変換

    // 数値の再計算
    let target_page = now_page;
    if (action === "next") {
        target_page = (now_page + 1) % max_page;
    } else if (action === "prev") {
        target_page = (now_page - 1 + max_page) % max_page;
    }

    // 1. スロットの切り替え
    j_save.find(".save_list_item").hide();
    j_save.find(`.save_list_item[data-page="${target_page}"]`).show();

    // 2. 変数保存とテキスト更新
    TYRANO.kag.variable.sf._save_page = target_page;
    TYRANO.kag.saveSystemVariable();
    
    j_save.find(".custom_now_page").text(target_page + 1);
    j_save.find(".custom_max_page").text(max_page);

    // SE再生
    if (TYRANO.kag.variable.sf._saveload.page_se) {
        TYRANO.kag.ftag.startTag("playse", { storage: TYRANO.kag.variable.sf._saveload.page_se });
    }
});