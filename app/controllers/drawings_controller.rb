class DrawingsController < ApplicationController
  # GET /drawings
  # GET /drawings.json
  def index
    @drawings = Drawing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drawings }
    end
  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show
    @drawing = Drawing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drawing }
    end
  end

  # GET /drawings/new
  # GET /drawings/new.json
  def new
    @drawing = Drawing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drawing }
    end
  end

  def upload
    uploaded_io = params[:file]
    File.open(Rails.root.join('uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    parser = DrawingParser.new
    parser.delay.parse_and_save(Rails.root.join('uploads', uploaded_io.original_filename));
    render :layout => false, :status => (:ok)
  rescue e
      @error = e.message
      logger.warn("upload failed " + e.stack_trace)
      render :layout => false, :status => (:error)
  end


    # POST /drawings
  # POST /drawings.json
  def create
    @drawing = Drawing.new(params[:drawing])

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to @drawing, notice: 'Drawing was successfully created.' }
        format.json { render json: @drawing, status: :created, location: @drawing }
      else
        format.html { render action: "new" }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end
end
