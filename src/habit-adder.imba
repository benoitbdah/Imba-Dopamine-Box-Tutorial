import {icons} from "./icons"

tag habit-adder
	css 
		bgc:cool2 p:10px rd:lg 
		header fw:500 fs:xs mb:5px mt:-5px c:cool5
		section form d:flex g:5px mb:20px
		button bgc:indigo5 @hover:indigo6 c:white rd:sm px:5px
		div flex:1
			input w:100% px:5px rd:sm

		section.icons bgc:white rd:lg
			$spacing:10px
			ofx:scroll d:grid gtc:repeat(auto-fit, minmax(50px, 1fr))
			grid-gap:$spacing p:$spacing
			button pos:relative rd:10px p:0 bgc:cooler1 maw:60px
			button@before content:"" pb:100% d:block
			.icon-view inset:5px d:flex ja:center
			button@focus outline:0
			button@hover bgc:cooler3/50
			button@focus shadow:0 0 0 2px cooler4/25
	

	
	def handleSubmit evt
		let icon_text = evt.target.elements["icon-name"].value
		let icon = Object.entries(icons).filter(do(i) i[1].title===icon_text)[0]
		let icon_index = icon ? icon[0] : "untitled"
		emit "addHabit", icon_index
		self.name = ""
			 
	<self>
		<section>
			<header> "Add Habit"
			<form @submit.prevent=handleSubmit>
				<div> <input name="icon-name" bind=name placeholder="Enter a new habit">
				<button type="submit"> "Add"
		<section .icons>
			for own name, icon of icons
				<button .icon>
					<div .icon-view>
						<svg 
							src=icons[name]..svg
							@click=emit("addHabit", name)
							>	