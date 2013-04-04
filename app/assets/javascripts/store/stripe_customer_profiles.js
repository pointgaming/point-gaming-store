jQuery(function($){
  $('body').on('change', '[data-hook=use-payment-profile]', function() {
    if ($(this).is(':checked')) {
      $("[data-hook=card_number] input").attr('disabled', 'disabled');
      $("[data-hook=card_expiration] select").attr('disabled', 'disabled');
      $("[data-hook=card_code] input").attr('disabled', 'disabled');
    } else {
      $("[data-hook=card_number] input").removeAttr('disabled');
      $("[data-hook=card_expiration] select").removeAttr('disabled');
      $("[data-hook=card_code] input").removeAttr('disabled');
    }
  });
});
