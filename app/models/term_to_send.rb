class Term_to_send < ActiveHash::Base
  self.date = [
    {id: 1, name: "---"},
    {id: 2, name: "１~２日で発送"},
    {id: 3, name: "２~３日で発送"},
    {id: 3, name: "４~７日で発送"}
  ]

  include ActiveHash::Associations
  has_many :items
end