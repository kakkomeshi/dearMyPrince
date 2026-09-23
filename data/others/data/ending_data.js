// data/others/js/ending_data.js

window.getEndingData = function () {
    // ティラノスクリプトのシステム変数(sf)を取得（安全ガード）
    var sf = (typeof TYRANO !== 'undefined' && TYRANO.kag && TYRANO.kag.variable)
        ? TYRANO.kag.variable.sf
        : (typeof sf !== 'undefined' ? sf : {});

    return [
        // --- 第一部 ---
        { id: "01", flag: sf.ed01_continue, title: "TRUE END 〜これからも君のコーチだ〜", type: "TRUE" },
        { id: "02", flag: sf.ed02_goodbye, title: "NORMAL END 〜またね、コーチ〜", type: "NORMAL" },
        { id: "03", flag: sf.ed03_change, title: "BITTER END 〜コーチ、チェンジで〜", type: "NORMAL" },
        { id: "04", flag: sf.ed04_endOfContract, title: "NORMAL END 〜契約終了〜", type: "NORMAL" },
        { id: "05", flag: sf.ed05_dependent, title: "SECRET END 〜二人だけの秘密〜", type: "SECRET" },

        // --- 第二部 ---
        { id: "06", flag: sf.ed06_part2_1, title: "PART 2 END 〜それぞれの道〜", type: "NORMAL" },
        { id: "07", flag: sf.ed07_part2_2, title: "PART 2 END 〜途切れた境界線〜", type: "NORMAL" },
        { id: "08", flag: sf.ed08_part2_3, title: "PART 2 TRUE 〜破滅への依存〜", type: "TRUE" },
        { id: "09", flag: sf.ed09_part2_4, title: "BAD END 〜孤立無援〜", type: "BAD" },
        { id: "10", flag: sf.ed10_part2_5, title: "BAD END 〜偽りの告白〜", type: "BAD" },

        // --- 第三部 ---
        { id: "11", flag: sf.ed11_part3_1, title: "ESCAPE END 〜果てなき逃避行〜", type: "NORMAL" },
        { id: "12", flag: sf.ed12_part3_2, title: "ESCAPE BAD 〜逮捕〜", type: "BAD" },
        { id: "13", flag: sf.ed13_part3_3, title: "ESCAPE BAD 〜静かな終幕〜", type: "BAD" },
        { id: "14", flag: sf.ed14_part3_4, title: "TRUE END 〜楽園の檻〜", type: "TRUE" },
        { id: "15", flag: sf.ed15_part3_5, title: "SECRET END 〜愛の逃亡者〜", type: "SECRET" },
        { id: "16", flag: sf.ed16_part3_6, title: "SPECIAL END 〜世界を敵に回して〜", type: "SECRET" }
    ];
};