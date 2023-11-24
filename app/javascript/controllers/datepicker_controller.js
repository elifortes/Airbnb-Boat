import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = { outdates: Array }

  connect() {
    console.log('datepicker starting')
    flatpickr(this.element);
    // console.log(this.element)
  }
}
