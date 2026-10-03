(function () {
    "use strict";

    function summaryHtml(cart) {
        var subtotal = MyHomeCart.total(cart);
        var shipping = subtotal > 0 ? 45 : 0;
        var tax = subtotal * 0.08;
        var total = subtotal + shipping + tax;
        var lines = cart.map(function (i) {
            return '<div class="summary-row"><span>' + i.name + ' × ' + i.qty + '</span><span class="amount">' + MyHomeCart.format(i.price * i.qty) + '</span></div>';
        }).join("");

        return (
            '<div class="summary-card">' +
            '<h3>Order summary</h3>' +
            lines +
            '<hr class="divider" style="margin:0.8rem 0">' +
            '<div class="summary-row"><span>Subtotal</span><span class="amount">' + MyHomeCart.format(subtotal) + '</span></div>' +
            '<div class="summary-row"><span>Delivery</span><span class="amount">' + MyHomeCart.format(shipping) + '</span></div>' +
            '<div class="summary-row"><span>Estimated tax</span><span class="amount">' + MyHomeCart.format(tax) + '</span></div>' +
            '<div class="summary-row total"><span>Total</span><span class="amount">' + MyHomeCart.format(total) + '</span></div>' +
            '</div>'
        );
    }

    function renderForm(cart) {
        var target = document.getElementById("checkout-content");
        target.innerHTML =
            '<div class="checkout-layout">' +
            '<div>' +
            '<div class="form-panel wide" style="margin:0 0 var(--space-md)">' +
            '<h3>Delivery address</h3>' +
            '<form id="checkout-form" novalidate>' +
            '<div class="field-row">' +
            '<div class="field"><label for="co-first">First name</label><input id="co-first" required><div class="field-error">Required.</div></div>' +
            '<div class="field"><label for="co-last">Last name</label><input id="co-last" required><div class="field-error">Required.</div></div>' +
            '</div>' +
            '<div class="field"><label for="co-address">Street address</label><input id="co-address" required><div class="field-error">Required.</div></div>' +
            '<div class="field-row">' +
            '<div class="field"><label for="co-city">City</label><input id="co-city" required><div class="field-error">Required.</div></div>' +
            '<div class="field"><label for="co-zip">PIN / ZIP code</label><input id="co-zip" required><div class="field-error">Required.</div></div>' +
            '</div>' +
            '<h3 style="margin-top:1.5rem">Payment method</h3>' +
            '<div class="pay-methods">' +
            '<div class="pay-method selected" data-method="card">Credit / Debit card</div>' +
            '<div class="pay-method" data-method="upi">UPI</div>' +
            '<div class="pay-method" data-method="cod">Cash on delivery</div>' +
            '</div>' +
            '<div id="card-fields">' +
            '<div class="field"><label for="co-card">Card number</label><input id="co-card" placeholder="1234 5678 9012 3456" required><div class="field-error">Enter a valid card number.</div></div>' +
            '<div class="field-row">' +
            '<div class="field"><label for="co-exp">Expiry</label><input id="co-exp" placeholder="MM/YY" required><div class="field-error">Required.</div></div>' +
            '<div class="field"><label for="co-cvv">CVV</label><input id="co-cvv" placeholder="123" required><div class="field-error">Required.</div></div>' +
            '</div>' +
            '</div>' +
            '<button type="submit" class="btn btn-primary btn-block mt-lg">Place order</button>' +
            '</form>' +
            '</div>' +
            '</div>' +
            summaryHtml(cart) +
            '</div>';

        document.querySelectorAll(".pay-method").forEach(function (el) {
            el.addEventListener("click", function () {
                document.querySelectorAll(".pay-method").forEach(function (x) { x.classList.remove("selected"); });
                el.classList.add("selected");
                var cardFields = document.getElementById("card-fields");
                cardFields.style.display = el.dataset.method === "card" ? "block" : "none";
                cardFields.querySelectorAll("input").forEach(function (inp) { inp.required = el.dataset.method === "card"; });
            });
        });

        document.getElementById("checkout-form").addEventListener("submit", function (e) {
            e.preventDefault();
            if (window.MyHomeValidate(this)) {
                var orderId = "MHI-" + Math.floor(100000 + Math.random() * 900000);
                localStorage.setItem("myhome_cart", "[]");
                renderConfirmation(orderId);
            }
        });
    }

    function renderConfirmation(orderId) {
        document.querySelectorAll(".step-track .step").forEach(function (s, idx) {
            s.classList.toggle("active", idx === 2);
        });
        document.getElementById("checkout-content").innerHTML =
            '<div class="confirmation">' +
            '<svg><use href="#icon-check"/></svg>' +
            '<h2>Order confirmed</h2>' +
            '<p>Thank you — we\'ve sent a confirmation email with your delivery details.</p>' +
            '<div class="order-id">' + orderId + '</div>' +
            '<div class="hero-actions" style="justify-content:center">' +
            '<a href="profile.aspx" class="btn btn-primary">View my orders</a>' +
            '<a href="catalog.aspx" class="btn btn-outline">Continue shopping</a>' +
            '</div>' +
            '</div>';
        renderCartCountSafe();
    }

    function renderCartCountSafe() {
        var el = document.querySelector(".cart-count");
        if (el) el.textContent = "0";
    }

    document.addEventListener("DOMContentLoaded", function () {
        var cart = MyHomeCart.load();
        if (!cart.length) {
            document.getElementById("checkout-content").innerHTML =
                '<div class="empty-state">' +
                '<svg><use href="#icon-box"/></svg>' +
                '<h3>Your cart is empty</h3>' +
                '<p>Add something to your cart before checking out.</p>' +
                '<a href="catalog.aspx" class="btn btn-primary">Shop the catalog</a>' +
                '</div>';
            return;
        }
        renderForm(cart);
    });
})();