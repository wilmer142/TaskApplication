class Activity < ApplicationRecord
  
	#Association with task model
  belongs_to :task
  
  #Validating activity arguments
  validates_presence_of :end_date, :message => "Debe ingresar una fecha de realización"
  validates_presence_of :hours, :message => "Debe ingresar la cantidad de horas"
  validates_presence_of :description, :message => "Debe ingresar una descripción"

end
