jQuery ->
  $(document).ready ->
    $(".comment-button").click ->
      text = $(".comment-field").val();
      alert("Comment body must be filled out") if text == ""