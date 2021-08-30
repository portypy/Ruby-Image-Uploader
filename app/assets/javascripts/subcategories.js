$(document).on("page:load ready", function() {
    $(".selectize").selectize();
});

// $(document).on("page:load ready", function() {
//     let selectizeCallback = null;
//
//     $(".category-modal").on("hide.bs.modal", function(e) {
//         if (selectizeCallback != null) {
//             selectizeCallback();
//             selectizeCallback = null;
//         }
//
//         $("#new_category").trigger("reset");
//         let selectors = [$.rails.linkDisableSelector, $.rails.formEnableSelector].join(', ');
//         $(selectors).each(function() {
//             $.rails.enableElement(this);
//         })
//     });
//
//     $("#new_category").on("submit", function(e) {
//         e.preventDefault();
//         $.ajax({
//             method: "POST",
//             url: $(this).attr("action"),
//             data: $(this).serialize(),
//             success: function(response) {
//                 selectizeCallback({value: response.id, text: response.name});
//                 $(".category-modal").modal('toggle');
//
//                 selectizeCallback = null;
//             }
//         });
//     });
//
//     $(".selectize").selectize({
//         create: function(input, callback) {
//             selectizeCallback = callback;
//
//             $(".category-modal").modal();
//             $("#category_name").val(input);
//         }
//     });
// });