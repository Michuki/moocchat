var Timer = {
  seconds: 0,
  selectorToUpdate: '#_timer_',
  submitUrl: '',                // only if no form on this page
  nextTimeout: null,
  updateDisplay: function() {
    var min = Math.max(0, Math.floor(this.seconds/60));
    var sec = Math.max(0, this.seconds % 60);
    var minString = (min < 10 ? '0'+min.toString() : min.toString());
    var secString = (sec < 10 ? '0'+sec.toString() : sec.toString());
    $(this.selectorToUpdate).text(minString + ':' + secString);
  },
  initialize: function(seconds, submitUrl) {
    this.seconds = seconds;
    this.updateDisplay();
    this.countdown();
  },
  countdown: function() {
    this.nextTimeout = setTimeout('Timer.decrement()', 1000);
  },
  submitForm: function() {
    clearTimeout(this.nextTimeout);
    // if there's a form generated by @start_form_tag macro, submit it
    if ($('form#_main').length > 0) {
      $('form#_main').submit();
    } else {                    // look for link with ID='submit' instead
      window.location.href = this.submitUrl;
    }
  },
  decrement: function() {
    this.seconds -= 1;
    this.updateDisplay();
    if (this.seconds > 0) {
      this.countdown();
    } else {
      this.submitForm();
    }
  },
  setup: function() {
    var t = $('#_timer_');
    if (t.length > 0) { // the page has a timer on it
      Timer.initialize(t.data('countfrom'), t.data('submit'));
    }
  },
};
$(Timer.setup);
