class CamperWithActivitiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  belongs_to :activities
end
