$(document).ready(function() {
    // Show the delete btn for several checked checkbox
    // @todo generic Ux function
    $('body').on('.ui-select.todos', 'click', function() {
       alert($('.ui-select.todos:checked').size());
       if ($('.ui-select.todos:checked').size() > 1) {
           $('.ui-delete-todos').removeClass('hide');
       } else {
           $('.ui-delete-todos').addClass('hide');
       }
    });
});