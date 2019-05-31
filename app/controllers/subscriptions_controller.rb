class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all
    @appoint_responsible = AppointResponsible.new
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show

  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    @appoint_responsible = AppointResponsible.new
  end

  # GET /subscriptions/1/edit
  def edit
    @appoint_responsible = AppointResponsible.new
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id
    @subscription.email = current_user.email

    respond_to do |format|
      if @subscription.save

      logger.debug("========")
      logger.debug(params[:account_transfer][:inheritor_email])

      account_transfer = AccountTransfer.new(
        inheritor_email: params[:account_transfer][:inheritor_email],
        transferable_type: "Subscription",
        transmitter_id: current_user.id,
        transferable_id: @subscription.id
      )

        inheritor = User.find_by_email(params[:account_transfer][:inheritor_email])
        account_transfer.inheritor_id = inheritor.id if inheritor

        if account_transfer.save
          UserMailer.with(inheritor: @inheritor).welcome_email.deliver_later
          format.html { redirect_to root_url, notice: 'Subscription was successfully created.' }
          format.json { render :show, status: :created, location: @subscription }
        else
          format.html { render :new }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to root_url, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:title, :body, :receiver, :login, :password, :email)
    end
end
