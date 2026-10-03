(function () {
    "use strict";
    document.addEventListener("DOMContentLoaded", function () {
        var tabLogin = document.getElementById("tab-login");
        var tabRegister = document.getElementById("tab-register");
        var loginForm = document.getElementById("login-form");
        var registerForm = document.getElementById("register-form");
        var foot = document.getElementById("login-foot");

        if (!tabLogin || !tabRegister) return;

        function showLogin() {
            loginForm.style.display = "block";
            registerForm.style.display = "none";
            tabLogin.classList.add("active"); tabLogin.style.color = "var(--ink)"; tabLogin.style.fontWeight = 700;
            tabRegister.classList.remove("active"); tabRegister.style.color = "var(--ink-soft)"; tabRegister.style.fontWeight = 400;
            foot.innerHTML = 'Don\'t have an account? <a href="#" id="show-register">Create one</a>';
            document.getElementById("show-register").addEventListener("click", function (e) { e.preventDefault(); showRegister(); });
        }

        function showRegister() {
            loginForm.style.display = "none";
            registerForm.style.display = "block";
            tabRegister.classList.add("active"); tabRegister.style.color = "var(--ink)"; tabRegister.style.fontWeight = 700;
            tabLogin.classList.remove("active"); tabLogin.style.color = "var(--ink-soft)"; tabLogin.style.fontWeight = 400;
            foot.innerHTML = 'Already have an account? <a href="#" id="show-login">Sign in</a>';
            document.getElementById("show-login").addEventListener("click", function (e) { e.preventDefault(); showLogin(); });
        }

        tabLogin.addEventListener("click", showLogin);
        tabRegister.addEventListener("click", showRegister);
        document.getElementById("show-register").addEventListener("click", function (e) { e.preventDefault(); showRegister(); });

        loginForm.addEventListener("submit", function (e) {
            e.preventDefault();
            if (window.MyHomeValidate(loginForm)) {
                MyHomeToast("Signed in — redirecting to your profile…");
                setTimeout(function () { window.location.href = "profile.aspx"; }, 900);
            }
        });

        registerForm.addEventListener("submit", function (e) {
            e.preventDefault();
            var valid = window.MyHomeValidate(registerForm);
            var pass = document.getElementById("reg-password");
            var confirm = document.getElementById("reg-confirm");
            var confirmField = confirm.closest(".field");
            if (pass.value.length < 8) {
                pass.closest(".field").classList.add("invalid");
                valid = false;
            }
            if (confirm.value !== pass.value || confirm.value === "") {
                confirmField.classList.add("invalid");
                valid = false;
            } else {
                confirmField.classList.remove("invalid");
            }
            if (valid) {
                MyHomeToast("Account created — welcome!");
                setTimeout(function () { window.location.href = "profile.aspx"; }, 900);
            }
        });
    });
})();