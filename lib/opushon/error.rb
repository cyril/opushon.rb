Dir[File.join File.dirname(__FILE__), 'error', '**' '*.rb'].each do |filename|
  require_relative filename
end
