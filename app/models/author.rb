class Author < ApplicationRecord

    #all authors have a name, no two authors have the same exact name 
    validates :name, presence: true, uniqueness: true

    validates :phone_number, length: {is: 10} 


end
