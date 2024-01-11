import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookings"
export default class extends Controller {
  static values = {
    id: Number
  }

  connect() {
   
  }
  
  delete_booking(event) {
    event.preventDefault()
    const csrfToken = document.querySelector('[name=csrf-token]').content;
    const url = `bookings/${this.idValue}`
    fetch(url, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'text/html',
      },
    })
    .then(res => res.text())
    .then((data) => {
      this.element.remove()
    })
  }
}
