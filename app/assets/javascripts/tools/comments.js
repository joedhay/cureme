function create_comments(){
  $('.post_comment').click(function(){
    parent_id = $(this).attr('id');
    $('.comment_area').show();

  });

  $('.post_reply_comment').click(function(){
    var comment_id = $(this).attr('title');
    parent_id = $(this).attr('title');
    console.log("parent_id:"+parent_id);
    $('.post_reply_comment').each(function(){
      $('.comment_area_'+$(this).attr('title')).hide();
      $('#child_'+$(this).attr('title')).hide();
    });
    $('.comment_area_'+comment_id).show();
    $('.comment_area').hide();

  });

  $('.cancel_comment').click(function(){
    $('.comment_area').hide();
    $('#comment_message').val('');
  });

  $('.cancel_reply_comment').click(function(){
    $('.comment_area').hide();
    $('#comment_message').val('');
    $('#reply_comment_message').hide();
    $('#reply_comment_message').val('');

    $('.post_reply_comment').each(function(){
      $('.comment_area_'+$(this).attr('title')).hide();
    });

  });

  $('.reply_send_comment').click(function(){
    var product_id = $('#product_id').val();
    var comments = $('#comment_message').val();
    var message_to = $('#message_to').val();
    console.log(comments);
    $.ajax({
      method: "POST",
      data: {task_id:task_id,comment:comments,message_to:message_to,parent_id:parent_id},
      url: "/comments/save_comments"
    }).done(function(data) {
      $('.comment_lists').html('');
      $('.comment_lists').html(data);

    });
  });

  $('.send_comment').click(function(){
    var product_id = $('#product_id').val();
    var comments = $('#comment_message').val();
    var message_to = $('#message_to').val();

    $.ajax({
      method: "POST",
      data: {product_id:product_id,comment:comments,message_to:message_to,parent_id:parent_id},
      url: "/comments/save_comments"
    }).done(function(data) {
      $('.comment_lists').html('');
      $('.comment_lists').html(data);

    });
  });

  $('.num_comment').click(function(){
    var comment_id = $(this).attr('id');
    $('.comment_ids').each(function(){
      $('#child_'+$(this).val()).hide();
      $('.comment_area_'+$(this).val()).hide();
    });

    $('.comment_area').hide();

    $('#child_'+comment_id).show();
    $.ajax({
      method: "POST",
      data: {comment_id:comment_id},
      url: "/comments/get_child_comments"
    }).done(function(data) {
      $('#child_'+comment_id).html('');
      $('#child_'+comment_id).html(data);
    });
  });
}