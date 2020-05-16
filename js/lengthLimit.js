var maxLength = 99;
$('textarea').keyup(function() {
  var length = $(this).val().length;
  var length = maxLength-length;
  $('#charsCount').text(length);
});