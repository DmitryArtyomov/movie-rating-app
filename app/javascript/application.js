// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

const bindToasts = () => {
  document.querySelectorAll('.toast').forEach((toastEl) => {
    const toast = new bootstrap.Toast(toastEl);
    toast.show();
    toastEl.addEventListener('hidden.bs.toast', () => toastEl.remove())
  });
}

const initializePage = () => {
  bindToasts();
}

document.addEventListener('turbo:load', initializePage);
document.addEventListener('turbo:render', initializePage);
