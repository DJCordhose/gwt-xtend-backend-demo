package de.zeigermann.xtend.gwtdemo.shared;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

@RemoteServiceRelativePath("validate")
public interface ValidationService extends RemoteService {
	public boolean isValid(String input);
}
