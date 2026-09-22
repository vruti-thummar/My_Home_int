<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="myhome.about" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us — MyHome Interiors</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Work+Sans:wght@400;500;600;700&family=Space+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">

<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
  <symbol id="icon-chair" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8v24M48 8v40M16 32h32M16 40v16M16 40l-4 8M48 40h4l-2 8"/></symbol>
  <symbol id="icon-sofa" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 30v14a4 4 0 0 0 4 4h36a4 4 0 0 0 4-4V30"/><path d="M10 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6M42 30v-6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v6"/><path d="M18 30h28v10H18z"/><path d="M10 44v8M54 44v8"/></symbol>
  <symbol id="icon-lamp" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 14 L46 14 L38 30 L26 30 Z"/><path d="M32 30v20M22 56h20"/><circle cx="32" cy="8" r="3"/></symbol>
  <symbol id="icon-table" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 18h52l-6 8H12z"/><path d="M16 26v28M48 26v28"/></symbol>
  <symbol id="icon-bed" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 34v20M8 34a4 4 0 0 1 4-4h40a4 4 0 0 1 4 4v6H8z"/><path d="M12 30V18a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v6M31 24v-6a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v12"/><path d="M56 40v14"/></symbol>
  <symbol id="icon-cart" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 10h6l6 30h28l6-20H18"/><circle cx="24" cy="50" r="3"/><circle cx="44" cy="50" r="3"/></symbol>
  <symbol id="icon-user" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="32" cy="22" r="10"/><path d="M12 54c2-12 12-18 20-18s18 6 20 18"/></symbol>
  <symbol id="icon-menu" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M3 6h18M3 12h18M3 18h18"/></symbol>
  <symbol id="icon-close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M5 5l14 14M19 5L5 19"/></symbol>
  <symbol id="icon-search" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><circle cx="10.5" cy="10.5" r="6.5"/><path d="M20 20l-5-5"/></symbol>
  <symbol id="icon-leaf" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 50C10 30 24 12 50 12c2 26-16 38-36 38z"/><path d="M14 50c6-10 16-20 30-30"/></symbol>
  <symbol id="icon-truck" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 16h30v26H4zM34 26h14l10 8v8H34z"/><circle cx="16" cy="46" r="4"/><circle cx="46" cy="46" r="4"/></symbol>
  <symbol id="icon-shield" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M32 6l22 8v16c0 16-10 26-22 28C20 56 10 46 10 30V14z"/><path d="M22 32l7 7 13-14"/></symbol>
  <symbol id="icon-swatch" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="8" y="8" width="20" height="20" rx="2"/><rect x="36" y="8" width="20" height="20" rx="2"/><rect x="8" y="36" width="20" height="20" rx="2"/><rect x="36" y="36" width="20" height="20" rx="2"/></symbol>
  <symbol id="icon-check" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="32" cy="32" r="26"/><path d="M20 33l8 8 16-18"/></symbol>
  <symbol id="icon-box" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M8 20l24-10 24 10-24 10z"/><path d="M8 20v26l24 10V30M56 20v26l-24 10"/></symbol>
  <symbol id="icon-hand" viewBox="0 0 64 64" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 30V14a4 4 0 0 1 8 0v14M28 28V10a4 4 0 0 1 8 0v18M36 28V14a4 4 0 0 1 8 0v20"/><path d="M44 30v-8a4 4 0 0 1 8 0v20c0 10-8 18-18 18h-4c-8 0-12-4-16-10l-8-14a4 4 0 0 1 7-4l5 7"/></symbol>
</svg>


<header class="site-header">
  <div class="container header-row">
    <a href="index.aspx" class="logo"><svg><use href="#icon-swatch"/></svg> MyHome Interiors</a>
    <nav class="main-nav">
      <a href="index.aspx">Home</a>
      <a href="catalog.aspx">Catalog</a>
      <a href="about.aspx" class="active">About</a>
      <a href="login.aspx">Login</a>
      <a href="profile.aspx">Profile</a>
    </nav>
    <div class="header-actions">
      <button type="button" class="icon-btn" aria-label="Search"><svg><use href="#icon-search"/></svg></button>
      <a class="icon-btn" href="cart.aspx" aria-label="Cart"><svg><use href="#icon-cart"/></svg><span class="cart-count">0</span></a>
      <a class="icon-btn" href="login.aspx" aria-label="Account"><svg><use href="#icon-user"/></svg></a>
      <button type="button" class="nav-toggle icon-btn" aria-label="Menu"><svg><use href="#icon-menu"/></svg></button>
    </div>
  </div>
