// Menu movil compartido para todas las paginas.
(function () {
  function init() {
    const header = document.querySelector(".site-header");
    const nav = header && header.querySelector(".nav-links");
    if (!header || !nav) return;

    let toggle = header.querySelector(".nav-toggle");
    if (!toggle) {
      toggle = document.createElement("button");
      toggle.type = "button";
      toggle.className = "nav-toggle";
      toggle.setAttribute("aria-label", "Menu");
      toggle.setAttribute("aria-expanded", "false");
      toggle.innerHTML = "<span></span><span></span><span></span>";
      const actions = header.querySelector(".header-actions");
      if (actions) {
        actions.appendChild(toggle);
      } else {
        header.appendChild(toggle);
      }
    }

    function closeMenu() {
      nav.classList.remove("is-open");
      toggle.classList.remove("is-open");
      toggle.setAttribute("aria-expanded", "false");
    }

    toggle.addEventListener("click", function () {
      const open = !nav.classList.contains("is-open");
      nav.classList.toggle("is-open", open);
      toggle.classList.toggle("is-open", open);
      toggle.setAttribute("aria-expanded", String(open));
    });

    nav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", closeMenu);
    });

    document.addEventListener("click", function (event) {
      if (!header.contains(event.target)) closeMenu();
    });

    window.addEventListener("resize", function () {
      if (window.innerWidth > 900) closeMenu();
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
