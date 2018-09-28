require 'ffaker'

puts "Seed starting, glhf"

circuit = Circuit.new(
  name: FFaker::HipsterIpsum.word.titleize,
  subtitle: FFaker::HipsterIpsum.phrase,
  content_title: FFaker::HipsterIpsum.phrase,
  content_subtitle: FFaker::HipsterIpsum.word.titleize,
  content: open("https://jaspervdj.be/lorem-markdownum/markdown.txt", { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }) { |io| io.read },
  header_image: open("https://picsum.photos/1920/1200/?random"),
  content_header_image: open("https://picsum.photos/1920/1200/?random"),
  shortcut: "p"
)
circuit.save!
puts "Circuit created."

10.times do |i|
  print "#{i}. Totem for circuit..."
  title = FFaker::HipsterIpsum.word.titleize + "#{rand(1...1000)}"
  cords = FFaker::Geolocation.boxed_coords([19.5120084910548, -101.612492081506], [19.5153254210529, -101.603630062921])
  totem = Totem.new(
    name: title,
    description: FFaker::HipsterIpsum.phrase,
    latitude: cords[0],
    longitude: cords[1],
    content: open("https://jaspervdj.be/lorem-markdownum/markdown.txt", { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }) { |io| io.read },
    main_image: open("https://picsum.photos/640/360/?random"),
    header_image: open("https://picsum.photos/1920/1200/?random"),
    infographic: open("https://picsum.photos/1200/1920/?random"),
    shortcut: "t#{i+1}",
    circuit: circuit
  ).save!
  print "OK"
  puts
end

Totem.all.each do |totem|
  puts "Totem##{totem.id}. Creating gallery and tips:"
  5.times do |i|
    puts "#{totem.id}. Image #{i+1}/5"
    totem.totem_images << TotemImage.new(image: open("https://picsum.photos/800/800/?random"))
  end

  10.times do |i|
    puts "#{totem.id}. Tip #{i+1}/10"
    totem.tips << Tip.new(content: FFaker::HipsterIpsum.phrase, rate: rand(0..5), approved: [true, false].sample)
  end
end

Circuit.all.each do |circuit|
  puts "Circuit##{circuit.id}. Creating gallery:"
  5.times do |i|
    puts "#{circuit.id}. Image #{i+1}/5"
    circuit.circuit_images << CircuitImage.new(image: open("https://picsum.photos/800/800/?random"))
  end
end

puts "Creating poll answers..."
100.times do |i|
  puts "#{i+1}/100"
  Poll.create(name: FFaker::Name.name, email: FFaker::Internet.email, origin: FFaker::Address.city, travel_preference_list: ["aire libre", "museos", "festivales", "comida"].sample(3))
end

puts "Creating Static Pages"
Page.create(title: "Contacto", content: open("https://jaspervdj.be/lorem-markdownum/markdown.txt", { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }) { |io| io.read })
Page.create(title: "Políticas de Privacidad", content: open("https://jaspervdj.be/lorem-markdownum/markdown.txt", { ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE }) { |io| io.read })

puts
puts "All done, baws."
