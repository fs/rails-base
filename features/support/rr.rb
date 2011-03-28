require 'rr'

Cucumber::Rails::World.send(:include, RR::Adapters::RRMethods)
