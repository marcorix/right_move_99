import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-reviews"
export default class extends Controller {
  static targets = ['form', 'list']

  connect() {
    console.log("heila'")
    console.log(this.formTarget)
    console.log(this.listTarget)
  }

  insert(e) {
    e.preventDefault()
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
    .then(res => res.json())
    .then((data) => {
      if (data.inserted_item) {
        this.listTarget.insertAdjacentHTML('beforeend', data.inserted_item)
      }
      this.formTarget.outerHTML = data.form
    })
  }
}
