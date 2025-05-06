import {Habit} from "./habit"
import {persistData, loadData} from './persist'
import {Howl} from 'howler'

tag dopamine-box
	prop habits = loadData!
	prop showAdder = false
	prop celebrateSound = new Howl({src: './celebrate.mp3'})

	def addHabit evt
		if evt.detail === "untitled" 
			window.alert("Not an icon name")
			return

		const found_duplicate = self.habits.find(do(h) h.name === evt.detail)
		unless found_duplicate
			habits.push(new Habit(evt.detail))
		else
			window.alert("The habit already exists!")

		persistData self.habits

	def resetAll()
		h.done = false for h in self.habits
		self.persist!
		
	def deleteItem evt
		self.habits = self.habits.filter do(h) h !== evt.detail
		self.persist!

	def toggleHabit evt
		let dones = self.habits.filter! do(h) h.done === false
		if dones.length === 0
			self.celebrateSound.play!
			console.log "Celebrate!"
			setTimeout(&, 2000) do 
				self.resetAll!
				imba.commit!
		self.persist!

	def clearData 
		self.habits = []
		self.persist!

	def persist
		persistData self.habits

	def setup
		if self.habits.length === 0 then this.showAdder = true


	css
		.container d:vflex jc:center ai:stretch
			.panel-area d:vflex ja:center flg:1 mt:0 mb:$panel-space
				.controls mt:10px d:flex g:10px
					button bgc:transparent rd:sm td@hover:underline fs:xs cursor:pointer

			.chooser-area tween:$default-tween h:0 pos:relative of:hidden
				&.on h:100
				.chooser inset:0 mx:$panel-space ofy:scroll bgc:cooler2 rd:10px
	

	<self>
		<div .container>
			<div .panel-area>
				<habit-group 
					habits=habits 
					@deleteItem=self.deleteItem(e)
					@toggleHabit=self.toggleHabit(e)
					>

				<div.controls>
					<button bind=self.showAdder> "Toggle Habits"
					<button @click=self.resetAll> "Reset All"
					<button @click=self.clearData> "Clear All"

			<div .chooser-area .on=self.showAdder>
				<div .chooser>
					<habit-adder @addHabit=addHabit>
