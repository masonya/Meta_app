class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]

  # GET /wallets
  # GET /wallets.json
  def index
    @wallets = Wallet.all
    @appoint_responsible = AppointResponsible.new
  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
    @appoint_responsible = AppointResponsible.new
  end

  # GET /wallets/new
  def new
    @wallet = Wallet.new
    @appoint_responsible = AppointResponsible.new
  end

  # GET /wallets/1/edit
  def edit
    @appoint_responsible = AppointResponsible.new
  end

  # POST /wallets
  # POST /wallets.json
  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user_id = current_user.id
    @wallet.email = current_user.email


    respond_to do |format|
      if @wallet.save

      logger.debug("========")
      logger.debug(params[:account_transfer][:inheritor_email])

      account_transfer = AccountTransfer.new(
        inheritor_email: params[:account_transfer][:inheritor_email],
        transferable_type: "Wallet",
        transmitter_id: current_user.id,
        transferable_id: @wallet.id
      )

        inheritor = User.find_by_email(params[:account_transfer][:inheritor_email])
        account_transfer.inheritor_id = inheritor.id if inheritor

        if account_transfer.save
          UserMailer.with(inheritor: @inheritor).welcome_email.deliver_later
          format.html { redirect_to root_url, notice: 'Wallet was successfully created.' }
          format.json { render :show, status: :created, location: @wallet }
        else
          format.html { render :new }
          format.json { render json: @wallet.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1
  # PATCH/PUT /wallets/1.json
  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to root_url, notice: 'Wallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1
  # DELETE /wallets/1.json
  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_params
      params.require(:wallet).permit(:title, :body, :receiver, :login, :password, :email, :action)
    end
end
