class AccountTransfersController < ApplicationController
  before_action :set_account_transfer, only: [:show, :edit, :update, :destroy]



  # GET /account_transfers
  # GET /account_transfers.json
  def index
    @account_transfers = AccountTransfer.all
    @appoint_responsible = AppointResponsible.new
  end

  # GET /account_transfers/1
  # GET /account_transfers/1.json
  def show

  end


  # GET /account_transfers/new
  def new
    @account_transfer = AccountTransfer.new
    @appoint_responsible = AppointResponsible.new
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




  def accept_social_account
    @inherited_account = SocialAccount.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_social_account
    @inherited_account = SocialAccount.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.destroy!
    redirect_to obtain_index_path
  end


  def accept_document
    @inherited_account = Document.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_document
    @inherited_account = Document.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.destroy!
    redirect_to obtain_index_path
  end


  def accept_wallet
    @inherited_account = Wallet.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_wallet
    @inherited_account = Wallet.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.destroy!
    redirect_to obtain_index_path
  end


  def accept_subscription
    @inherited_account = Subscription.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_subscription
    @inherited_account = Subscription.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.destroy!
    redirect_to obtain_index_path
  end


  def accept_instruction
    @inherited_account = Instruction.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_instruction
    @inherited_account = Instruction.find(params[:id])
    @account_transfer = @inherited_account.account_transfers.where(inheritor_id: current_user.id)[0]
    @account_transfer.destroy!
    redirect_to obtain_index_path
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
      params.require(:account_transfer).permit(:email, :transmitter_id, :inheritor_id, :transferable_id, :accepted, :checked)
    end
end
