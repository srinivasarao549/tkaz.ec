var _gaq = _gaq || [];

(function () { "use strict";

var ga = document.createElement("script"); ga.type = "text/javascript"; ga.async = true;
ga.src = ("https:" == document.location.protocol ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ga, s);

var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
document.addEventListener("keydown", function fn (e) {
	kkeys.push(e.keyCode);
	
	if (kkeys.toString().indexOf(konami) >= 0) {
		document.removeEventListener("keydown", fn, false);
		
		document.getElementById("github").children[0].src = "img/github-red.png";
		
		konami = document.createElement("script");
		konami.src = "http://www.cornify.com/js/cornify.js";
		konami.onload = function(){
			cornify_add();
			document.addEventListener("keydown", cornify_add, false);
		};
		document.body.appendChild(konami);
		
		_gaq.push(["_trackEvent", "Konami", "Enter"]);
	}
}, false);

_gaq.push(
	["_setAccount", "##GA##"],
	["_trackPageview"]
);

})();