import {Habit} from './habit'

tag habit-group
	prop habits = []

	css 
		.group 
			tween:all 200ms ease 
			d:flex jc:center flw:wrap g:10px @xs:30px 

	<self>
		<div.group>
			if self.habits.length === 0 
				<habit-item .empty habit=(new Habit("Choose an Habit"))>
			for h, i in habits
				<habit-item habit=h>

		