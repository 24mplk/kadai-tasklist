class Task < ApplicationRecord
   validates :status, presence: true, length: { minimum: 10 }
end
