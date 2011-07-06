class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Progmatic Version Control',
                   :description =>
                   %{<p>
                     This book is a recp-based...
                     get you up and runn...
                     ...
                     up exp ... problems.
                     </p>},
                  :image_url => '/images/svn.jpg',
                  :price => 28.50)
  end

  def self.down
    Product.delete_all
  end
end
