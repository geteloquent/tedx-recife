class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      flash[:success] = 'Obrigado pelo interesse, responderemos em breve. :)'
    end
  end

  private

  def subscription_params
    params.require(:subscription).
      permit(:name, :email, :cpf, :birthday, :corporation, :message, :social_networks)
  end
end