</header>


<main class="container section">
  <div style="max-width:60ch">
    <span class="eyebrow">About us</span>
    <h1>We build furniture the way a good chair is built — to be sat in for years, not seasons.</h1>
    <p class="lede">MyHome Interiors started as a two-person workshop making dining tables for neighbors. Today we're a small team of designers, joiners, and a very particular quality-control cat, still making pieces meant to be lived with.</p>
  </div>

  <div class="value-grid mt-lg">
    <div class="value-card"><svg><use href="#icon-hand"/></svg><h3>Craft first</h3><p>Every frame is joined by hand before it ever touches a finish coat.</p></div>
    <div class="value-card"><svg><use href="#icon-leaf"/></svg><h3>Honest materials</h3><p>Solid timber, natural fibers, and finishes you could read the label on.</p></div>
    <div class="value-card"><svg><use href="#icon-shield"/></svg><h3>Built to last</h3><p>A 10-year structural warranty, because we build things to keep, not replace.</p></div>
  </div>

  <hr class="divider">

  <div>
    <span class="eyebrow">Our story</span>
    <h2>How we got here</h2>
    <div class="timeline">
      <div class="timeline-item"><div class="timeline-year">2014</div><h3>The first workbench</h3><p>Two friends, a rented garage, and one dining table order that turned into ten.</p></div>
      <div class="timeline-item"><div class="timeline-year">2018</div><h3>Our first showroom</h3><p>We opened a small storefront so people could sit in a chair before buying it.</p></div>
      <div class="timeline-item"><div class="timeline-year">2022</div><h3>Going online</h3><p>MyHome Interiors launched nationwide, shipping white-glove delivery to every state.</p></div>
      <div class="timeline-item"><div class="timeline-year">2026</div><h3>Today</h3><p>Thousands of homes, one workshop philosophy: build it right, or don't build it.</p></div>
    </div>
  </div>

  <hr class="divider">

  <div>
    <span class="eyebrow">The team</span>
    <h2>The people behind the pieces</h2>
    <div class="team-grid">
      <div class="team-card"><div class="team-avatar"><svg><use href="#icon-user"/></svg></div><h3>Ananya Rao</h3><div class="team-role">Founder &amp; Head of Design</div></div>
      <div class="team-card"><div class="team-avatar"><svg><use href="#icon-user"/></svg></div><h3>Devansh Mehta</h3><div class="team-role">Master Joiner</div></div>
      <div class="team-card"><div class="team-avatar"><svg><use href="#icon-user"/></svg></div><h3>Kavya Nair</h3><div class="team-role">Materials &amp; Sourcing</div></div>
      <div class="team-card"><div class="team-avatar"><svg><use href="#icon-user"/></svg></div><h3>Sameer Joshi</h3><div class="team-role">Customer Experience</div></div>
    </div>
  </div>

  <hr class="divider">

  <div class="text-center" style="max-width:50ch; margin:0 auto">
    <h2>Come see it in person, or shop from home</h2>
    <p>Every piece on our site is also on our showroom floor. Whichever way you shop, it ships the same way: assembled, protected, and placed exactly where you want it.</p>
    <div class="hero-actions" style="justify-content:center">
      <a href="catalog.aspx" class="btn btn-primary">Shop the catalog</a>
      <a href="#" class="btn btn-outline">Get in touch</a>
    </div>
  </div>
</main>


<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="logo" style="margin-bottom:0.75rem"><svg style="width:24px;height:24px"><use href="#icon-swatch"/></svg> MyHome Interiors</div>
        <p>Furniture designed for how people actually live, made from materials that get better with age.</p>
      </div>
      <div><h4>Shop</h4><ul><li><a href="catalog.aspx">All furniture</a></li><li><a href="catalog.aspx?cat=sofas">Sofas</a></li><li><a href="catalog.aspx?cat=tables">Tables</a></li></ul></div>
      <div><h4>Account</h4><ul><li><a href="login.aspx">Sign in</a></li><li><a href="profile.aspx">My orders</a></li><li><a href="cart.aspx">Cart</a></li></ul></div>
      <div><h4>Company</h4><ul><li><a href="about.aspx">About us</a></li><li><a href="#">Contact</a></li><li><a href="#">Careers</a></li></ul></div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 MyHome Interiors. All rights reserved.</span>
      <span>Rajkot, Gujarat · IN</span>
    </div>
  </div>
</footer>


<script src="js/script.js"></script>

    </form>
</body>
</html>