class AddContactTypeToInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :contact_type, :string
  end
end
