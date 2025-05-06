import {Habit} from "./habit"
import {icons} from "./icons"
import {persistData} from './persist'

tag habit-item
	prop habit
	prop editing = false

	def onInput e
		let icon = Object.entries(icons).filter(do(i) i[1].title === e.target.value)
		self.habit.name = icon[0][0] if icon[0]

	def edit
		self.editing=!self.editing
		emit "persist"

	css 
		input
			w:100% c:cool5 ta:center rd:sm
		.item 
			tween:all 300ms ease
			c:cool5 fw:500 fs:xs rd:md p:5px
			s:70px @xs:90px bgc:cooler2
			d:vflex g:5px ja:center
			&.done bgc:emerald5 c:white

		.updates
			d:flex jc:space-between
			.edit, .delete
				fs:xxs c:cooler4 @hover:blue5 bgc:transparent

	<self>
		if editing
			<div 
				.item .done=self.habit.done 
				@click.shift=edit
				>
				<input 
					value=icons[self.habit.name]..title
					@input=onInput
					>
		else
			<button 
				.item 
				.done=habit.done 
				disabled=!icons[self.habit.name]
				bind=habit.done
				@click=emit("toggleHabit", self.habit)
				@click.alt=emit("deleteItem", habit)
				@click.shift=edit
				>
				if icons[habit.name]
					<svg src=icons[habit.name]..svg>
				else 
					<span> "Choose an habit"