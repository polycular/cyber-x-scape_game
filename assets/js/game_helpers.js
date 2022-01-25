function solve_puzzle(hotspot) {
  const timeout = 2_000;

  const phx_stop_timer_element = document.getElementById('phx_stop_timer');
  phx_stop_timer_element.click();

  const phx_solved_trigger_element = document.getElementById('phx_solved');
  const reward_element = document.getElementById('reward');
  reward_element.style.display = 'initial';

  // solve with timeout to show reward
  setTimeout(() => { phx_solved_trigger_element.click(); }, timeout);
  play_success_sound();

  disable_hotspot(hotspot)
}

function enable_hotspot(hotspot) {
  hotspot.classList.add('clickable');
}

function disable_hotspot(hotspot) {
  hotspot.classList.remove('clickable');
}

function play_success_sound() {
  const audio = new Audio('/audio/320654__rhodesmas__level-up-02.mp3');
  audio.play();
}

export { solve_puzzle, disable_hotspot, enable_hotspot };
