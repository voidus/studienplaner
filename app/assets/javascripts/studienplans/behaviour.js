define(['jquery'], function($) {
  return {
    apply: function() {
      $(document).on("click", ".open-studienplan-form-create", function() {
        $('.studienplan-form-create').show()
      })
    }
  }
})
