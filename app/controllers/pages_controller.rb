class PagesController < ApplicationController
  def home
    @pigs = Pig.all.sample(3)
  end
end
