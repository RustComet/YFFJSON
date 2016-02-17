require 'json'
require 'ffaker'

json_file = File.open('artists_remote.json')

json = JSON.load json_file

artists = json["artists"]
artists_with_id = []

artists.each do |a|
 a["id"] = FFaker::Guid.guid
 artists_with_id << a
end

File.open('generated_ids.json', 'w') do |f|
  f.write artists_with_id.to_json
end


