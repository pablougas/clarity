class DashboardsController < ApplicationController
    layout 'web_application'
    before_filter :authorize

    def index
        @policies = Policy.all
    end

end
