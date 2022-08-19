import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Explore the worlds of your favorite game world", "Welcome to Air B in Game"],
      typeSpeed: 100,
      loop: true
    })
  }
}
