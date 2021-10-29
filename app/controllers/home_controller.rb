class HomeController < ApplicationController
  skip_before_action :authenticate_user

  def index
  end
  def quote
  end
  def commercial
  end
  def residential
  end
end
