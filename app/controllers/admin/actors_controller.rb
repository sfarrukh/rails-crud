class Admin::ActorsController < ApplicationController

  def index
    @actors = Actor.sorted
  end

  def show
    @actor = Actor.find(params[:id])
    @actor_films = @actor.films

    @films = Film.sorted

    # @film_actor = FilmActor.new
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:notice] = "Actor '#{@actor.full_name}' created. "
      redirect_to(admin_actors_path)
    else
      render('new')
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(actor_params)
      flash[:notice] = "Actor '#{@actor.full_name}' updated. "
      redirect_to(admin_actors_path(@actor))
    else
      render('edit')
    end      
  end

  def delete
    @actor = Actor.find(params[:id])
  end

  def destroy
    @actor = Actor.find(params[:id])
    if @actor.destroy
      flash[:notice] = "Actor '#{@actor.full_name}' deleted. "
      redirect_to(admin_actors_path)
    end
  end

  def add_film
    @actor = Actor.find(params[:actor_id])
    @film = Film.find(params[:film_id])

    if @actor.films << @film
      redirect_to(admin_actor_movies_path(:actor_id))
    end
  end

  private
    def actor_params
      params.require(:actor).permit(:first_name, :last_name)
    end

    def film_actor_params
      params.require(:film_actor).permit(:actor_id, :film_id)
    end

end
