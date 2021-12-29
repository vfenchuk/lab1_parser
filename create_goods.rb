require 'csv'

class Create
    def create_goods(html)
        goods = []
        doc = Nokogiri::HTML(html)
            doc.css(".catalog-grid__cell").each do |item|
            name = item.css('.goods-tile__title').map { |name| name.text.strip }
            feedback_count = item.css('.goods-tile__reviews-link').map{ |feedback_count| feedback_count.text.strip }
            price = item.css('.goods-tile__price-value').map { |price| price.text.strip }
            goods.push(
                name: name.first,
                feedback_count: feedback_count.first,
                price: price.first
            )
        end
        return goods
    end
end