class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end
  
  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# we could change attr_reader to attr_accessor, however that
# will add the writer method to product_name.  In the 
# application, we may not want to allow writing to the 
# @product_name instance variable
#
# in addition, we may in the application want to restrict
# updates only to the update_quantity method. In the future
# there may be logic in this method that we don't want to
# circumvent by allowing the programmer to use instance.quantity to directly update the instance variable.
