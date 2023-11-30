import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ['start', 'end', 'checkIn']
   
  connect() {
    console.log(this.startTarget, this.endTarget, this.checkInTarget)
    flatpickr(this.checkInTarget, {
      mode: "range",
      onChange: ([start, end]) => {
        if (start && end) {
          this.startTarget.value = start;
          this.endTarget.value = end;
        }
      }
    });
  }
}
