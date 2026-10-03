(function () {
    "use strict";

    function imageFor(id) {
        var p = PRODUCTS.find(function (x) { return x.id === id; });
        return p ? p.image : "images/p1.jpg";
    }

    function render() {
        var target = document.getElementById("cart-content");
        var cart = MyHomeCart.load();

        if (!cart.length) {
            target.innerHTML =
                '<div class="empty-state">' +
                '<svg><use href="#icon-box"/></svg>' +
                '<h3>Your cart is empty</h3>' +
                '<p>Browse the catalog and add a few pieces you love.</p>' +
                '<a href="catalog.aspx" class="btn btn-primary">Shop the catalog</a>' +
                '</div>';
            return;
        }

        var rows = cart.map(function (item) {
            return (
                '<div class="cart-row" data-row="' + item.id + '">' +
                '<div class="cart-thumb"><img src="' + imageFor(item.id) + '" alt="' + item.name + '" style="width:50px; height:50px; object-fit:cover; border-radius:4px;" /></div>' +
                '<div>' +
                '<div class="cart-item-name">' + item.name + '</div>' +
                '<div class="cart-item-meta">' + item.id + ' · ' + MyHomeCart.format(item.price) + ' each</div>' +
                '</div>' +
                '<div class="qty-control">' +
                '<button type="button" data-action="dec" data-id="' + item.id + '">−</button>' +
                '<input type="text" readonly value="' + item.qty + '">' +
                '<button type="button" data-action="inc" data-id="' + item.id + '">+</button>' +
                '</div>' +
                '<button class="remove-link" data-action="remove" data-id="' + item.id + '">Remove</button>' +
                '</div>'
            );
        }).join("");

        var subtotal = MyHomeCart.total(cart);
        var shipping = subtotal > 0 ? 45 : 0;
        var tax = subtotal * 0.08;
        var total = subtotal + shipping + tax;

        target.innerHTML =
            '<div class="cart-layout">' +
            '<div class="cart-list">' + rows + '</div>' +
            '<div class="summary-card">' +
            '<h3>Order summary</h3>' +
            '<div class="summary-row"><span>Subtotal</span><span class="amount">' + MyHomeCart.format(subtotal) + '</span></div>' +
            '<div class="summary-row"><span>Delivery</span><span class="amount">' + MyHomeCart.format(shipping) + '</span></div>' +
            '<div class="summary-row"><span>Estimated tax</span><span class="amount">' + MyHomeCart.format(tax) + '</span></div>' +
            '<div class="summary-row total"><span>Total</span><span class="amount">' + MyHomeCart.format(total) + '</span></div>' +
            '<a href="checkout.aspx" class="btn btn-primary btn-block mt-lg">Proceed to checkout</a>' +
            '<a href="catalog.aspx" class="btn-ghost" style="display:block; text-align:center; margin-top:0.8rem">Continue shopping</a>' +
            '</div>' +
            '</div>';
    }

    document.addEventListener("DOMContentLoaded", function () {
        render();
        var cartContent = document.getElementById("cart-content");
        if (cartContent) {
            cartContent.addEventListener("click", function (e) {
                var btn = e.target.closest("[data-action]");
                if (!btn) return;
                var id = btn.getAttribute("data-id");
                var cart = MyHomeCart.load();
                var item = cart.find(function (i) { return i.id === id; });
                if (!item) return;

                if (btn.dataset.action === "inc") MyHomeCart.updateQty(id, item.qty + 1);
                if (btn.dataset.action === "dec") {
                    if (item.qty <= 1) { MyHomeCart.remove(id); } else { MyHomeCart.updateQty(id, item.qty - 1); }
                }
                if (btn.dataset.action === "remove") MyHomeCart.remove(id);
                render();
            });
        }
    });
})();