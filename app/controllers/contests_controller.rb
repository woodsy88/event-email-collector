class ContestsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_contest, only: [:edit, :show, :update, :destroy] 

    def index
        @contests = Contest.all
    end

    def new
        @contest = Contest.new
    end

    def show
    end

    def create
        @contest = Contest.new(contest_params)
        @contest.user_id = current_user.id
        respond_to do  |format|
            if @contest.save
                format.html {redirect_to(contests_path)}
            else
                format.html { render 'new' }
            end
        end        
    end

    def edit    
    end

    def destroy
        @contest.destroy
        respond_to do |format|
            format.html { redirect_to contests_url, notice: 'contest was successfully destroyed.' }
        end        
    end

    def update
        respond_to do |format|
            if @contest.update(contest_params)
                format.html { redirect_to (contests_path) }
                else
                format.html { render :edit }
            end  
        end           
    end    

  
    private

    def set_contest
        @contest = Contest.find(params[:id])
    end

    def contest_params
        params.require(:contest).permit(:company, 
                                    :name, 
                                    :description, 
                                    :website,
                                    :status,
                                    )
    end

end
