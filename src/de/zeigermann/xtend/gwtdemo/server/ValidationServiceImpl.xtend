package de.zeigermann.xtend.gwtdemo.server

import com.google.gwt.user.server.rpc.RemoteServiceServlet
import de.zeigermann.xtend.gwtdemo.shared.ValidationService

@SuppressWarnings("serial")
class ValidationServiceImpl extends RemoteServiceServlet implements
		ValidationService {

	override boolean isValid(String input) {
//		if (input.empty)
//			throw new IllegalArgumentException("Putt")
		return !input.empty
	}
}
