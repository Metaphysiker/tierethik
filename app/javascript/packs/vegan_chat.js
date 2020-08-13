

  console.log("vegan_chat loaded!");

  function get_button(id, timeout) {
    setTimeout(
    function()
    {

        $.ajax({
          url: "/vegan_chat/get_button/" + id,
          method: 'POST',
          headers: {
            'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
          }
        });


    }, timeout);
  }
