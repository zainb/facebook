jQuery ->
  $(document).ready ->
    $(".post-button").click ->
      text = $(".post-field").val();
      alert("Post body must be filled out") if text == ""