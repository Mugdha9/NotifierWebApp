package com.notifier_application.beans;

public class NotebooksBean
{
	private String notebook_name;

	public NotebooksBean(String notebook_name) {
		super();
		this.notebook_name = notebook_name;
	}

	public String getNotebook_name() {
		return notebook_name;
	}

	public void setNotebook_name(String notebook_name) {
		this.notebook_name = notebook_name;
	}
}
