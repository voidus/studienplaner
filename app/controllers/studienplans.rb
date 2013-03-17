require 'json'

Studienplaner.controllers :studienplans do
  get :index, :map => "/" do
    @plans = Studienplan.all
    render 'studienplans/index'
  end

  get :show, with: :id do
    @plan = Studienplan.get(params[:id])
    @available_module_names = Modul.all.map {|m| m.name}
    p @available_module_names
    render 'studienplans/show'
  end

  post :add_module do
    @plan = Studienplan.get(params[:studienplan_id])
    @modul = Modul.first(name: params[:modul_name])
    return "Scary Error message :(" if @plan.nil? or @modul.nil?

    @plan.moduls << @modul
    @plan.save
    redirect url(:studienplans, :show, id: params[:studienplan_id])
  end

  post :create do
    raise :not_implemented
  end
end
