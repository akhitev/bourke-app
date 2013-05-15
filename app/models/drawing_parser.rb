class DrawingParser
  @@command_path = "pdftotext"

  def self.command_path
    @@command_path
  end


  def parse_and_save(file_name)
    Rails.logger.debug "parsing file #{file_name}"
    execute_command(file_name)
    drawing = process_txt(file_name)
    drawing.save
    return drawing
  rescue => e
    Rails.logger.error("error during processing file : #{e.message}")
    return false
  end

  def execute_command file_name
    puts "#{self.class.command_path} "
    output = `#{self.class.command_path} "#{file_name.to_s}" `
    exit_code = $?
    case exit_code
      when 0 || nil
        return output
      else
        Rails.logger.error("Error processing #{file_name} exit code: #{exit_code}")
    end
  end

  def process_txt file_name
    Rails.logger.debug("process txt file #{file_name}")
    drawing = Drawing.new
    f = File.open(txt_file_name(file_name),'r')

    while !f.eof? do
      #TODO need to look on other samples about empty lines
      line = f.readline

      if (line.include? "PROJECT:")
        puts line
        #skip empty line
        f.readline
        drawing[:project] = f.readline.strip
      elsif (line.include? "DRAWING:")
        puts line
        f.readline
        drawing[:drawing] = f.readline.strip
      elsif (line.include? "LOCATION:")
        puts line
        drawing[:location] = line.gsub("LOCATION:","").strip
      end
    end
    return drawing
  end

  def txt_file_name(file_name)

    dirname  = File.dirname(file_name)
    basename = File.basename(file_name, ".*")
    txt_name = dirname + "/" + basename + ".txt"
    puts " txt_name " + txt_name.to_s
    return txt_name.to_s
  end

  end