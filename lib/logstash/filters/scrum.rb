# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This example filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::Scrum < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   scrum {
  #     weather => ["fieldname"]
  #   }
  # }
  #
  config_name "scrum"

  # Replace the message with this value.
  config :weather, :validate => :array

  def register
    # Add instance variables
  end # def register
  
  def filter(event)
    
  weather(event) if @weather
  filter_matched(event)
  end # def filter
    
   
   
    $i=0
    $j=0
    $k=0
    $temp = Array.new()
    $metrics = Array.new()
  def weather(event)
    @weather.each do |field|
      $i = ($i + 1) 
      $temp[$i] = event[field]
     # field = field + 1
     end # end do 
     
     while $j < $i 
        $j = ($j + 1)
        x = $temp[$j-3].to_f
        y = $temp[$j-2].to_f
        z = $temp[$j-1].to_f
        l = (x+y+z)/3
        $metrics[$j] = l
     end
     
     @weather.each do |field|
      $k +=1
      result = $metrics[$k] 
      event[field] = result
    end # end  @weather.each do    
  end # end weather(event)
    
    
    
end # class LogStash::Filters::Example
