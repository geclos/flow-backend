module Public
  class HomeController < ApplicationController
    def index
      @signup = Signup.new
      @title = I18n.t('home.index.title')
      @description = I18n.t('home.index.description')
    end
  end
end
