class PeopleController < ApplicationController
  def index
    @title = "Team"
  	@people = Person.all
  end
end
