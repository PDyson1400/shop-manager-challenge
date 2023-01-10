require "manager_repository"

def reset_table
    seed_sql = File.read('spec/seeds_shop_manager.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
    connection.exec(seed_sql)
end
  
RSpec.describe "Shop_manager testing" do
    before(:each) do 
        reset_table
    end

    xit "lists all of the items" do
        repo = ManagerRepository.new
        expect(repo.list_items[0].name).to eq "Apple"
        expect(repo.list_items.last.price).to eq "$4.00"
    end

    xit "lists all of the orders" do
        repo = ManagerRepository.new
        expect(repo.list_orders[0].customer).to eq "Jimmy Brownsocks"
        expect(repo.list_orders.last.order_date).to eq "1847-06-13"
    end

    xit "lists the item from a specific order" do
        repo = ManagerRepository.new
        expect(repo.items_in_order(6)[0].name).to eq "Apple"
        expect(repo.items_in_order(6).last.quantity).to eq 10
    end

    xit "lists the orders which have a specific item" do
        repo = ManagerRepository.new
        expect(repo.orders_with_item(2)[0].id).to eq 4
        expect(repo.orders_with_item(2).last.customer).to eq "Princess Violet"
    end

    xit "creates an item" do
        repo = ManagerRepository.new
        item = Items.new
        item.name = "Rabbit Stew"
        item.price = "$6.00"
        item.quantity = 20
        repo.create_item(item)

        expect(repo.list_items.last.price).to eq "$6.00"
        expect(repo.list_items.last.name).to eq "Rabbit Stew"
        expect(repo.list_items.last.quantity).to eq 20
    end

    xit "creates an order" do
        repo = ManagerRepository.new
        order = Orders.new
        order.customer = "James Hemmingway"
        order.order_date = "1847-07-24"
        items = [1, 2, 5]

        repo.create_order(order, items)

        expect(repo.list_orders.last.order_date).to eq "1847-07-24"
        expect(repo.list_orders.last.customer).to eq "James Hemmingway"

        expect(repo.orders_with_item(5).last.id).to eq 7
        expect(repo.orders_with_item(2).last.customer).to eq "James Hemmingway"
    end
end
  