class User < ApplicationRecord
    include Validatable
    self.inheritance_column= :user_type
end
