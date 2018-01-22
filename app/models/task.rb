class Task < ApplicationRecord
  
  #Association with user model
  belongs_to :user
  #Association with activities model
  has_many :activities

  #Validating description and length
  validates_presence_of :description, :message => "Debe ingresar una descripción"
  validate :description_length

  #Method for validate description length
  def description_length
  	if description.length > 50
  		errors.add(:description, "La descripción no puede ser mayor a 50 caracteres")
  	end
  end

end
