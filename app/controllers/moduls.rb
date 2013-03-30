Studienplaner.controllers :moduls do
  get :show, with: :id do
    if params[:id] =~ /^\d+$/
      @modul = Modul.find(params[:id])
    else
      @modul = Modul.where(key: params[:id])
    end
    render 'moduls/show'
  end

  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  
end
