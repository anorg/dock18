(function(jwplayer){
	
  var template = function(player, config, div) {
    function setup(evt) {
    	// console.log(player);
    	// player.remove();
        div.style.color = 'white';
        div.innerHTML += '<div id="chat_f">' + '' + '</div>';
        
        /*$('#chat_f').remove();
        
        $('#chat_f').countdown({
			until: +10
		});*/
    };
    player.onReady(setup);
    this.resize = function(width, height) {};
  };

  jwplayer().registerPlugin('base.plugin', template);

})(jwplayer);