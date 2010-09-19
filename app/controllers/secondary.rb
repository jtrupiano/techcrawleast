TechcrawleastCom.controllers :secondary do
  layout :secondary
  get :presenters, :map => "/presenters" do
    @presenters = Presenter.all
    render 'secondary/presenters'
  end
  
end
