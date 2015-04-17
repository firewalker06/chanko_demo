class HomeController < ApplicationController
  def index
    invoke(:is_bigger_means_better, :index) do
      # do nothing yet, just render views
    end
  end
end
