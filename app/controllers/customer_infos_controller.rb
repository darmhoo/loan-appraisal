class CustomerInfosController < ApplicationController
  before_action :set_customer_info, only: %i[ show edit update destroy ]

  # GET /customer_infos or /customer_infos.json
  def index
    @customer_infos = CustomerInfo.all
  end

  # GET /customer_infos/1 or /customer_infos/1.json
  def show
  end

  # GET /customer_infos/new
  def new
    @customer_info = CustomerInfo.new
  end

  # GET /customer_infos/1/edit
  def edit
  end

  # POST /customer_infos or /customer_infos.json
  def create
    @customer_info = CustomerInfo.new(customer_info_params)

    respond_to do |format|
      if @customer_info.save
        format.html { redirect_to @customer_info, notice: "Customer info was successfully created." }
        format.json { render :show, status: :created, location: @customer_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_infos/1 or /customer_infos/1.json
  def update
    respond_to do |format|
      if @customer_info.update(customer_info_params)
        format.html { redirect_to @customer_info, notice: "Customer info was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_infos/1 or /customer_infos/1.json
  def destroy
    @customer_info.destroy!

    respond_to do |format|
      format.html { redirect_to customer_infos_path, status: :see_other, notice: "Customer info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_info
      @customer_info = CustomerInfo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def customer_info_params
      params.expect(customer_info: [ :full_name, :contact, :identication, :employment, :employer, :income, :expenses ])
    end
end
