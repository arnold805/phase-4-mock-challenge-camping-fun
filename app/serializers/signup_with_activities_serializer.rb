class SignupWithActivitiesSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :activity
end
