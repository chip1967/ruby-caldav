# require './lib/ruby-caldav.rb'
require 'ruby-caldav'

puts "Test"
cal = CalDAV::Client.new(uri: "http://prattennas.local:5000/caldav/openhab/admin--waswabue", user: "openhab", password: "habopen")

result = cal.create_event(start: "2019-09-12 10:00",
  end: "2019-09-12 12:00",
  title: "Some Meeting",
  description: "Meeting about something")

req = cal.find_events(start: "20111201T000000", end:"20231231T000000")
puts "*"*20 + "RESULTS" + "*"*20
req.each_with_index do |event, index|
  puts "#{index} #{event.uid} #{event.summary} #{event}"
end

puts result

cal.delete_event result.uid


