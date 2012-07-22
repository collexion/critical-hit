class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :member_type
  attr_accessible :amount, :references, :strip_customer_token

  validates_presence_of :member_type_id

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: member_type_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
