class StoreLoader
  def self.load_stores(stores)
    stores.map do |store_data|
      Store.new(store_data)
    end
  end
end
