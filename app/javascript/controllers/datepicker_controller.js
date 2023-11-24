import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = { outdates: Array }
  connect() {
    //  flatpickr(this.element);
    const minDate = this.element.getAttribute("data-min-date");
    const maxDate = this.element.getAttribute("data-max-date");
    flatpickr(this.element, {
      minDate: minDate,
      maxDate: maxDate,
      // Add any other options you need here
    });
    // if (this.element.hasAttribute("data-enable-dates")) {
    //   const enableDates = JSON.parse(this.element.getAttribute("data-enable-dates"));
    //   flatpickr(this.element, {
    //     enable: enableDates,
    //   });
    // } else {
    //   flatpickr(this.element);
    // }
  }
}