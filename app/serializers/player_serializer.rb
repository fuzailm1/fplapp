class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost, :selected_by, :transfers_out_this_gw, :transfers_in_this_gw,
             :points, :ppg, :goals, :assists, :clean_sheets, :fixture_list
end
