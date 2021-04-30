class Name < ActiveRecord::Base 
    belongs_to :user

    validates :birthname, :user_id, presence: true
    # validates :description, presence: true
end
