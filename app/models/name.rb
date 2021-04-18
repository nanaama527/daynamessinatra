class Name < ActiveRecord::Base 
    belongs_to :user

    validates :birthname, presence: true
    # validates :description, presence: true
end
