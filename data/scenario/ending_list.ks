[_tb_system_call storage=system/_ending_list.ks]

[cm]

[iscript]
window.initEdListScreen();
[endscript]

[s]

; --- CLOSE / BACKボタン押下時の飛び先 ---
*back
[cm]
[iscript]
window.closeEdListScreen();
[endscript]

[jump storage="title_screen.ks" target="*title"]
[s]