{
  short_date: '%x',
  long_date: '%a, %b %d, %Y',
  us: '%m/%d/%Y %I:%M %p',
  us_date: '%m/%d/%Y',
  us_time: '%I:%M %p'
}.each do |k, v|
  Time::DATE_FORMATS.update(k => v)
end
