class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
    def index
     @documents = Document.all
     @appoint_responsible = AppointResponsible.new
    end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @appoint_responsible = AppointResponsible.new
  end

  # GET /documents/new
  def new
    @document = Document.new
    @appoint_responsible = AppointResponsible.new
  end

  # GET /documents/1/edit
  def edit
    @appoint_responsible = AppointResponsible.new
  end

  # POST /documents
  # POST /documents.json
  def create
    @appoint_responsible = AppointResponsible.new
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    @document.email = current_user.email


    respond_to do |format|
      if @document.save

      logger.debug("========")
      logger.debug(params[:account_transfer][:inheritor_email])

      account_transfer = AccountTransfer.new(
        inheritor_email: params[:account_transfer][:inheritor_email],
        transferable_type: "Document",
        transmitter_id: current_user.id,
        transferable_id: @document.id
      )

        inheritor = User.find_by_email(params[:account_transfer][:inheritor_email])
        account_transfer.inheritor_id = inheritor.id if inheritor


        if account_transfer.save
          UserMailer.with(inheritor: @inheritor).welcome_email.deliver_later
          format.html { redirect_to root_url, notice: 'Document was successfully created.' }
          format.json { render :show, status: :created, location: @document }
        else
          format.html { render :new }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update

    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to root_url, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:cover, :title, :body, :receiver, :image, :email)
    end
end
