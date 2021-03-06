class InstructionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]


  # GET /instructions
  # GET /instructions.json
  def index
    @instructions = Instruction.all
    @appoint_responsible = AppointResponsible.new
  end

  # GET /instructions/1
  # GET /instructions/1.json
  def show

  end

  # GET /instructions/new
  def new
    @instruction = Instruction.new
    @appoint_responsible = AppointResponsible.new
  end

  # GET /instructions/1/edit
  def edit
    @appoint_responsible = AppointResponsible.new
  end

  # POST /instructions
  # POST /instructions.json
  def create
    @appoint_responsible = AppointResponsible.new
    @instruction = Instruction.new(instruction_params)
    @instruction.user_id = current_user.id
    @instruction.email = current_user.email

    respond_to do |format|
      if @instruction.save

      logger.debug("========")
      logger.debug(params[:account_transfer][:inheritor_email])

      account_transfer = AccountTransfer.new(
        inheritor_email: params[:account_transfer][:inheritor_email],
        transferable_type: "Instruction",
        transmitter_id: current_user.id,
        transferable_id: @instruction.id
      )

        inheritor = User.find_by_email(params[:account_transfer][:inheritor_email])
        account_transfer.inheritor_id = inheritor.id if inheritor

        if account_transfer.save
          UserMailer.with(inheritor: @inheritor).welcome_email.deliver_later
          format.html { redirect_to root_url, notice: 'Instruction was successfully created.' }
          format.json { render :show, status: :created, location: @instruction }
        else
          format.html { render :new }
          format.json { render json: @instruction.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update
    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to root_url, notice: 'Instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:title, :body, :receiver, :email)
    end
end
