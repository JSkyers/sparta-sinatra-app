var create_audio = new Audio('audio/create_a_character.wav');
var main_menu_audio = new Audio('audio/main_menu.wav');

$(".new_character_logo").hover(function () {
  create_audio.play();
});
$(".home_page_logo").hover(function () {
  main_menu_audio.play();
});
