class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.order(start_date: :desc)
  end

  def show
    set_meta_tags title: @event.name,
                  description: [@event.location, @event.start_date, @event.end_date].join(" - "),
                  og: { type: "article" },
                  type: "article",
                  published_time: @event.created_at.iso8601
  end

  def new
    @event = Event.new
    set_meta_tags title: "New event"
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :location, :start_date, :end_date, :twitter, :video_link)
    end
end
