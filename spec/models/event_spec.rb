require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Event Model" do
  it 'can be created' do
    @event = Event.new
    @event.should_not be_nil
  end
end
