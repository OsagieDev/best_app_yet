$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.form-group').on('submit', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/organizations/new',
      type: 'POST',
      data: {
        name: $("input[name='name']").val(),
        description: $("input[name='description']").val()
        president: $("input[name='president']").val()
      },
      success: function(response) {
        ('<ul>').append("<li>" + '<%= Organization.last.name %>' + "</li>")
      }
    });
});
xhtml
