class Api::NotesController < ApplicationController

  before_action :set_note, only: [:update, :destroy]

  # GET /notes
  def index
    @notes = Note.order('updated_at DESC')
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render :show, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render :show, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy!
    head :no_content
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.fetch(:note, {}).permit(
          :body
      )
    end
end
