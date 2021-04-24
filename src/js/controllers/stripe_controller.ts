import { Controller } from "stimulus";
import { loadStripe } from "@stripe/stripe-js/pure";

export default class extends Controller {
  static values = { price: String };

  readonly priceValue!: string;
  stripePublicKey!: string;

  connect() {
    if (process.env.NODE_ENV === "production") {
      this.stripePublicKey =
        "pk_live_51IjqcoBR9CrjHMLPaYuuJp19N672zo5yceJoRg4txEZTl67UATYwuXE8KSbuWPonTiCxsqAwCWa6HughucmeAHdr00vewBj17Q";
    } else {
      this.stripePublicKey =
        "pk_test_51IjqcoBR9CrjHMLPFShvInzb7roifRDMXdNqJzOWGIPVN7cCaXqTs9P3kJmEcIUSdsRLEFfaugjjSdeFWqUxHupx00rwdCnsTE";
    }
  }

  redirectToCheckout(): void {
    const priceId = this.priceValue;
    const stripePublicKey = this.stripePublicKey;

    this.createCheckoutSession(priceId).then((data) => {
      // Call Stripe.js method to redirect to the new Checkout page
      loadStripe(stripePublicKey).then(function (stripeConnection) {
        if (stripeConnection == null) {
          return;
        }

        stripeConnection.redirectToCheckout({
          sessionId: data.session_id,
        });
      });
    });
  }

  private createCheckoutSession(priceId: string) {
    return fetch("/api/subscriptions/new", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        price_id: priceId,
      }),
    }).then(function (result) {
      return result.json();
    });
  }

  redirectToBillingPortal(): void {
    this.createBillingPortalSession().then((data) => {
      if (data.url !== undefined) {
        window.location.href = data.url;
      }
    });
  }

  private createBillingPortalSession() {
    return fetch("/api/subscriptions/edit", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
    }).then(function (result) {
      return result.json();
    });
  }
}
