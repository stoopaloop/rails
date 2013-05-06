class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  
  layout('idea')
  
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
    def new
    @idea = Idea.new(:user_id => @user.id)
	@idea.user = current_user
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /thoughts/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @idea = Idea.new(params[:idea])

   respond_to do |format|
      if @idea.save
        format.html { redirect_to "index", notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        flash[:notice] = "Idea not created!"
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thoughts/1
  # PUT /thoughts/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    render("index")
    
  end
end

private
  
  def find_user
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
    end
  end

#def find_subject
    #if params[:user_id]
     # @user = User.find_by_id(params[:user_id])
    #end
  
#end