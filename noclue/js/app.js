$(document).ready(function() {
    $('.ext-code').each(function (i, o) {
        var url = $(o).data('src');
        
        $.ajax({
            url: url, 
            success: function(text) {        
                $(o).text(text);
                hljs.highlightBlock(o);
            },
            dataType: "text"
        });
    });
});
