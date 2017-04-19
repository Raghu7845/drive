
    $(document).ready(function () {           
        $('#table_id').dataTable({
           "pagingType": "full_numbers",
           "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
           "scrollY"  : "400px"
         });
    });