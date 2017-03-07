alphabet    = ('a'..'b')
url         = "https://www.drugs.com"

alphabet.each do |letter|

url          = "https://www.drugs.com"
letter       = "a"
sleep 2
main         = Nokogiri::HTML(open("#{url}/otc-#{letter}1.html"))
sleep 2
product_link = main.css('.column-list-2').css('li').css('a').first(5) do |link|
  sleep 2
  if Nokogiri::HTML(open("#{url}/otc/#{link}"))
    sleep 2
    product_page = Nokogiri::HTML(open("#{url}/otc/#{link}"))
    sleep 2
  else
    next
  end
  name         = product_page.css('b')[0].text.capitalize
  photo_url    = URI.encode(url + product_page.css('.drugImage').css('a').first['href'])
  product      = Product.new( name: name, photo_url: photo_url )
  p product.valid?
  product.save!
  sleep 3
end

