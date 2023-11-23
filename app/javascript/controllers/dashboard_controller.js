import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["mybookings", "mypendings"]
  connect() {
    console.log('dashboard plug-in is up!')
  }

  showbookings() {
    console.log('show booking')
    this.mybookingsTarget.classList.remove("d-none");


  }
  showpendings() {
    console.log('show pending')
    this.mybookingsTarget.classList.add('d-none')

  }

}

