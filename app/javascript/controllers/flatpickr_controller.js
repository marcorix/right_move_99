import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['start', 'end', 'checkIn', 'total']
  static values = {
    price: Number
  }

  connect() {

    flatpickr(this.checkInTarget, {
      mode: "range",
      onChange: ([start, end]) => {
        if (start && end) {
          this.startTarget.value = start;
          this.endTarget.value = end;
        }
        this.calculateDays();
      }
    });
  }

  calculateDays() {
    const start = new Date(this.startTarget.value);
    const end = new Date(this.endTarget.value);
    const diffTime = Math.abs(end - start);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    const totalPrice = diffDays * this.priceValue
    this.totalTarget.innerText = totalPrice.toFixed(2);
  }

}
