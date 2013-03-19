require 'json'

Studienplaner.controllers :studienplans do
  get :index, :map => "/" do
    @plans = Studienplan.all
    render 'studienplans/index'
  end

  get :show, with: :id do
    raise :not_implemented
    @plan = Studienplan.get(params[:id])
    @available_module_names = Modul.all.map {|m| m.name}
    p @available_module_names
    render 'studienplans/show'
  end

  post :add_module do
    raise :not_implemented
    @plan = Studienplan.get(params[:studienplan_id])
    @modul = Modul.first(name: params[:modul_name])
    return "Scary Error message :(" if @plan.nil? or @modul.nil?

    @plan.moduls << @modul
    @plan.save
    redirect url(:studienplans, :show, id: params[:studienplan_id])
  end

  get :delete, with: :id do
    raise :not_implemented
    @plan = Studienplan.get(params[:id])
    @plan.destroy
    redirect url(:studienplans, :index)
  end

  post :create do
    @studienplan = Studienplan.new params['studienplan']
    @studienplan.studiengang = Studiengang.get(plan_params["studiengang"])
    begin
      @studienplan.save
      flash[:notice] = "Studienplan #{@studienplan.name} wurde angelegt"
      redirect url(:studienplans, :show, id: @studienplan.id)
    rescue DataMapper::SaveFailureError
      raise @studienplan.errors.inspect unless @studienplan.errors.empty?
      raise @studienplan.studiengang.errors.inspect
    end
  end
end
