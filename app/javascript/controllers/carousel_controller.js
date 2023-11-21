import { Controller } from "@hotwired/stimulus"
import bootstrap from "bootstrap";

// Connects to data-controller="carousel"


// export default class extends Controller {
//   connect() {
//   }
// }

// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
    // Assuming your carousel has an id of 'carouselExampleIndicators'
    var carouselElement = document.getElementById('carouselExampleIndicators');

    // Initialize the Bootstrap carousel
    var carouselInstance = new bootstrap.Carousel(carouselElement, {
      interval: 2000, // The amount of time to delay between automatically cycling an item. If false, carousel will not automatically cycle.
      wrap: true // Whether the carousel should cycle continuously or have hard stops.
    });

    console.log('Carousel is now initialized!');
  }
}
