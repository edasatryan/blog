$('.article.show').ready(function () {

});

function addNewArticle() {
    var title = $('#title').val();
    var content = $('#content').val();
    var video = $('#video').val();
    var url = '/api/v1/articles' ;
    $.ajax({
        url: url,
        method: 'POST',
        contentType: 'application/json',
        data:JSON.stringify({title:title,content:content,video:video})
    }).done(function () {
        // $button.closest('.weather-widget').remove();
        // $.growl.notice({message: 'Forecast successfuly removed', location: 'bl'});
    }).fail(function () {
        // $.growl.warning({message: 'Forecast can\'t be removed', location: 'bl'});
    })
}

function deleteArticle(id) {
    var url = '/api/v1/article/' +id;
    $.ajax({
        url: url,
        method: 'DELETE',
        contentType: 'application/json',
        dataType: "html",
        // data:JSON.stringify({id:id}),
        success: function(result) {
            // alert(result)
            // $('#article'+ id).html('');
            // $('#articleLi'+ id).html('');
            document.getElementById("article"+ id).remove();
            document.getElementById("articleLi"+ id).remove();
        }
    })
}