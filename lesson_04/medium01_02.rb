class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities
    @quantity = updated_count if updated_count >= 0
  end
end

# the error here is that the instance variable is not
# called correctly in the update_quantity method.
# line 11 should be @quantity = ....

entry = InvoiceEntry.new("widget", 5)
entry.update_quantity(6)
puts entry.quantity
