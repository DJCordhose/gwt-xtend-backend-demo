package de.zeigermann.xtend.gwtdemo.client

import com.google.gwt.core.client.EntryPoint
import com.google.gwt.core.client.GWT
import com.google.gwt.user.client.ui.Button
import com.google.gwt.user.client.ui.Label
import com.google.gwt.user.client.ui.TextBox
import de.zeigermann.xtend.gwtdemo.shared.ValidationService
import de.zeigermann.xtend.gwtdemo.shared.ValidationServiceAsync

import static com.google.gwt.user.client.ui.RootPanel.*
import static de.zeigermann.xtend.gwtdemo.client.AsyncCallbackExtensions.*

class GwtWithXtendDemo implements EntryPoint {
	
	private ValidationServiceAsync service = GWT::create(typeof(ValidationService))

	override onModuleLoad() {
		
		val nameField = new TextBox => [
			get("nameFieldContainer").add(it)
			text = 'Input'
			focus = true
			selectAll
		]
		
		val errorLabel = new Label => [
			get("errorLabelContainer").add(it)
		]
		
		new Button("Validate") => [
			get("sendButtonContainer").add(it)
			addStyleName("sendButton")
			addClickHandler [
				GWT::log("Clicked")
				errorLabel.text = ""
				service.isValid(nameField.text, handle[
						if (exception != null) {
							errorLabel.text = exception.message
						} else {
							errorLabel.text = if (result == Boolean::TRUE) "Ok" else "Error"
						}
					])
			]
		]

	}
}
