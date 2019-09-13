# require './lib/ruby-caldav.rb'
require 'ruby-caldav'

puts "Test"
cal = CalDAV::Client.new(uri: "http://prattennas.local:5000/caldav/openhab/admin--waswabue", user: "openhab", password: "habopen")
=begin
result = cal.create_event do |event|
  event.dtstart = Icalendar::Values::DateTime.new "20190912T100000", :tzid => "Europe/London"
  event.dtend = Icalendar::Values::DateTime.new "20190912T100000", :tzid => "Europe/London"
  event.summary = "Some Meeting"
  event.description = "Meeting about something"
  event.categories = "Test"
  event.categories = "Test2"
  event.rrule = Icalendar::Values::Recur.new("FREQ=WEEKLY;COUNT=10;BYDAY=WE;WKST=SU")
end
result = cal.create_event do |event|
  event.dtstart = Icalendar::Values::Date.new "20190912"
  event.dtend = Icalendar::Values::Date.new "20190912"
  event.summary = "Some Meeting"
  event.description = "Meeting about something"
  event.comment = ["Comment 1", "Comment2"]
  event.categories = ["Category1", "Category2"]
end
=end

req = cal.find_events(start: "20190913T000000", end:"20231231T000000") do |xml|
  CalDAV::Request.prop_equals "CATEGORIES", "Test2", xml
end

puts "*"*20 + "RESULTS" + "*"*20
req.each_with_index do |event, index|
  puts "#{index} #{event.uid} #{event.summary} #{event}"
end

ev = cal.find_event req.first.uid
puts ev.to_ical

#ev.dtstart = Icalendar::Values::DateTime.new ev.dtstart.value.next_day(1), :tzid => "Europe/London"  
#cal.update_event ev

#req.each do |event|
#  cal.delete_event event.uid
#end
