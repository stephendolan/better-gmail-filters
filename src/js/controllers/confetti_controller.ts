import { Controller } from "@hotwired/stimulus";
import confetti from "canvas-confetti";

export default class extends Controller {
  connect(): void {
    confetti({
      particleCount: 100,
      spread: 90,
      disableForReducedMotion: true,
    });
  }
}
