import { Controller } from "stimulus";

// Toggle elements on and off. Mainly used for items like popup/navigation menus.
//
// This behavior requires that `aria-expanded` is defined on each `toggleable` target.
export default class extends Controller {
  static get targets(): Array<string> {
    return ["toggleable"];
  }

  readonly toggleableTargets!: Array<HTMLElement>;

  toggle(event: MouseEvent): void {
    this.toggleableTargets.forEach((toggleable) => {
      if (toggleable.getAttribute("aria-expanded") == "false") {
        this.show(toggleable);
      } else {
        this.hide(toggleable);
      }
    });
  }

  clickOutside(event: MouseEvent) {
    if (this.element.contains(event.target as Node)) {
      return;
    }

    this.toggleableTargets.forEach((toggleable) => {
      this.hide(toggleable);
    });
  }

  private show(element: HTMLElement) {
    element.setAttribute("aria-expanded", "true");
    element.classList.remove("hidden");
  }

  private hide(element: HTMLElement) {
    element.setAttribute("aria-expanded", "false");
    element.classList.add("hidden");
  }
}
