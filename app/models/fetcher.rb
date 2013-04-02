require 'mechanize'

class Fetcher
  def self.update_food_data
    @agent ||= Mechanize.new
    Food.update_all(available: false)
    @agent.get('http://www.comhanhthu.com/index.php?ht=cms&idcms=2')
    @agent.page.parser.css('ol li span strong span').each do |element|
      text = element.text
      next if text.length < 5
      if text.index('=')
        name, price = text.split('=').map(&:strip)
        Food.find_or_create_by_name_and_price(name, price[0..1]).update_attributes(available: true)
      else
        Food.find_or_create_by_name_and_price(element.text, 17000).update_attributes(available: true)
      end
    end
    Event.create(content: 'Updated data from HanhThu Website')
  end
end
