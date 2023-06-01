import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "star1", "star2", "star3", "star4", "star5" ];

  connect() {
    this.rating = this.inputTarget.value || 0;
    this.hoveredRating = 0;

    const starsContainer = document.createElement("div");
    starsContainer.classList.add("stars-container");
    starsContainer.setAttribute("data-action", "mouseout->stars#ratingHoveredOut");

    for (let i = 1; i <= 5; i++) {
      let star = document.createElement("div");
      star.classList.add("star");
      star.setAttribute("data-stars-target", `star${i}`);
      star.setAttribute("data-action", "mouseover->stars#starHovered click->stars#starClicked")
      starsContainer.append(star);
    }

    this.inputTarget.after(starsContainer);
    this.renderRating();
  }

  starHovered(e) {
    const idx = parseInt(e.target.dataset.starsTarget[4]);
    this.hoveredRating = idx;
    this.renderRating();
  }

  starClicked(e) {
    const idx = parseInt(e.target.dataset.starsTarget[4]);
    this.rating = idx;
    this.inputTarget.value = this.rating;
    this.renderRating();
  }

  ratingHoveredOut(e) {
    this.hoveredRating = 0;
    this.renderRating();
  }

  renderRating() {
    const rating = this.hoveredRating || this.rating;

    for (let i = 1; i <= rating; i++) {
      this[`star${i}Target`].classList.add('active');
    }
    for (let i = rating + 1; i <= 5; i++) {
      this[`star${i}Target`].classList.remove('active');
    }
  }
}
