class TabSerializer < ActiveModel::Serializer
  attributes :id, :date, :project_name, :task, :time_spent, :notes
  has_one :user
end
