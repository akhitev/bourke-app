require 'test_helper'

describe Drawing do
  before do
    @drawing = Drawing.new
  end

  it "should have drawing " do
    @drawing.must_respond_to(:drawing)
  end



end