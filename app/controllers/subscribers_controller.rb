class SubscribersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @subscribers = Subscriber.subscribed
    render json: @subscribers.to_json(only: :email)
  end

  def create
    @subscriber =
      if subscriber = Subscriber.find_by(email: subscriber_params[:email])
        subscriber.deleted = false
        subscriber
      else
        Subscriber.new subscriber_params
      end

    if @subscriber.save
      SubscriberMailer.subscribed(@subscriber).deliver
      render json: @subscriber.to_json(only: :email), status: 201
    else
      render json: @subscriber.errors, status: 422
    end
  end

  def destroy
    @subscriber = Subscriber.find params[:id]
    @subscriber.deleted = true
    if @subscriber.save
      render json: { success: "#{@subscriber.email} removed from mailing list." }, status: 200
    else
      render json: @subscriber.errors, status: 422
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
