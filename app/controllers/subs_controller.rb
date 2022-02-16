class SubsController < ApplicationController
  before_action :set_sub, only: %i[ show edit update destroy ]
  before_action :require_logged_in!, only: %i[new create]
  before_action :require_moderator!, only: %i[edit update destroy]

  # GET /subs or /subs.json
  def index
    @subs = Sub.all
  end

  # GET /subs/1 or /subs/1.json
  def show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
  end

  # POST /subs or /subs.json
  def create
    @sub = current_user.subs.new(sub_params)

    respond_to do |format|
      if @sub.save
        format.html { redirect_to sub_url(@sub), notice: "Sub was successfully created." }
        format.json { render :show, status: :created, location: @sub }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subs/1 or /subs/1.json
  def update
    respond_to do |format|
      if @sub.update(sub_params)
        format.html { redirect_to sub_url(@sub), notice: "Sub was successfully updated." }
        format.json { render :show, status: :ok, location: @sub }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subs/1 or /subs/1.json
  def destroy
    @sub.destroy

    respond_to do |format|
      format.html { redirect_to subs_url, notice: "Sub was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_params
      params.require(:sub).permit(:title, :description, :moderator_id)
    end
    
    def require_moderator!
      return if current_user.id == @sub.moderator_id
      redirect_to subs_url
    end
end
