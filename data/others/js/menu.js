var menuObj = {
    config:function(){
       $(".menubd").addClass("close");
       let menul=$(".layer.layer_menu");
       $(menul).fadeOut(300, (()=>{
         $(".display_menu.menu").removeClass("menu");
         $(menul).empty();
       }));
    },
    backtitle: function(){
        if (tyrano.plugin.kag.tmp.sleep_game != null) {
            return false;
        }
        tyrano.plugin.kag.ftag.startTag("sleepgame",{storage:"config.ks",next:false});
        tyrano.plugin.kag.ftag.startTag("playse",{storage:"selb_resbtn22.ogg"});
       let menul=$(".layer.layer_menu");
       $(menul).fadeOut(200, (()=>{
         $(".display_menu.menu").removeClass("menu");
         $(menul).empty();
       }));
     }
};


$("#menu_screen_wrapper .menu_action_btn").each((i, elm) => {
    const j_elm = $(elm);
    j_elm.click(function(e){
      $(this).hasClass("my_menu_config")==true?lldmyobj.config():"";
      $(this).hasClass("my_menu_back_title")==true?lldmyobj.backtitle():"";
      e.stopPropagation();
    }).focusable();
  });