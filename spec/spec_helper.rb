# frozen_string_literal: true
Dir[File.dirname(__FILE__) + '/../lib/**/app.rb'].each do |file|
  require_relative file
end
