def read_website(raw)
  raw =~ /\:\/\// ? raw : "http://#{raw}"
end

namespace :import do
  desc 'Import presenters exported to CSV from the Google Form'
  task :presenters do
    tce = Event.create!(:name => 'Tech Crawl East', :date => Date.new(2010, 9, 16), :year => 2010)
    require 'csv'
    CSV.foreach('presenters.csv') do |row|
      next if row[0] == 'Timestamp'
      Presenter.create!(:name => row[5],
                        :website => read_website(row[15]),
                        :short_description => row[1],
                        :primary_contact => row[4],
                        :primary_contact_email => row[6],
                        :primary_contact_phone_number => row[10],
                        :location => row[11],
                        :event_id => tce.id)
    end
  end

  desc 'Delete all events and presenters'
  task :clear do
    Presenter.delete_all
    Event.delete_all
  end
end
