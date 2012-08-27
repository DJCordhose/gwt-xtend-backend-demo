package de.zeigermann.xtend.gwtdemo.client;

class AsyncCallbackExtensions {
	def static <T> DefaultAsyncCallback<T> onSuccess((T)=>void handler) {
		new DefaultAsyncCallback<T> => [
			successHandler = handler
		]
	}
	def static <T> DefaultAsyncCallback<T> onFailure((Throwable)=>void handler) {
		new DefaultAsyncCallback<T> => [
			failureHandler = handler
		]
	}
	
	def static <T> DefaultAsyncCallback<T> onFailure(DefaultAsyncCallback<T> callBack, (Throwable)=>void handler) {
		callBack => [
			failureHandler = handler
		]
	}
}
