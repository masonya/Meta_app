class AppointResponsiblesController < ApplicationController
  before_action :set_appoint_responsible, only: [:show, :edit, :update, :destroy]

  # GET /appoint_responsibles
  # GET /appoint_responsibles.json
  def index
    @appoint_responsibles = AppointResponsible.all
    # @transfered_responsibilitys = current_user.transfered_responsibilitys
  end

  # GET /appoint_responsibles/1
  # GET /appoint_responsibles/1.json
  def show
  end

  # GET /appoint_responsibles/new
  def new
    @appoint_responsible = AppointResponsible.new
  end

  # GET /appoint_responsibles/1/edit
  def edit
  end

  # POST /appoint_responsibles
  # POST /appoint_responsibles.json
  def create
    @appoint_responsible = AppointResponsible.new(appoint_responsible_params)
    @appoint_responsible.user_id = current_user.id
    @appoint_responsible.email = current_user.email
    @appoint_responsible.inheritor_id = User.find_by_email(@appoint_responsible.inheritor_email).id

    # inheritor = User.find_by_email(params[:inheritor_email])
    # @appoint_responsible.inheritor_id = inheritor.id if inheritor


    respond_to do |format|
      if @appoint_responsible.save

          # inheritor = User.find_by_email(params[:inheritor_email])
          # @appoint_responsible.inheritor_id = inheritor.id


        format.html { redirect_to appoint_responsibles_path, notice: 'Responsibility transfer was successfully created.' }
        format.json { render :show, status: :created, location: @appoint_responsible }


        # responsibility_transfer = ResponsibilityTransfer.new(
        #   inheritor_email: params[:responsibility_transfer][:inheritor_email],
        #   transmitter_id: current_user.id,
        #   r_transferable_id: @appoint_responsible.id,
        #   r_transferable_type: "Responsibility",
        #   transmitter_email: current_user.email
        #   # inheritor_id: User.find_by_email(params[:responsibility_transfer][:inheritor_email]).id
        # )
        #
        #   inheritor = User.find_by_email(params[:responsibility_transfer][:inheritor_email])
        #   responsibility_transfer.inheritor_id = inheritor.id if inheritor
        #
        #
        #   if responsibility_transfer.save
        #     format.html { redirect_to appoint_responsibles_path, notice: 'ResponsibilityTransfer was successfully created.' }
        #     format.json { render :show, status: :created, location: @appoint_responsible }
        #   else
        #     format.html { render :new }
        #     format.json { render json: @appoint_responsible.errors, status: :unprocessable_entity }
        #   end
        else
          format.html { render :new }
          format.json { render json: @appoint_responsible.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /appoint_responsibles/1
  # PATCH/PUT /appoint_responsibles/1.json
  def update
    respond_to do |format|
      if @appoint_responsible.update(appoint_responsible_params)
        format.html { redirect_to @appoint_responsible, notice: 'Appoint responsible was successfully updated.' }
        format.json { render :show, status: :ok, location: @appoint_responsible }
      else
        format.html { render :edit }
        format.json { render json: @appoint_responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoint_responsibles/1
  # DELETE /appoint_responsibles/1.json
  def destroy
    @appoint_responsible.destroy
    respond_to do |format|
      format.html { redirect_to appoint_responsibles_url, notice: 'Appoint responsible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






  def accept_responsibility
    @inherited_responsibility = AppointResponsible.find(params[:id])
    @inherited_responsibility.update!(accepted: true)
    redirect_to obtain_index_path
  end


  def unaccept_responsibility
    @inherited_responsibility = AppointResponsible.find(params[:id])
    @inherited_responsibility.destroy!
    redirect_to obtain_index_path
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appoint_responsible
      @appoint_responsible = AppointResponsible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appoint_responsible_params
      params.require(:appoint_responsible).permit(:email, :user_id, :inheritor_email, :inheritor_id, :accepted)
    end
end
