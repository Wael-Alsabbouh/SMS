$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});


/*CHECKBOX JS*/
$(document).ready(function(){
  
  $("input[name='frdsItem']").each(function() {
    $(this).attr('checked', true);
        $(this).parent().addClass('item-checked');
    });
  
  //Compatible with IE6
    $('.figure').click(function(){
        var flag = $(this).parent().find('.checked-flag'),
            input = $(this).parent().find('input');
            
        if(input.attr('checked') == 'checked'){
            input.attr('checked', false);
            flag.removeClass('item-checked');
        } else {
            input.attr('checked', true);
            flag.addClass('item-checked');  
        };
        return false;
    }); 
});

/*ANOTHER CHECKBOX JS*/
$(document).ready(function(e){
            $(".img-check").click(function(){
            $(this).toggleClass("check");
            });
    });