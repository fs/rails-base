Factory.define :twitter_identity, :class => UserIdentity do |f|
  f.provider 'twitter'
  f.uid '1'
end
