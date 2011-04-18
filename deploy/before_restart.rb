::File.open("/tmp/dhdbg-#{__FILE__.gsub('/', '_')}", 'w') do |file|
  file.puts "#{release_path.sub(/releases\/\d+/, 'shared')}/config/database.yml='#{`cat #{release_path.sub(/releases\/\d+/, 'shared')}/config/database.yml 2>&1`}'"
  file.puts "#{release_path}/config/database.yml='#{`cat #{release_path}/config/database.yml 2>&1`}'"
  file.puts "#{release_path.sub(/releases\/\d+/, 'shared')}/config/memcached.yml='#{`cat #{release_path.sub(/releases\/\d+/, 'shared')}/config/memcached.yml 2>&1`}'"
  file.puts "#{release_path}/config/memcached.yml='#{`cat #{release_path}/config/memcached.yml 2>&1`}'"
  file.puts "bundle check: #{`su deploy -c 'cd #{release_path} && bundle check 2>&1'`}"
end
