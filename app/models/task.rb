class Task < ApplicationRecord
  
  #Association with user model
  belongs_to :user
  #Association with activities model
  has_many :activities, dependent: :destroy

  #Validating description and length
  validates_presence_of :description, :message => "Debe ingresar una descripción"
  validate :description_length

  #Method for validate description length
  def description_length
  	if description.length > 80
  		errors.add(:description, "La descripción no puede ser mayor a 80 caracteres")
  	end
  end

end
