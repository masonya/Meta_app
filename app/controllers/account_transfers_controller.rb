class AccountTransfersController < ApplicationController
  before_action :set_account_transfer, only: [:show, :edit, :update, :destroy]


  def accept
    @inherited_account = SocialAccount.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    # logger.debug @inherited_account.to_json

    @account_transfer.update!(accepted: true)

    # logger.debug @inherited_account.to_json
    # logger.debug AccountTransfer.find(params[:id]).to_json

    # if @inherited_account.save!
    redirect_to obtain_index_path
    # end
  end




# def accept
#   @inherited_account = AccountTransfer.find_by(params[:transferable_id])
#   if @inherited_account.accepted == false
#     @accepted = @inherited_account.update(accepted: true)
#   else
#     redirect_to obtain_index_path
#   end
#   redirect_to obtain_index_path
# end



  # if @inheritor.present?
  #   def default_values
  #     self.inheritor_id ||= User.find_by(email).id
  #   end
  # end


  # GET /account_transfers
  # GET /account_transfers.json
  def index
    @account_transfers = AccountTransfer.all
  end

  # GET /account_transfers/1
  # GET /account_transfers/1.json
  def show

  end


  # GET /account_transfers/new
  def new
    @account_transfer = AccountTransfer.new
  end

  # GET /account_transfers/1/edit
  def edit
  end

  # POST /account_transfers
  # POST /account_transfers.json
  def create
    @account_transfer = AccountTransfer.new(account_transfer_params)
    @account_transfer.user_id = current_user.id

    respond_to do |format|
      if @account_transfer.save
         UserMailer.with(inheritor_id: @inheritor.id).welcome_email.deliver_later

        format.html { redirect_to root_url, notice: 'Account transfer was successfully created.' }
        format.json { render :show, status: :created, location: @account_transfer }
      else
        format.html { render :new }
        format.json { render json: @account_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_transfers/1
  # PATCH/PUT /account_transfers/1.json
  def update
    respond_to do |format|
      if @account_transfer.update(account_transfer_params)
        format.html { redirect_to @account_transfer, notice: 'Account transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_transfer }
      else
        format.html { render :edit }
        format.json { render json: @account_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_transfers/1
  # DELETE /account_transfers/1.json
  def destroy
    @account_transfer.destroy
    respond_to do |format|
      format.html { redirect_to account_transfers_url, notice: 'Account transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_transfer
      @account_transfer = AccountTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def account_transfer_params
    #   params.fetch(:account_transfer, {})
    # end
    def account_transfer_params
      params.require(:account_transfer).permit(:email, :transmitter_id, :inheritor_id, :transferable_id, :accepted)
    end
end
