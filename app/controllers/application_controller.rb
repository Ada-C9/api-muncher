require 'will_paginate/array'
class ApplicationController < ActionController::Base
  def not_found
  raise ActionController::RoutingError.new('Not Found')
end
end
