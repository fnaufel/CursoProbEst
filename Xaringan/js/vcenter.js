
// Apron sets the display property of remark-slide as block.
// I need remark-slide to have display: table in order for
// vertical alignment to work. Hence this hack:

function vcenter() {

    $(".vcenter")
        .parent()
        .css("display", "table");

}
