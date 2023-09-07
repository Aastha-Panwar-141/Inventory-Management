class Customer < User
    include Validatable
    has_one :cart
end
