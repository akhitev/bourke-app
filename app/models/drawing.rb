class Drawing < ActiveRecord::Base
  attr_accessible :drawing, :location, :project

  #TODO consider paperclip for realword app

end
