window.addEventListener('load', function() {
  console.log('TucanPauseMenu Started')
})

window.addEventListener('message', function(event) {
  var v = event.data

  switch(v.action) {

      case 'show':
			ShowSettings()
			$('#showupdates').hide();
			$('#showabout').hide();			
      break;

  }
})



function ShowSettings() {

	$('.container').fadeIn()
  openUi = true
}

$(function(){
    $('#settings').click(function(){
      $.post('https://TucanPauseMenu/SendAction', JSON.stringify({action: 'settings'}));
      CloseAll()
    })
    $('#map').click(function(){
      $.post('https://TucanPauseMenu/SendAction', JSON.stringify({action: 'map'}));
      CloseAll()
    })
	$('#resume').click(function(){
      CloseAll()
    })
	
	$('#updates').click(function(){
		$('#showabout').hide();
	   setTimeout(() => { $('#showupdates').fadeIn(); }, 200);
    })
	
	$('#rules').click(function(){
		$('#showupdates').hide();
		setTimeout(() => { $('#showabout').fadeIn(); }, 200);
	   
    })
	
    $('#exit').click(function(){
		$.post('https://TucanPauseMenu/SendAction', JSON.stringify({action: 'exit'}));
      CloseAll()
    })

})

function CloseAll(){
  $('.container').fadeOut()
  $.post('https://TucanPauseMenu/exit', JSON.stringify({}));
  openUi = false
}
