class SponsoredPost < ApplicationRecord
     attribute :title, :string
     attribute :body, :text
     attribute :price, :integer

     belongs_to :topic
end
