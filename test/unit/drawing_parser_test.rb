require 'test_helper'

  describe DrawingParser do
    before(:each) do
      @parser = DrawingParser.new
    end

    it "should parse needed attributes " do
      #clean previous result
      txt_file = Rails.root.join('doc', "sample_drawing.txt")
      puts `rm  #{txt_file}`
      drawing = @parser.parse_and_save(Rails.root.join('doc',"sample_drawing.pdf"))
      check_drawing drawing
    end

    it "should parse txt file " do
      drawing = @parser.process_txt(Rails.root.join('doc',"sample_drawing.pdf"))
      check_drawing drawing
    end

    it "should get txt file name from pdf" do
      @parser.txt_file_name("home/alex/dev/project/app/doc/sample_file.pdf").must_equal("home/alex/dev/project/app/doc/sample_file.txt")
    end



    def check_drawing drawing
      drawing.must_be_instance_of Drawing
      drawing[:project].must_equal "OFFICE EXTENSION"
      drawing[:location].must_equal "755 - 763 HUNTER STREET NEWCASTLE"
      drawing[:drawing].must_equal "LEVEL 01 - FLOORPLAN"
    end
end
