class ResponsibilityTransfersController < ApplicationController
  before_action :set_responsibility_transfer, only: [:show, :edit, :update, :destroy]

  # GET /responsibility_transfers
  # GET /responsibility_transfers.json
  def index
    @responsibility_transfers = ResponsibilityTransfer.all
  end

  # GET /responsibility_transfers/1
  # GET /responsibility_transfers/1.json
  def show
  end

  # GET /responsibility_transfers/new
  def new
    @responsibility_transfer = ResponsibilityTransfer.new
  end

  # GET /responsibility_transfers/1/edit
  def edit
  end

  # POST /responsibility_transfers
  # POST /responsibility_transfers.json
  def create
    @responsibility_transfer = ResponsibilityTransfer.new(responsibility_transfer_params)


    respond_to do |format|
      if @responsibility_transfer.save
        format.html { redirect_to appoint_responsibles_path, notice: 'Responsibility transfer was successfully created.' }
        format.json { render :show, status: :created, location: @responsibility_transfer }
      else
        format.html { render :new }
        format.json { render json: @responsibility_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibility_transfers/1
  # PATCH/PUT /responsibility_transfers/1.json
  def update
    respond_to do |format|
      if @responsibility_transfer.update(responsibility_transfer_params)
        format.html { redirect_to @responsibility_transfer, notice: 'Responsibility transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsibility_transfer }
      else
        format.html { render :edit }
        format.json { render json: @responsibility_transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibility_transfers/1
  # DELETE /responsibility_transfers/1.json
  def destroy
    @responsibility_transfer.destroy
    respond_to do |format|
      format.html { redirect_to appoint_responsibles_path, notice: 'Responsibility transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end







  def accept_responsibility
    @inherited_responsibility = AppointResponsible.find(params[:id])
    @responsibility_transfer = @inherited_responsibility.responsibility_transfers.where(inheritor_id: current_user.id)[0]
    @responsibility_transfer.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_responsibility
    @inherited_responsibility = AppointResponsible.find(params[:id])
    @responsibility_transfer = @inherited_responsibility.responsibility_transfers.where(inheritor_id: current_user.id)[0]
    @responsibility_transfer.destroy!
    redirect_to obtain_index_path
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsibility_transfer
      @responsibility_transfer = ResponsibilityTransfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsibility_transfer_params
      params.require(:responsibility_transfer).permit(:inheritor_email, :transmitter_id, :inheritor_id, :r_transferable_id, :r_transferable_type, :accepted)
    end
end
