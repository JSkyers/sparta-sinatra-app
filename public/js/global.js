var create_audio = new Audio('audio/create_a_character.wav');
var main_menu_audio = new Audio('audio/main_menu.wav');

$(".new_character_logo").click(function () {
  create_audio.play();
});
$(".home_page_logo").click(function () {
  main_menu_audio.play();
});
