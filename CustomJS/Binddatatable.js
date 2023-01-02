$(document).ready(function () {
    //alert('HI');
    $('#example thead th').each(function () {
        var t1 = $('#example thead th').eq($(this).index()).text();
        $(this).html('<input type="text" placeholder="Search ' + t1.trim() + '" name="' + t1.trim() + '"/>');
        .draw();
    });

    var table = $('#example').DataTable({
        "scrollY": "450px",
        "paging": false,
        "scrollX": true

        //"ScrollCollapse": true
        //"searching": false
    });

    //table.draw();
    $('a.toggle-vis').on('click', function (e) {
        e.preventDefault();

        // Get the column API object
        var column = table.column($(this).attr('data-column'));

        // Toggle the visibility
        column.visible(!column.visible());
    });

    /* Apply the search for individual columns*/
    table.columns().every(function () {
        var that = this;
        $('input', this.header()).on('keydown', function (ev) {
            //if (ev.keyCode == 13) { //only on enter keypress (code 13)

            that
                .search(this.value)
                .draw();
            // }
        });
    });


    table.columns().eq(0).each(function (colIdx) {

        $('input, select', table.column(colIdx).header()).on('click', function (e) {
            e.stopPropagation();
        });
    });

    //End of Datatable function

});