import {Habit} from './habit'

const localStorageKey = 'dopamine-box-data'

export def persistData data
	localStorage.setItem localStorageKey, JSON.stringify(data)

export def loadData
	const dataString = localStorage.getItem localStorageKey

	if dataString
		try
			let dataObject = JSON.parse dataString
			dataObject.map(do(o) new Habit(o.name, o.done, o.id))
		catch
			return []
	else
		return []

export def clearData
	localStorage.removeItem(localStorageKey)