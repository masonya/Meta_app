class SocialAccountsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_social_account, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_user, only: [:edit, :update, :destroy, :index]



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


          AccountTransfer.create(
            inheritor_email: params[:account_transfer][:inheritor_email],
            transmitter_id: current_user.id,
            transferable_id: @social_account.id,
            inheritor_id: User.find_by_email(params[:account_transfer][:inheritor_email]).id
          )


        # SocialAccount.create(
        #   email: current_user.email
        # )

        format.html { redirect_to root_url, notice: 'Social account was successfully created.' }
        format.json { render :show, status: :created, location: @social_account }
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

    # def authorize_user
    #   if @social_account.user_id != current_user.id
    # end


    # Use callbacks to share common setup or constraints between actions.
    def set_social_account
      @social_account = SocialAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_account_params
      params.require(:social_account).permit(:title, :body, :login, :receiver, :password, :action, :email)
    end
end
