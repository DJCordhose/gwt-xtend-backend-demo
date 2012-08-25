package de.zeigermann.xtend.gwtdemo.shared;

import com.google.gwt.user.client.rpc.AsyncCallback;

public interface ValidationServiceAsync {

	void isValid(String input, AsyncCallback<Boolean> callback);

}
