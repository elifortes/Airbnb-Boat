import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-booking"
export default class extends Controller {
  static targets = ["status", "bookings"]

  connect() {
    console.log('update status up & running!')
  }

  update(event) {
    //event.preventDefault();
    fetch(this.statusTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.statusTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log('update!')
        console.log(data)
      })
  }
}

