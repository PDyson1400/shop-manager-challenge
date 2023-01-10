require_relative 'lib/database_connection'
require_relative 'lib/manager_repository'

def reset_table
    seed_sql = File.read('./spec/seeds_shop_manager.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager' })
    connection.exec(seed_sql)
end

class Application
  def initialize(database_name, io, manager_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @manager_repository = manager_repository
    reset_table
  end

  def run
    reply = ""
    @io.puts "Welcome to the Shop Manager!"
    while reply != '7'
        @io.puts "What would you like to do?"
        @io.puts "1 - List all items\n2 - List all orders\n3 - List all the items in an order\n4 - list the orders of an item\n5 - Create an item\n6 - Create an order\n7 - Exit"
        @io.puts "Enter your choice:"
        reply = @io.gets.chomp
        case reply
        when "1"
            @io.puts " "
            @io.puts "Here is the list of items:"
            items = @manager_repository.list_items
            text = ""
            i = 1
            items.each do |item|
                text += "#{item.id} - #{item.name} #{item.price} #{item.quantity}"
                if i < items.length
                    text += "\n"
                end
                i += 1
            end
            @io.puts(text)
            @io.puts " "
        when "2"
            @io.puts " "
            @io.puts "Here is the list of orders:"
            orders = @manager_repository.list_orders
            text = ""
            i = 1
            orders.each do |order|
                text += "#{order.id} - #{order.customer} : #{order.order_date}"
                if i < orders.length
                    text += "\n"
                end
                i += 1
            end
            @io.puts(text)
            @io.puts " "
        when "3"
            @io.puts " "
            @io.puts "Which order?"
            order = @io.gets.chomp
            result = @manager_repository.items_in_order(order)
            text = ""
            i = 1
            result.each do |item|
                text += item.name
                if i < result.length
                    text += "\n"
                end
                i += 1
            end
            @io.puts("Here are the items in order #{order}")
            @io.puts(text)
            @io.puts " "
        when "4"
            @io.puts " "
            @io.puts "Which item?"
            item = @io.gets.chomp
            result = @manager_repository.orders_with_item(item)
            text = ""
            i = 1
            result.each do |order|
                text += "#{order.id}"
                if i < result.length
                    text += "\n"
                end
                i += 1
            end
            @io.puts("Here are the orders of #{item}")
            @io.puts(text)
            @io.puts " "
        when "5"
            @io.puts " "
            item = Items.new
            @io.puts "Item name?"
            item.name = @io.gets.chomp
            @io.puts "Item price?"
            item.price = @io.gets.chomp
            @io.puts "Item quantity?"
            item.quantity = @io.gets.chomp
            
            @manager_repository.create_item(item)
            @io.puts " "
        when "6"
            @io.puts " "
            order = Orders.new
            @io.puts "Order customer?"
            order.customer = @io.gets.chomp
            @io.puts "Order date? YYYY-MM-DD"
            order.order_date = @io.gets.chomp
            @io.puts "Items in order? '1 2 3 4'"
            items = @io.gets.chomp
            array = items.split(" ")
            array.map!{|num| num.to_i}

            @manager_repository.create_order(order, array)
            @io.puts " "
        when "7"
        else
            @io.puts "1-7 please"
        end
    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'shop_manager',
    Kernel,
    ManagerRepository.new
  )
  app.run
end