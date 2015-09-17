class FilmsController < ApplicationController
	
  before_action :authenticate_user!

  def index

  end

  def new
    @film = Film.new
  end  

  def create
    @film = current_user.films.new(film_params)
    if @film.save
      redirect_to films_path, :notice => 'Film was successfully created.'
    else
      render :action => "new"
    end
  end

private
  def film_params
    params.require(:film).permit(:title, galleries_attributes: [:id, :snapshot, :_destroy])
  end

end
