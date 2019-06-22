class DeathCertificatesController < ApplicationController
  before_action :set_death_certificate, only: [:show, :edit, :update, :destroy]

  # GET /death_certificates
  # GET /death_certificates.json
  def index
    @death_certificates = DeathCertificate.all
  end

  # GET /death_certificates/1
  # GET /death_certificates/1.json
  def show
  end

  # GET /death_certificates/new
  def new
    @death_certificate = DeathCertificate.new
  end

  # GET /death_certificates/1/edit
  def edit
  end

  # POST /death_certificates
  # POST /death_certificates.json
  def create
    @death_certificate = DeathCertificate.new(death_certificate_params)

    respond_to do |format|
      if @death_certificate.save
        format.html { redirect_to @death_certificate, notice: 'Death certificate was successfully created.' }
        format.json { render :show, status: :created, location: @death_certificate }
      else
        format.html { render :new }
        format.json { render json: @death_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /death_certificates/1
  # PATCH/PUT /death_certificates/1.json
  def update
    respond_to do |format|
      if @death_certificate.update(death_certificate_params)
        format.html { redirect_to @death_certificate, notice: 'Death certificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @death_certificate }
      else
        format.html { render :edit }
        format.json { render json: @death_certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /death_certificates/1
  # DELETE /death_certificates/1.json
  def destroy
    @death_certificate.destroy
    respond_to do |format|
      format.html { redirect_to death_certificates_url, notice: 'Death certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_death_certificate
      @death_certificate = DeathCertificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  
    def death_certificate_params
      params.require(:death_certificate).permit(:file)
    end
end
