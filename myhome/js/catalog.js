(function () {
  "use strict";
  document.addEventListener("DOMContentLoaded", function () {
    var grid = document.getElementById("catalog-grid");
    var resultCount = document.getElementById("result-count");
    var priceFilter = document.getElementById("price-filter");
    var priceLabel = document.getElementById("price-filter-label");
    var sortSelect = document.getElementById("sort-select");
    var catBoxes = document.querySelectorAll(".cat-filter");

    // Pre-select category from ?cat= query param, if present
    var params = new URLSearchParams(window.location.search);
    var initialCat = params.get("cat");
    if (initialCat) {
      catBoxes.forEach(function (box) { box.checked = box.value === initialCat; });
    }

    function apply() {
      var checked = Array.from(catBoxes).filter(function (b) { return b.checked; }).map(function (b) { return b.value; });
      var maxPrice = parseFloat(priceFilter.value);
      priceLabel.textContent = "UP TO $" + maxPrice;

      var items = PRODUCTS.filter(function (p) {
        return checked.indexOf(p.cat) !== -1 && p.price <= maxPrice;
      });

      switch (sortSelect.value) {
        case "price-asc": items.sort(function (a, b) { return a.price - b.price; }); break;
        case "price-desc": items.sort(function (a, b) { return b.price - a.price; }); break;
        case "name": items.sort(function (a, b) { return a.name.localeCompare(b.name); }); break;
        default: items.sort(function (a, b) { return (b.featured ? 1 : 0) - (a.featured ? 1 : 0); });
      }

      resultCount.textContent = items.length + " ITEM" + (items.length === 1 ? "" : "S");
      renderProductGrid(grid, items);
    }

    catBoxes.forEach(function (b) { b.addEventListener("change", apply); });
    priceFilter.addEventListener("input", apply);
    sortSelect.addEventListener("change", apply);

    apply();
  });
})();
