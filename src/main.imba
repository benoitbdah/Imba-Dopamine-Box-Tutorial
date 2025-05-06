import {Habit} from "./habit"
import './habit-group'
import './habit-item'
import './habit-adder'
import './dopamine-box'
import {fs} from 'fs'
# import {path} from 'path'
const path = require('path')


const projectDescription = "Scrimba’s Imba tutorial “dopamine-box” is an interactive course that teaches you the basics of the Imba programming language by guiding you through building a sleek Dopamine Box app to log your daily activities and mood. The course covers Imba syntax, custom tags, inline and scoped styles, event handling, data binding, managing state, lifecycle methods, and integrating with LocalStorage. By the end, you'll have hands-on experience building a web app UI with Imba and a solid foundation to create your own projects"


global css 
	@root
		$panel-space:30px @lt-sm:15px
		$icon-radius:15px @lt-sm:8px
		$icon-space:10px @lt-sm:5px
		$icon-size:70px @lt-sm:44px
		$default-speed:350ms
		$default-ease:ease
		$default-tween:all $default-speed $default-ease

	body bgc:#F9FAFC


tag App
	css 
		nav d:box g:4 c:blue6 mb:20px
			a p:10px 20px rd:10px 
				bgc:transparent @focus:blue1 @hover:blue2
			a.active bgc:blue1
		.tab d:box h:100%
		.description px:30px

	<self>
		<nav>
			<a .active route-to='/dopamine-box'> "Dopamine Box"
			<a route-to='/about'> "About"

		<div .tab>
			<div route='/dopamine-box'>
				<dopamine-box>

			<div route='/about'>
				<div .description> <p> projectDescription

imba.mount <App>


