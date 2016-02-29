require 'json'
require 'ffaker'

json_file = File.open('sun_performances_remote.json')

json = JSON.load json_file

performances = json["performances"]
performances_with_id = []

performances.each do |a|
 a["id"] = FFaker::Guid.guid
 performances_with_id << a
end

File.open('performances_with_ids.json', 'w') do |f|
  f.write performances_with_id.to_json
end


