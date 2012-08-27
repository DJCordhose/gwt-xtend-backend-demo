package de.zeigermann.xtend.gwtdemo.client

import com.google.gwt.user.client.rpc.AsyncCallback
import org.eclipse.xtend.lib.Property
import com.google.gwt.core.client.GWT

class DefaultAsyncCallback<T> implements AsyncCallback<T> {
	
	@Property var (T)=>void successHandler
	@Property var (Throwable)=>void failureHandler

	override onFailure(Throwable caught) {
		if (getFailureHandler == null) {
			GWT::log(caught.toString)
		}
		getFailureHandler.apply(caught)
	}
	
	override onSuccess(T result) {
		getSuccessHandler?.apply(result)
	}
	
}