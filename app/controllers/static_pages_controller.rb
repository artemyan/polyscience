class StaticPagesController < ApplicationController

  def index
    @groups_count = Group.count
    @scientists_count = Scientist.count
  end

end
