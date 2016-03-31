function save_product_comments(){
    $('.submit_comment').click(function(){
        var id = $(this).data('id')
        var comments = $('#comment_message').val();
        $.ajax({
            method: "POST",
            url: "/comments/save_comment_products",
            data: {product_id:id,comment:comments}
        }).done(function(data) {
            $('.comment_lists').html('');
            $('.comment_lists').html(data);
            save_product_comments();
        });
    });
}
