class RocksController < ApplicationController

    def index
        rocks = Rock.all 
        render json: rocks
    end

    def create
        rock = Rock.create(rock_params)
        # render json: rock

        if rock.valid?
          render json: rock
        else
          render json: rock.errors, status: 422
        end


    end

    def update
        rock = Rock.find(params[:id])
        rock.update(rock_params)
        if rock.valid?
          render json: rock
        else
          render json: rock.errors, status: 422
        end
    end

    def destroy
        rock = Rock.find(params[:id])
        rock.delete()
        render json: rock
    end

    private
    def rock_params
        params.require(:rock).permit(:name, :color, :brilliance, :hardness)
    end

end
