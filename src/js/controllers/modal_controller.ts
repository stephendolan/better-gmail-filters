import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];

  readonly modalTarget!: HTMLElement;

  show(): void {
    this.modalTarget.classList.remove("hidden");

    this.setInputFocus();
  }

  hide(): void {
    this.modalTarget.classList.add("hidden");
  }

  private setInputFocus(): void {
    const autofocusInput = this.modalTarget.querySelector(
      "[autofocus]"
    ) as HTMLInputElement;

    if (autofocusInput) {
      autofocusInput.focus();
      this.setCursorToEnd(autofocusInput);
    }
  }

  private setCursorToEnd(element: HTMLInputElement): void {
    const initialValue = element.value;
    element.value = "";
    element.value = initialValue;
  }
}
