var refreshRating = function() {
	$('.rating').raty( { path: '/images/ratyrate', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/images/ratyrate',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
};

$(document).on('turbolinks:load', function() {
	refreshRating();

	$('.img-zoom').elevateZoom();

	
});