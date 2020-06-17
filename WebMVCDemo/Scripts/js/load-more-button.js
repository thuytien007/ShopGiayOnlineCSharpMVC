$(function () {
    var lodingCount = 1;
    var loading = $("#loading");
    $("#loadMore").on("click", function (e) {

        e.preventDefault();

        $(document).on({
            ajaxStart: function () {
                loading.show();
            },
            ajaxStop: function () {
                loading.hide();
            }
        });

        //var url = ;
        $.ajax({
            url: url,
            data: { size: loadCount * 4 },
            cache: false,
            type: "POST",
            success: function (data) {
                if (data.length !== 0) {
                    $(data.ModelString)
                        .insertBefore("#loadMore")
                        .hide()
                        .fadeIn(2000);
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
                alert("message: \n" +
                    "An error occured, for more info check the js code" +
                    "\n status: \n" + status +
                    "\n error: \n" + error);
            }
        });
        loadCount = loadCount + 1;
    });
});