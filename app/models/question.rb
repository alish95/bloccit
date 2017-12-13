class Question < ApplicationRecord
     attribute :title, :string
     attribute :body, :text
     attribute :resolved, :boolean

     has_many :answers
end
