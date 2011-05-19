module MultiParameterAttributes

  def filter_time(attributes, name)
     attrs = attributes.collect do |key, value|
       if key =~ /^#{Regexp.escape(name.to_s)}\((\d+)(\w)\)$/
         [$1.to_i, value.send("to_#$2")]
       end
     end.compact.sort_by(&:first).map(&:last)
     Time.zone.local(*attrs) unless attrs.empty?
  end

end

