{
  :short_date  => "%x",              # 04/13/10
  :long_date   => "%a, %b %d, %Y"   # Tue, Apr 13, 2010
}.each do |k, v|
  Time::DATE_FORMATS.update(k => v)
end
