class Task < ApplicationRecord
  
  #Association with activities model
  has_many :activities

  #Validating description and length
  validate_presence_of :description, message: => "Debe ingresar una descripción"
  validate :descripcion_length

  #Method for validate description length
  def description_length
  	if description.length > 50
  		errors.add(:description, "La descripción no puede ser mayor a 50 caracteres")
  	end
  end
  
end
