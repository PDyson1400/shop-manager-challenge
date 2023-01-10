require_relative "./app"

def reset_table
    seed_sql = File.read('./spec/seeds_shop_manager.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
    connection.exec(seed_sql)
end

RSpec.describe "app.rb application class testing" do
    before(:each) do
        reset_table
    end


    it "should be able to list all items" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Here is the list of items:")
        expect(io).to receive(:puts).with("1 - Apple $1.00 100\n2 - Pork Pie $3.00 20\n3 - Cherry Bakewell $2.00 10\n4 - Beef Stew $5.00 40\n5 - Steamed Vegetables $1.00 100\n6 - Mashed Potato $1.00 50\n7 - Vegan Lasagna $4.00 50")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end

    it "should be able to list all orders" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Here is the list of orders:")
        expect(io).to receive(:puts).with("1 - Jimmy Brownsocks : 1847-01-22\n2 - Alicia Timberfoot : 1847-01-24\n3 - Kyle : 1847-01-29\n4 - Sir Thomas III : 1847-02-04\n5 - Princess Violet : 1847-03-06\n6 - Jimmy Brownsocks : 1847-06-13")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end

    it "should be able to list the items in an order" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Which order?")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("Here are the items in order 5")
        expect(io).to receive(:puts).with("Pork Pie\nSteamed Vegetables\nVegan Lasagna")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end

    it "should be able to list the orders of an item" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Which item?")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("Here are the orders of 2")
        expect(io).to receive(:puts).with("4\n5")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end

    it "should create an item and be interactable" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Item name?")
        expect(io).to receive(:gets).and_return("Rabbit Stew")
        expect(io).to receive(:puts).with("Item price?")
        expect(io).to receive(:gets).and_return("$6.00")
        expect(io).to receive(:puts).with("Item quantity?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end

    it "should be able to take an order and be interactable" do
        io = double(:io)
        app = Application.new(
        'shop_manager',
        io,
        ManagerRepository.new
        )

        expect(io).to receive(:puts).with("Welcome to the Shop Manager!")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("6")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Order customer?")
        expect(io).to receive(:gets).and_return("Fred")
        expect(io).to receive(:puts).with("Order date? YYYY-MM-DD")
        expect(io).to receive(:gets).and_return("1847-10-02")
        expect(io).to receive(:puts).with("Items in order? '1 2 3 4'")
        expect(io).to receive(:gets).and_return("2 3 4")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("Which order?")
        expect(io).to receive(:gets).and_return("7")
        expect(io).to receive(:puts).with("Here are the items in order 7")
        expect(io).to receive(:puts).with("Pork Pie\nCherry Bakewell\nBeef Stew")
        expect(io).to receive(:puts).with(" ")
        expect(io).to receive(:puts).with("What would you like to do?")
        expect(io).to receive(:puts).with("1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit")
        expect(io).to receive(:puts).with("Enter your choice:")
        expect(io).to receive(:gets).and_return("7")

        app.run
    end
end