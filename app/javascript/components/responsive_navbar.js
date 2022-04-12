document.addEventListener("turbo:load", function() {
  const btn = document.querySelector("button#nav-toggle");
  const menu = document.querySelector("#mobile-menu");

  if (!btn) return;

  btn.addEventListener("click", () => {
    menu.classList.toggle("hidden");
  });
})
