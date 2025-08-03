json.extract! customer_info, :id, :full_name, :contact, :identication, :employment, :employer, :income, :expenses, :created_at, :updated_at
json.url customer_info_url(customer_info, format: :json)
