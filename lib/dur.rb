require 'ruby-duration'

module Dur

  def word_time_to_seconds(dur)
    
    return dur if /^\d+$/.match dur
    match = dur.scan(/(\d+)\s?(\w+)/)
    seconds = 0
    match.each do |m|
      seconds += hour_min_sec_to_seconds(m[0], m[1])
    end
    seconds
  end

  def hour_min_sec_to_seconds(value, unit)
    seconds = 0
    if(%w.hr hrs hours hour h..include? unit)
      seconds += value.to_i * 3600
    end
    if(%w.mins min minutes minute m..include? unit)
      seconds += value.to_i * 60
    end
    if(%w.secs sec seconds second s..include? unit)
      seconds += value.to_i
    end
    return seconds
  end

  def seconds_to_iso8601(seconds)
    Duration.new(seconds).iso8601
  end
  
end