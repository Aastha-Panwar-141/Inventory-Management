module Validatable
    extend ActiveSupport::Concern
    included do
        validates :first_name, :last_name, presence: true
        validates :email, uniqueness: true, email: true
    end
end
