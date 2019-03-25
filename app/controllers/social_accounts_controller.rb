class SocialAccountsController < ApplicationController
  before_action :set_social_account, only: [:show, :edit, :update, :destroy]



  # GET /social_accounts
  # GET /social_accounts.json
  def index
    @social_accounts = SocialAccount.all
  end

  # GET /social_accounts/1
  # GET /social_accounts/1.json
  def show

  end

  def transfer
    @account_transfer = SocialAccount.find(params[:transferable_id])
  end

  # GET /social_accounts/new
  def new
    @social_account = SocialAccount.new
  end

  # GET /social_accounts/1/edit
  def edit
  end

  # POST /social_accounts
  # POST /social_accounts.json

  def create
    @social_account = SocialAccount.new(social_account_params)
    @social_account.user_id = current_user.id
    @social_account.email = current_user.email

    respond_to do |format|
      if @social_account.save
  
        logger.debug("========")
        logger.debug(params[:account_transfer][:inheritor_email])

        account_transfer = AccountTransfer.new(
          inheritor_email: params[:account_transfer][:inheritor_email],
          transferable_type: "SocialAccount",
          transmitter_id: current_user.id,
          transferable_id: @social_account.id
        )

        inheritor = User.find_by_email(params[:account_transfer][:inheritor_email])
        account_transfer.inheritor_id = inheritor.id if inheritor

        if account_transfer.save
          UserMailer.with(inheritor: @inheritor).welcome_email.deliver_later
          format.html { redirect_to root_url, notice: 'Social account was successfully created.' }
          format.json { render :show, status: :created, location: @social_account }
        else
          format.html { render :new }
          format.json { render json: @social_account.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @social_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_accounts/1
  # PATCH/PUT /social_accounts/1.json
  def update
    respond_to do |format|
      if @social_account.update(social_account_params)
        format.html { redirect_to root_url, notice: 'Social account was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_account }
      else
        format.html { render :edit }
        format.json { render json: @social_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_accounts/1
  # DELETE /social_accounts/1.json
  def destroy
    @social_account.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Social account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private


    # Use callbacks to share common setup or constraints between actions.
    def set_social_account
      @social_account = SocialAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_account_params
      params.require(:social_account).permit(:title, :body, :login, :receiver, :password, :action, :email)
    end
end
