import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["mybookings", "mypendings"]
  connect() {
    console.log('dashboard plug-in is up!')
  }

  showbookings() {
    this.mybookingsTarget.classList.toggle("d-none");
    console.log('bookings')


  }
  showpendings() {
    this.mybookingsTarget.classList.toggle('d-none')
    console.log('pendings')


  }
  showboats() {
    this.mybookingsTarget.classList.toggle('d-none')
    console.log('bookings')

  }
}

