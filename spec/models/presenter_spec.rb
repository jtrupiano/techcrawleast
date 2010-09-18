require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Presenter Model" do
  it 'can be created' do
    @presenter = Presenter.new
    @presenter.should_not be_nil
  end
end
