class HomeController < ApplicationController
  def index 
    @welcome_message = 'Hello, i\'m a dynamic text.'
  end

  def turbo_frame_test
  end
end