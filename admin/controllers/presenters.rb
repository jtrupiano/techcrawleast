Admin.controllers :presenters do

  get :index do
    @presenters = Presenter.all
    render 'presenters/index'
  end

  get :new do
    @presenter = Presenter.new
    render 'presenters/new'
  end

  post :create do
    @presenter = Presenter.new(params[:presenter])
    if @presenter.save
      flash[:notice] = 'Presenter was successfully created.'
      redirect url(:presenters, :edit, :id => @presenter.id)
    else
      render 'presenters/new'
    end
  end

  get :edit, :with => :id do
    @presenter = Presenter.find(params[:id])
    render 'presenters/edit'
  end

  put :update, :with => :id do
    @presenter = Presenter.find(params[:id])
    if @presenter.update_attributes(params[:presenter])
      flash[:notice] = 'Presenter was successfully updated.'
      redirect url(:presenters, :edit, :id => @presenter.id)
    else
      render 'presenters/edit'
    end
  end

  delete :destroy, :with => :id do
    presenter = Presenter.find(params[:id])
    if presenter.destroy
      flash[:notice] = 'Presenter was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Presenter!'
    end
    redirect url(:presenters, :index)
  end
end