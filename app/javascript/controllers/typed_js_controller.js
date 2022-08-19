import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Discover the Future, explore all the worlds of your favorites games", "Welcome in AirB in Game"],
      typeSpeed: 1000,
      loop: true
    })
  }
}
