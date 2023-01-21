import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ 'date' ]
  connect() {
    console.log(this.dateTarget) 
    flatpickr(this.dateTarget, { 
        mode: "multiple",
        dateFormat: "Y-m-d",
        inline: true

    }) 
  } 
}