class DrawingParser
  def parse(file)
    reader = PDF::Reader.new(file)
    #TODO are we support only 1 page docs?
    page = reader.page(1)
    puts page.fonts
    puts page.text
    puts page.raw_content
    return Drawing.new
  rescue e
    logger.error("error during processing file #{file.name} : #{e.message}")
  end
end