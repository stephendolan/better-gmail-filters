module Stripe::SignatureVerification
  TIMESTAMP_GAP_TOLERANCE_SECONDS = 10

  macro included
    before verify_stripe_signature
  end

  class StripeSignatureHeader
    getter timestamp : String
    getter v1_scheme : String

    def initialize(header_string : String)
      signature_components = header_string.split(",")

      @timestamp = signature_components[0].split("=").last
      @v1_scheme = signature_components[1].split("=").last
    end
  end

  private def verify_stripe_signature
    signature = StripeSignatureHeader.new(request.headers["stripe-signature"])

    if signature_timestamp_too_old?(signature)
      head :forbidden
    elsif signatures_match?(signature)
      continue
    else
      head :forbidden
    end
  end

  private def signatures_match?(signature : StripeSignatureHeader) : Bool
    signed_payload = "#{signature.timestamp}.#{request.body}"

    expected_signature = OpenSSL::HMAC.hexdigest(
      algorithm: OpenSSL::Algorithm::SHA256,
      key: Stripe.settings.webhook_signing_secret,
      data: signed_payload
    )

    expected_signature == signature.v1_scheme
  end

  private def signature_timestamp_too_old?(signature : StripeSignatureHeader) : Bool
    signature_timestamp = Time.unix(signature.timestamp.to_i)
    current_timestamp = Time.utc
    timestamp_gap = current_timestamp - signature_timestamp

    timestamp_gap.seconds > TIMESTAMP_GAP_TOLERANCE_SECONDS
  end
end
