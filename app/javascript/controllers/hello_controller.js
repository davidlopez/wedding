import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const intro = document.getElementById("intro");
    intro.addEventListener('click', () => intro.classList.toggle("bg-purple-700"))
    intro.classList.toggle("bg-purple-700")
    intro.classList.toggle("bg-black")
    // this.element.textContent = "Hello World!"
    // this.element.className = "bg-purple-700"
  }
}
