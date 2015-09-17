class FilmsController < ApplicationController
	
  before_action :authenticate_user!

  def index
    @films = current_user.films
  end

  def new
    @film = Film.new
    @film.galleries.build
  end  

  def create
    @film = current_user.films.new(film_params)
    if @film.save
      redirect_to films_path, :notice => 'Film was successfully created.'
    else
      render :action => "new"
    end
  end

  def show
    @film = Film.find(params[:id])
  end

  def destroy
    @film = Film.find(params[:id])
    if @film.user ==  current_user
      @film.destroy
      redirect_to films_path, :notice => 'Film was successfully deleted.'
    else
      redirect_to films_path, :alert => 'Film not belong to you.'
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])

    if @film.user ==  current_user
      if @film.update(film_params)
        redirect_to films_path, :notice => 'Film was successfully updated.'
      else
        render 'edit'
      end
    else
      redirect_to films_path, :alert => 'Film not belong to you.'
    end
  end



private
  def film_params
    params.require(:film).permit(:title, galleries_attributes: [:id, :snapshot, :_destroy])
  end

end
