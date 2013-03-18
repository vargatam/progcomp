class ProblemsController < ApplicationController
  before_filter :get_competition
  # GET /problems
  # GET /problems.json
  def index
    @problems = @competition.header_problems
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = @competition.problems.build()
    @problem.parent_id = params[:parent_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = @competition.problems.build(params[:problem])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to competition_problem_url(@competition, @problem.parent_top), notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to competition_problem_url(@competition, @problem), notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    parent = @problem.parent
    @problem.destroy

    respond_to do |format|
      format.html do
        redirect_to :back
      end
      format.json { head :no_content }
    end
  end
  def get_competition
    @competition = Competition.find(params[:competition_id])
    #|| Competition.default  -- TODO this doesn't work with routes conf as of now
  end
end
