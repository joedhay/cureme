function select_all_categories(){
  $(".category_list_master").change(function(){
    $(".category_list").prop('checked', $(this).prop("checked"));
  });
}

function delete_all_categories(){
  $('.btn_delete').click(function(){
    var ids = []
    $('.category_list').each(function(){
      this.checked ? ids.push($(this).val()) : "0";
    });

    if(ids.length > 0){
      $.ajax({
        method: "POST",
        data: {ids:ids},
        url: "/categories/delete_all_category"
      }).done(function(data) {
        $('.categories_lists').html('');
        $('.categories_lists').html(data);
      });
    }
  })
}
