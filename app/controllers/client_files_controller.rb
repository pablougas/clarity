class ClientFilesController < ApplicationController
    layout 'web_application'
    before_filter :authorize
    before_action :set_file, only: [:show, :edit, :update, :destroy]

    # GET /users
    # GET /users.json
    def index
        @client_files = ClientFile.all
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
        @client_file = ClientFile.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
        @client_file = ClientFile.new(file_params)

        respond_to do |format|
            if @client_file.save
                format.html { redirect_to @client_file, notice: 'Client File was successfully created.' }
                format.json { render :show, status: :created, location: @client_file }
            else
                format.html { render :new }
                format.json { render json: @client_file.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        respond_to do |format|
            if @client_file.update(file_params)
                format.html { redirect_to @client_file, notice: 'Client File was successfully updated.' }
                format.json { render :show, status: :ok, location: @client_file }
            else
                format.html { render :edit }
                format.json { render json: @client_file.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @client_file.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'ClientFile was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_file
        @client_file = ClientFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_params
        params.require(:user).permit(:client_number, :last, :street, :city, :state, :zip, :email, :password, :password_confirmation)
    end
end
