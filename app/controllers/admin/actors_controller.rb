class Admin::ActorsController < ApplicationController

  before_action :confirm_logged_in

  skip_before_action :verify_authenticity_token
   
  def index
    
  end

  def search
    @actors = Actor.search(params[:actor_search]).sorted
    if @actors.blank?
      flash[:notice] = "No match found"
    else
      flash[:notice] = nil
    end
  end

  def letter
    @actors = Actor.letter(params[:first_letter])
    if @actors.blank?
      flash[:notice] = "No match for this letter"
    else
      flash[:notice] = nil
    end    
  end

  def show
    @actor = Actor.find(params[:id])
    @actor_films = @actor.films

    @films = Film.sorted

    # @film_actor = FilmActor.new
  end

  def films
    @actor = Actor.find(params[:id])
    @found_films = Film.search(params[:film_search]).sorted
  end

  def unlink
    actor = Actor.find(params[:id])
    film = Film.find(params[:film_id])
    
    if actor.films.delete(film)
      redirect_to(admin_actors_path)
    else
      render('index')
    end  
  end

  def link
    actor = Actor.find(params[:id])
    film = Film.find(params[:film_id])

    if actor.films << film
      redirect_to(admin_actors_path)
    end
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
      redirect_to(admin_actors_path)
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

  private
    def actor_params
      params.require(:actor).permit(:first_name, :last_name)
    end

    def film_actor_params
      params.require(:film_actor).permit(:actor_id, :film_id)
    end

end
