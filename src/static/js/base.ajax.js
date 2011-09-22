function callback_example1(data) {
	if (data != Dajaxice.EXCEPTION) {
		//alert("aaa" + data.message);
		
		
		$('#subline').html(data.message);
		
		
	} else {
		alert('Error');
	}
}
function callback_example2(data) {
	if (data != Dajaxice.EXCEPTION) {
		for ( var i = 0; i < data.numbers.length; i++) {
			alert(data.numbers[i]);
		}
	} else {
		alert('Error');
	}
}

function callback_example3(data) {
	if (data != Dajaxice.EXCEPTION) {
		alert(data.result);
	} else {
		alert('Error');
	}
}

function callback_example_error(data) {
	if (data != Dajaxice.EXCEPTION) {
		alert(data);
	} else {
		alert('Error');
	}
}

function callback_complex_example1(data) {
	if (data != Dajaxice.EXCEPTION) {
		alert(data.message);
	} else {
		alert('Error');
	}
}