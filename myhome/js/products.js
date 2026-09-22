/* ==========================================================================
   MyHome Interiors — product catalog data.
   ========================================================================== */

var PRODUCTS = [
    { id: "P-101", name: "Marlow Lounge Chair", cat: "seating", price: 289.00, image: "images/p1.jpg", tag: "New", featured: true },
    { id: "P-102", name: "Alder Dining Chair (Set of 2)", cat: "seating", price: 210.00, image: "images/p2.jpg", featured: false },
    { id: "P-103", name: "Kestrel 3-Seat Sofa", cat: "sofas", price: 1140.00, image: "images/p3.jpg", tag: "Bestseller", featured: true },
    { id: "P-104", name: "Linden Sectional", cat: "sofas", price: 1620.00, image: "images/p4.jpg", featured: false },
    { id: "P-105", name: "Birchwood Coffee Table", cat: "tables", price: 340.00, image: "images/p5.jpg", featured: true },
    { id: "P-106", name: "Solstice Dining Table", cat: "tables", price: 890.00, image: "images/p6.jpg", tag: "New", featured: false },
    { id: "P-107", name: "Harlow Platform Bed", cat: "bedroom", price: 760.00, image: "images/p7.jpg", featured: true },
    { id: "P-108", name: "Wren Nightstand", cat: "bedroom", price: 165.00, image: "images/p8.jpg", featured: false },
    { id: "P-109", name: "Ambient Arc Floor Lamp", cat: "lighting", price: 129.00, image: "images/p9.jpg", tag: "Bestseller", featured: true },
    { id: "P-110", name: "Ember Table Lamp", cat: "lighting", price: 74.00, image: "images/p10.jpg", featured: false },
    { id: "P-111", name: "Oat Boucle Armchair", cat: "seating", price: 315.00, image: "images/p11.jpg", featured: true },
    { id: "P-112", name: "Cove Console Table", cat: "tables", price: 245.00, image: "images/p12.jpg", featured: false }
];

function renderProductGrid(container, items) {
    if (!container) return;
    if (!items.length) {
        container.innerHTML = '<div class="empty-state"><svg><use href="#icon-box"/></svg><h3>No products match your filters</h3><p>Try clearing a filter or browsing a different category.</p></div>';
        return;
    }
    container.innerHTML = items.map(function (p) {
        return (
            '<div class="product-card">' +
            '<div class="product-thumb">' +
            (p.tag ? '<span class="product-tag">' + p.tag + '</span>' : '') +
            '<!-- Photo Rendered -->' +
            '<img src="' + p.image + '" alt="' + p.name + '" style="width:100%; height:180px; object-fit:cover; border-radius:4px;" />' +
            '</div>' +
            '<div class="product-info">' +
            '<span class="product-cat">' + p.cat + '</span>' +
            '<h3 class="product-name"><a href="#" style="color:inherit">' + p.name + '</a></h3>' +
            '<span class="product-price">$' + p.price.toFixed(2) + '</span>' +
            '</div>' +
            '<div class="product-actions">' +
            '<button class="btn btn-primary btn-block" data-add-to-cart data-id="' + p.id + '" data-name="' + p.name + '" data-price="' + p.price + '">Add to cart</button>' +
            '</div>' +
            '</div>'
        );
    }).join('');
}