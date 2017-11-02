desc "create a million numbers"
task :create_numbers => :environment do

  Array(1..1000).each do |v|
    Number.create do |n|
      n.value = v
    end
  end

  puts "All done!"

end
