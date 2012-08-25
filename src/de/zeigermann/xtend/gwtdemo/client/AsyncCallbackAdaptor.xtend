package de.zeigermann.xtend.gwtdemo.client

import org.eclipse.xtext.xbase.lib.Procedures$Procedure1
import com.google.gwt.user.client.rpc.AsyncCallback
import com.google.gwt.user.client.Window


class AsyncCallbackAdaptor<T> implements AsyncCallback<T> {

	private Procedure1<T> successCallback
	private Procedure1<Throwable> failureCallback
	
    new(Procedure1<T> successCallback) {
        this.successCallback = successCallback
        this.failureCallback = [caught | Window::alert(caught.toString)]
    }
    
    new(Procedure1<T> successCallback, Procedure1<Throwable> failureCallback) {
        this.successCallback = successCallback
        this.failureCallback  = failureCallback
    }

    override onFailure(Throwable caught) {
        failureCallback.apply(caught)
    }
    
    override onSuccess(T result) {
        successCallback.apply(result)
    }
}
