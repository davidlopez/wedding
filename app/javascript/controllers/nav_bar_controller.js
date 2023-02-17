import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const toggle = document.getElementById("nav-menu-toggle");
    const menu = document.getElementById("nav-menu-mobile");
    const bg = document.getElementById("nav-menu-fill");

    toggle.addEventListener('click', () => {
      menu.style.display = menu.style.display === "flex" ? "none" : "flex";
      bg.style.display = menu.style.display === "block" ? "none" : "block";
    })

    menu.addEventListener('click', () => {
      menu.style.display = "none";
      bg.style.display = "none";
    })

    bg.addEventListener('click', () => {
      menu.style.display = "none";
      bg.style.display = "none";
    })

    bg.addEventListener('scroll', () => {
      menu.style.display = "none";
      bg.style.display = "none";
    })

    bg.addEventListener('touchmove', () => {
      menu.style.display = "none";
      bg.style.display = "none";
    })

  }
}
