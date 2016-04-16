class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
  end

  def create
    entry_data = params["entry"].permit("title","contents")
    entry = Entry.new(entry_data)
    entry.date = Date.today
    entry.save
    redirect_to(entry_path(entry))
  end

  def edit
    @entry = Entry.find(params["id"])
  end

  def update
    entry_data = params["entry"].permit("title","contents")
    entry = Entry.find(params["id"])
    entry.update(entry_data)
    redirect_to(entry_path)
  end

  def show
    @entry = Entry.find(params["id"])
  end

end
