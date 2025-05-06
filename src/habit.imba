import {nanoid} from 'nanoid'

export class Habit
	name
	done
	id

	def constructor name = "Untitled", done = false, id
		self.name = name
		self.done = done
		self.id = id ?? nanoid()
	
	def toString do JSON.stringify self

	def toggle
		self.done = !self.done
		self