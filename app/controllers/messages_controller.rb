class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]

  # Example: load API_TOKEN_EXAMPLE (set in .env, wired up in config/application.rb)
  # and require it as a bearer token on every request.
  #
  # before_action :authenticate_with_api_token
  #
  # def authenticate_with_api_token
  #   api_token = Rails.configuration.x.api_token_example
  #   provided  = request.headers["Authorization"].to_s.delete_prefix("Bearer ")
  #
  #   head :unauthorized unless ActiveSupport::SecurityUtils.secure_compare(provided, api_token.to_s)
  # end

  def index
    render json: Message.all
  end

  def show
    render json: @message
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_content
    end
  end

  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_content
    end
  end

  def destroy
    @message.destroy!
  end

  private
    def set_message
      @message = Message.find(params.expect(:id))
    end

    def message_params
      params.expect(message: [ :content ])
    end
end
