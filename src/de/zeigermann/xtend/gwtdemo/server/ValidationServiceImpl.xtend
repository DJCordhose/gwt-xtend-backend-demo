package de.zeigermann.xtend.gwtdemo.server

import de.zeigermann.xtend.gwtdemo.shared.GwtService

@GwtService
class ValidationServiceImpl {
	override Boolean isValid(String input) {
		return !input.empty
	}
}
