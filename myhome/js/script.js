/* ==========================================================================
   MyHome Interiors — shared front-end behaviour
   Cart state is kept in localStorage under "myhome_cart" so it persists
   across the static pages. On the real ASP.NET site, swap loadCart/saveCart
   for calls to your cart web service / session state.
   ========================================================================== */

(function () {
  "use strict";

  /* ---------------- Mobile nav ---------------- */
  document.addEventListener("DOMContentLoaded", function () {
    var toggle = document.querySelector(".nav-toggle");
    var nav = document.querySelector(".main-nav");
    if (toggle && nav) {
      toggle.addEventListener("click", function () {
        nav.classList.toggle("open");
      });
    }
    renderCartCount();
  });

  /* ---------------- Toast ---------------- */
  function showToast(message) {
    var toast = document.querySelector(".toast");
    if (!toast) {
      toast = document.createElement("div");
      toast.className = "toast";
      document.body.appendChild(toast);
    }
    toast.textContent = message;
    toast.classList.add("show");
    clearTimeout(toast._timer);
    toast._timer = setTimeout(function () {
      toast.classList.remove("show");
    }, 2200);
  }
  window.MyHomeToast = showToast;

  /* ---------------- Cart store ---------------- */
  var CART_KEY = "myhome_cart";

  function loadCart() {
    try {
      return JSON.parse(localStorage.getItem(CART_KEY)) || [];
    } catch (e) {
      return [];
    }
  }

  function saveCart(cart) {
    localStorage.setItem(CART_KEY, JSON.stringify(cart));
    renderCartCount();
  }

  function addToCart(item) {
    var cart = loadCart();
    var existing = cart.find(function (i) { return i.id === item.id; });
    if (existing) {
      existing.qty += item.qty || 1;
    } else {
      cart.push({ id: item.id, name: item.name, price: item.price, qty: item.qty || 1 });
    }
    saveCart(cart);
    showToast(item.name + " added to cart");
  }

  function removeFromCart(id) {
    var cart = loadCart().filter(function (i) { return i.id !== id; });
    saveCart(cart);
  }

  function updateQty(id, qty) {
    var cart = loadCart();
    var item = cart.find(function (i) { return i.id === id; });
    if (item) {
      item.qty = Math.max(1, qty);
      saveCart(cart);
    }
  }

  function cartCount(cart) {
    cart = cart || loadCart();
    return cart.reduce(function (n, i) { return n + i.qty; }, 0);
  }

  function cartTotal(cart) {
    cart = cart || loadCart();
    return cart.reduce(function (sum, i) { return sum + i.qty * i.price; }, 0);
  }

  function renderCartCount() {
    var el = document.querySelector(".cart-count");
    if (el) el.textContent = cartCount();
  }

  function formatPrice(n) {
    return "$" + n.toFixed(2);
  }

  window.MyHomeCart = {
    load: loadCart,
    add: addToCart,
    remove: removeFromCart,
    updateQty: updateQty,
    count: cartCount,
    total: cartTotal,
    format: formatPrice
  };

  /* ---------------- Generic form validation ---------------- */
  window.MyHomeValidate = function (form) {
    var valid = true;
    form.querySelectorAll("[required]").forEach(function (input) {
      var field = input.closest(".field");
      var ok = input.value.trim().length > 0;
      if (input.type === "email" && ok) {
        ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(input.value);
      }
      if (field) field.classList.toggle("invalid", !ok);
      if (!ok) valid = false;
    });
    return valid;
  };

  /* Attach add-to-cart handlers declaratively via data attributes */
  document.addEventListener("click", function (e) {
    var btn = e.target.closest("[data-add-to-cart]");
    if (btn) {
      addToCart({
        id: btn.getAttribute("data-id"),
        name: btn.getAttribute("data-name"),
        price: parseFloat(btn.getAttribute("data-price"))
      });
    }
  });
})();
