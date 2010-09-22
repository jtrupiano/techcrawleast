class Presenter < ActiveRecord::Base
  belongs_to :event

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => 'public/system/attachment/logo/:id/:style/:filename',
    :url  => '/system/attachment/logo/:id/:style/:filename'
end
