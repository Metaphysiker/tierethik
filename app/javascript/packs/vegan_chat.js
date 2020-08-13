

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

  window.VEGANCHAT = (function() {
      var my_var = 10; //shared variable available only inside your module

      function bar() { // this function not available outside your module
          alert(my_var); // this function can access my_var
      }

      return {
          a_func: function() {
              alert(my_var); // this function can access my_var
          },
          b_func: function() {
              alert(my_var); // this function can also access my_var
          }
      };

  })();
