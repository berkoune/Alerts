class AlarmTasksController < ApplicationController
  # GET /alarm_tasks
  # GET /alarm_tasks.json
  def index
    @alarm_tasks = ''

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alarm_tasks }
    end
  end

  # GET /alarm_tasks/1
  # GET /alarm_tasks/1.json
  def show
    @alarm_task = AlarmTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alarm_task }
    end
  end

  # GET /alarm_tasks/new
  # GET /alarm_tasks/new.json
  def new
    @alarm_task = AlarmTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alarm_task }
    end
  end

  # GET /alarm_tasks/1/edit
  def edit
    @alarm_task = AlarmTask.find(params[:id])
  end

  # POST /alarm_tasks
  # POST /alarm_tasks.json
  def create
    @alarm_task = AlarmTask.new(params[:alarm_task])

    respond_to do |format|
      if @alarm_task.save
        format.html { redirect_to @alarm_task, notice: 'Alarm task was successfully created.' }
        format.json { render json: @alarm_task, status: :created, location: @alarm_task }
      else
        format.html { render action: "new" }
        format.json { render json: @alarm_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alarm_tasks/1
  # PUT /alarm_tasks/1.json
  def update
    @alarm_task = AlarmTask.find(params[:id])

    respond_to do |format|
      if @alarm_task.update_attributes(params[:alarm_task])
        format.html { redirect_to @alarm_task, notice: 'Alarm task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @alarm_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alarm_tasks/1
  # DELETE /alarm_tasks/1.json
  def destroy
    @alarm_task = AlarmTask.find(params[:id])
    @alarm_task.destroy

    respond_to do |format|
      format.html { redirect_to alarm_tasks_url }
      format.json { head :ok }
    end
  end
end
