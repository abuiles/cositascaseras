class AddAddressAndPhoneNumberAndDeliveryMethodAndPaymentOptionsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :address, :string
    add_column :stores, :phone_number, :string
    add_column :stores, :contact_email, :string
    add_column :stores, :delivery_options, :text
    add_column :stores, :payment_options, :text
  end
end
