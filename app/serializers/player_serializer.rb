class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :selected_by, :xg, :xa,
             :points, :ppg, :goals, :assists, :clean_sheets, :fixture_list
end
