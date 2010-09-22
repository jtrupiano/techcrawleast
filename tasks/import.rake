def read_website(raw)
  raw =~ /\:\/\// ? raw : "http://#{raw}"
end

# Paperclip + ruby 1.9.2 suck
def save_with_logo(p, logo)
  p.logo = File.new(logo) if File.exists?(logo) && !File.directory?(logo)
  puts "Saving #{p.name}"
  begin
    p.save!
  rescue
    puts "Trying to save again"
    p.logo = File.new(logo) if File.exists?(logo) && !File.directory?(logo)
    p.save!
  end
end

namespace :import do
  desc 'Import presenters exported to CSV from the Google Form'
  task :presenters do
    tce = Event.create!(:name => 'Tech Crawl East', :date => Date.new(2010, 9, 16), :year => 2010)
    require 'csv'
    CSV.foreach('presenters.csv') do |row|
      next if row[0] == 'Timestamp'
      p = Presenter.new(:name => row[5],
                        :website => read_website(row[15]),
                        :short_description => row[1],
                        :primary_contact => row[4],
                        :primary_contact_email => row[6],
                        :primary_contact_phone_number => row[10],
                        :location => row[11],
                        :event_id => tce.id)
      logo = "tmp/#{row[16]}"
      save_with_logo(p, logo)
    end
  end

  desc 'Delete all events and presenters'
  task :clear do
    Presenter.delete_all
    Event.delete_all
    `rm -rf public/system/presenter/logo`
  end
end
