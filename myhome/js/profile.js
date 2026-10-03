(function () {
  "use strict";
  document.addEventListener("DOMContentLoaded", function () {
    var links = document.querySelectorAll(".profile-nav [data-tab]");
    links.forEach(function (link) {
      link.addEventListener("click", function (e) {
        e.preventDefault();
        links.forEach(function (l) { l.classList.remove("active"); });
        link.classList.add("active");
        ["details", "orders", "addresses"].forEach(function (tab) {
          document.getElementById("tab-" + tab).style.display = tab === link.dataset.tab ? "block" : "none";
        });
      });
    });

    var form = document.getElementById("details-form");
    form.addEventListener("submit", function (e) {
      e.preventDefault();
      if (window.MyHomeValidate(form)) {
        MyHomeToast("Profile updated");
      }
    });
  });
})();
