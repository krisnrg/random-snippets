var path = window.location.pathname;
var pathArr = path.split("/").filter(function (e) {
    return e != "";
});
var max = pathArr.length;
var hasRun = false;


function getNavLinkButton(search, level){
    return $(`.level-${level} .nav-link`).filter( function() {
        return $(this).attr('href').slice(1,-1) === search;
    })
}

$("[data-toggle-desktopnav]").on("click", function(e) {
    var isActive = $(e.currentTarget).hasClass("active");
    if(isActive && !hasRun){
        pathArr.forEach(function(elem, index){
            (function(){
                setTimeout(function(){
                    var number = index + 1;
                    var range = pathArr.slice(0, number);
                    var joined = range.join("/");
                    if(number < max) {
                        getNavLinkButton(joined, number)
                            .siblings(".dropdown-toggle")
                            .click();
                    } else {
                        getNavLinkButton(joined, number)
                            .css("color", "#e9bf60");
                    }
                }, index * 300);
            })();
        })   
        hasRun = true;
    }
})
