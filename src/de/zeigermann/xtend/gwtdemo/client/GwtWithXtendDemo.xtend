package de.zeigermann.xtend.gwtdemo.client;

import static extension de.zeigermann.xtend.gwtdemo.client.AsyncCallbackExtensions.*

import de.zeigermann.xtend.gwtdemo.shared.ValidationService
import de.zeigermann.xtend.gwtdemo.shared.ValidationServiceAsync

import com.google.gwt.core.client.EntryPoint
import com.google.gwt.core.client.GWT
import com.google.gwt.user.client.ui.Button
import com.google.gwt.user.client.ui.Label
import com.google.gwt.user.client.ui.RootPanel
import com.google.gwt.user.client.ui.TextBox

class GwtWithXtendDemo implements EntryPoint {
	
	private ValidationServiceAsync service = GWT
			::create(typeof(ValidationService))

	override onModuleLoad() {
		val sendButton = new Button("Validate")
		val nameField = new TextBox();
		nameField.setText("Input");
		val errorLabel = new Label();

		sendButton.addStyleName("sendButton");

		RootPanel::get("nameFieldContainer").add(nameField)
		RootPanel::get("sendButtonContainer").add(sendButton)
		RootPanel::get("errorLabelContainer").add(errorLabel)

		nameField.setFocus(true)
		nameField.selectAll()

		sendButton.addClickHandler [
			GWT::log("Clicked")
			errorLabel.text = ""
			service.isValid(nameField.text, 
				onSuccess [result | errorLabel.text = if (result) "Ok" else "Error"]
				.onFailure [caught | errorLabel.text = caught.toString]
			)
		]
	}
}
