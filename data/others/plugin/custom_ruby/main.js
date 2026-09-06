(function() {
	const custom_ruby = {

		scale      : TYRANO.kag.stat.mp.scale      || "0.5",
		x          : TYRANO.kag.stat.mp.x          || "0",
		y          : TYRANO.kag.stat.mp.y          || "0",
		spacing    : TYRANO.kag.stat.mp.spacing    || TYRANO.kag.config.defaultPitch,
		color      : TYRANO.kag.stat.mp.color      || "",
		background : TYRANO.kag.stat.mp.background || "",
		bold       : TYRANO.kag.stat.mp.bold       || "",
		italic     : TYRANO.kag.stat.mp.italic     || "",
		face       : TYRANO.kag.stat.mp.face       || "",
		reverse    : TYRANO.kag.stat.mp.reverse    || "false"

	}
	if (TYRANO.kag.stat.mp.spacing === 0) {
		custom_ruby.spacing = 0;
	}


	TYRANO.kag.tag.ruby.start = function(pm) {
		let ruby_scale = pm.scale === undefined ? custom_ruby.scale : pm.scale;
		let ruby_x = pm.x === undefined ? custom_ruby.x : pm.x;
		let ruby_y = pm.y === undefined ? custom_ruby.y : pm.y;
		let ruby_spacing = pm.spacing === undefined ? custom_ruby.spacing : pm.spacing;
		let ruby_color = pm.color === undefined ? custom_ruby.color : pm.color;
		let ruby_background = pm.background === undefined ? custom_ruby.background : pm.background;
		let ruby_bold = pm.bold === undefined ? custom_ruby.bold : pm.bold;
		let ruby_italic = pm.italic === undefined ? custom_ruby.italic : pm.italic;
		let ruby_face = pm.face === undefined ? custom_ruby.face : pm.face;
		let ruby_reverse = pm.reverse === undefined ? custom_ruby.reverse : pm.reverse;

		let text = String(pm.text);
		if ( text.length >= 1 ) {
		
			let start = (text.length / 2 * -1) - 1;
			let end = text.length / 2 * -1;
			let defaultPitch = this.kag.config.defaultPitch;
			let isVertical = String(this.kag.stat.vertical);

			//字間設定されていた場合
			let spacing = 0;
			if ( parseFloat(ruby_spacing) != 0 ){
				spacing = (text.length - 1) * ruby_spacing / 2;
				text = text.slice( 0, -1 ) + "<ruby style='letter-spacing: 0px;'>" + text.slice( -1 ) + "</ruby>"
				start = "calc(" + start + "em - " + spacing + "px)";
				end = "calc(" + end + "em - " + spacing + "px)";
			} else {
				start = start + "em";
				end = end + "em";
			}
			
			let str = "";

			if ( isVertical != "true" ) {
				//字間設定があった場合は補正する
				ruby_x = parseFloat(parseFloat(ruby_x) - parseFloat(defaultPitch));
				
				str = "</rt></ruby><ruby style='position: relative;'><ruby class='custom_ruby' style='position: absolute; transform: translate(" + ruby_x + "px," + ruby_y + "px) scale(" + ruby_scale + "); left:" + start + "; right:" + end + ";";
			} else {
				//縦書き時
				ruby_y = parseFloat(parseFloat(ruby_y) - parseFloat(defaultPitch));
				str = "</rt></ruby><ruby style='position: relative ; writing-mode: vertical-lr; -webkit-writing-mode: vertical-lr; width: 1em; height: 0; display: inline-block;'><ruby class='custom_ruby_rl' style='position: absolute; transform: translate(" + ruby_x + "px," + ruby_y + "px) scale(" + ruby_scale + "); top:" + start + "; bottom:" + end + ";";
			}

			if ( parseFloat(ruby_spacing) != 0 ){
				str += "letter-spacing: " + ruby_spacing + "px;";
			} else if ( parseFloat(defaultPitch) != 0) {
				//defaultPitchを0以外、ruby_spacingを0で設定した場合
				str += "letter-spacing: 0px;";
			}

		    if (ruby_color != "" && ruby_color !== undefined){
				try{
			    	ruby_color = ruby_color.replace("0x", "#");
					str += "color:" + ruby_color + ";";
				} catch(e){}
			}

		    if (ruby_background != "" && ruby_background !== undefined){
				try{
			    	ruby_background = ruby_background.replace("0x", "#");
					str += "background-color:" + ruby_background + ";";
				} catch(e){}
			}
		    
		    if (String(ruby_bold) == "true"){
				str += "font-weight: bold;";
			} else if (String(ruby_bold) == "false") {
				str += "font-weight: normal;";
			}

		    if (String(ruby_italic) == "true"){
				str += "font-style: italic;";
			} else if (String(ruby_italic) == "false") {
				str += "font-style: normal;";
			}

		    if (ruby_face != ""){
				str += "font-family:\"" + ruby_face + "\";";
			}

		    if (String(ruby_reverse) == "true"){
				if (isVertical != "true") {
					str += "transform-origin: top center; bottom:calc(-1em + 4px);";
				} else {
					str += "transform-origin: top center; left:-1em;";
				}
			}

			//divだとロード時におかしくなって、spanだと余計な処理が入る
			str += "'>" +  text + "</ruby></ruby><ruby style='display: none;'><rt>";
			
		    //ここに文字が入っている場合、ルビを設定してから、テキスト表示する
		    this.kag.stat.ruby_str = str;
		}

	    this.kag.ftag.nextOrder();

	}

})();
