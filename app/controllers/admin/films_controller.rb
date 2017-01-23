class Admin::FilmsController < ApplicationController
  
  def index
    @films = Film.sorted
  end

  def show
    @film = Film.find(params[:id])
    @film_actors = @film.actors
    @film_category = @film.category
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      flash[:notice] = "Film '#{@film.title}' created. "
      redirect_to(admin_films_path)
    else
      render('new')
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update_attributes(film_params)
      flash[:notice] = "Film '#{@film.title}' updated. "
      redirect_to(admin_films_path)
    else
      render('edit')
    end
  end

  def delete
    @film = Film.find(params[:id])
  end

  def destroy
    @film = Film.find(params[:id])
    if @film.destroy
      flash[:notice] = "Film '#{@film.title}' deleted. "
      redirect_to(admin_films_path)
    end
  end

  private
    def film_params
      params.require(:film).permit(:title, :language_id, :rental_duration, :rental_rate, :replacement_cost, :release_year, :description, :rating, :special_features)
    end

end