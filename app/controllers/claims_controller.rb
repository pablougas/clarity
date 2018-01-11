class ClaimsController < ApplicationController
    layout 'web_application'
    before_filter :authorize
    before_action :set_claim, only:[:show, :edit]

    def index
        @policies = Policy.all
    end

    def show
    end

    def edit
    end

    def destroy
    end

    private
    def set_claim
        @claim = Claim.find(params[:id])
    end
end
